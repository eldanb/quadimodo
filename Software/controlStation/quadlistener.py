import socket
import struct
import threading
import Tkinter
import Queue
import statusframes
from controls import StatusLabel, ParameterInput
from manualcontrol import MotorManualFrame
from pidcontrols import MotorAutoFrame

UDP_IP = "0.0.0.0"
UDP_PORT = 4567

logEnabled = True



def writeToLog(line):
     if logEnabled:
          with open('/home/eldan/log.txt', 'a') as the_file:
               the_file.write(line)
               the_file.write('\n')
          
class QuadiCommThread(threading.Thread):
     def __init__(self,  *args, **kwargs):
          super(QuadiCommThread, self).__init__(*args, **kwargs)
          #self._stop_event = threading.Event()

          self.sock = socket.socket(socket.AF_INET, # Internet
                          socket.SOCK_DGRAM) # UDP
          self.sock.bind(('', UDP_PORT))

          self.lastGyY = 0
          self.lastAccY = 0
          self.lastPitch = 0

     def stop(self):
        self.sock.shutdown(socket.SHUT_RDWR)
        self.sock.close()

     def send(self, sendWhat):
          self.sock.sendto(sendWhat, self.quadaddr)

     def run(self):
          packetTypeStruct = struct.Struct("i")
          statusPacketStruct = struct.Struct("iiiiiiiiiiiiiii")
          pidStatusStruct = struct.Struct("iifffi")
          logReportHeaderStruct = struct.Struct("i")
          logReportEntryStruct = struct.Struct("iiiiii")

          self.quadaddr = ("192.168.1.104", 4567)
          print("Listening...")

          while True:
               data, addr = self.sock.recvfrom(1024) # buffer size is 1024 bytes
               packetType = packetTypeStruct.unpack_from(data)
               
               if packetType[0] == 0:
                    unpackedData = statusPacketStruct.unpack_from(data, 4)  
                    self.lastAccY =  unpackedData[2]
                    self.lastGyY =  unpackedData[5]
                    self.lastPitch = unpackedData[11]
                    guiQueue.put(UpdateStatus(unpackedData))
               elif packetType[0] == 101:
                    unpackedPidStatus = pidStatusStruct.unpack_from(data, 4) + ("---", self.lastAccY, self.lastGyY, self.lastPitch)    
                    writeToLog(",".join(str(i) for i in unpackedPidStatus))
               elif packetType[0] == 8:
                    unpackedPidStatus = pidStatusStruct.unpack_from(data, 4) + ("---", self.lastAccY, self.lastGyY, self.lastPitch)    
                    print(",".join(str(z) for z in unpackedPidStatus))
               elif packetType[0] == 103:
                    ofs = 4
                    unpackedLogPacketHeader = logReportHeaderStruct.unpack_from(data, ofs)
                    ofs += logReportHeaderStruct.size
                    for i in range(0,16):
                         entry = logReportEntryStruct.unpack_from(data, ofs)
                         ofs += logReportEntryStruct.size
                         print(",".join(str(z) for z in (i+unpackedLogPacketHeader[0]*16,) + entry))

               self.quadaddr = addr
     
class UpdateStatus:
     def __init__(self, data):
          self.updatedStatus = data

     def invoke(self):
          imuFrame.updateValues(self.updatedStatus)
          motorStatusFrame.updateValues(self.updatedStatus)
          orientationFrame.updateValues(self.updatedStatus)
          loopTimeFrame.updateValues(self.updatedStatus)

chopperListenerThread = QuadiCommThread()

window = Tkinter.Tk()
window.title("Quadimodo Control Panel")

guiQueue = Queue.Queue()

imuFrame = statusframes.ImuFrame(window)
orientationFrame = statusframes.OrientationFrame(window)
loopTimeFrame = statusframes.LoopTimeFrame(window)

motorManualFrame = MotorManualFrame(window, chopperListenerThread)
motorStatusFrame = statusframes.MotorStatusFrame(window)
motorAutoFrame = MotorAutoFrame(window, chopperListenerThread)

imuFrame.grid(column=0, row=0, padx=10, pady=(10, 10), sticky="W")
orientationFrame.grid(column=1, row=0, padx=10, pady=(10, 10), sticky="W")
loopTimeFrame.grid(column=2, row=0, padx=10, pady=(10, 10), sticky="W")

motorManualFrame.grid(column=0, row=1, padx=10, pady=(0, 10), sticky="W")
motorStatusFrame.grid(column=1, row=1, columnspan=2, padx=10, pady=(0, 10), sticky="W")

motorAutoFrame.grid(column=0, row=2, columnspan=2, padx=10, pady=(0, 10), sticky="W")

def onTurnOff(event):
     motorManualFrame.sendMotorsOff()

def onAuto(event):
     motorAutoFrame.sendAutoPacketForUi()

def onRecalibrate(event):
     motorAutoFrame.sendRecalibratePacket()

def askForLogs(event):
     askLogsStruct = struct.Struct("i")
     packet = askLogsStruct.pack(5) 
     chopperListenerThread.send(packet)
     print("ASKED FOR LOGS")

window.bind('<Alt-q>', onTurnOff)
window.bind('<Alt-Q>', onTurnOff)
window.bind('<Alt-a>', onAuto)
window.bind('<Alt-A>', onAuto)
window.bind('<Alt-r>', onRecalibrate)
window.bind('<Alt-R>', onRecalibrate)

window.bind('<Alt-l>', askForLogs)



def drainGuiQueue():
     window.after(100, drainGuiQueue)

     while(not guiQueue.empty()):
          task = guiQueue.get(False)
          task.invoke()

chopperListenerThread.start()

drainGuiQueue()
window.mainloop()
print("Mainloop exited")
chopperListenerThread.stop()
