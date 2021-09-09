import Tkinter
import struct
from controls import StatusLabel, ParameterInput

class MotorManualFrame(Tkinter.LabelFrame):
     def __init__(self, master, clt):
          Tkinter.LabelFrame.__init__(self, master, text="Manual Motor Control")

          self.chopperListenerThread = clt

          self.valMot1 = ParameterInput(self, "M1", "100")
          self.valMot2 = ParameterInput(self, "M2", "100")
          self.valMot3 = ParameterInput(self, "M3", "100")
          self.valMot4 = ParameterInput(self, "M4", "100")
          
          self.sendButton = Tkinter.Button(self, text="Send", command=self.sendControlPacketForUi)
          self.offButton = Tkinter.Button(self, text="Off", command=self.sendMotorsOff)
          
          self.valMot1.grid(column=0, row=0)
          self.valMot2.grid(column=1, row=0)
          self.valMot3.grid(column=2, row=0)
          self.valMot4.grid(column=3, row=0)
          self.sendButton.grid(column=4, row=0, padx=(30, 5))
          self.offButton.grid(column=5, row=0, padx=(5, 5))

     def sendControlPacketForUi(self):
          self.sendControlPacket(
               int(self.valMot1.getValue()), 
               int(self.valMot2.getValue()), 
               int(self.valMot3.getValue()), 
               int(self.valMot4.getValue()))
          global logEnabled

          logEnabled = False

     def sendMotorsOff(self):
          self.sendControlPacket(0, 0, 0, 0)
          global logEnabled
          logEnabled = False

     def sendControlPacket(self, m1, m2, m3, m4):
          manualMotorControlPacketStruct = struct.Struct("iiiii")
          packet = manualMotorControlPacketStruct.pack(1, m1, m2, m3, m4) 
          self.chopperListenerThread.send(packet)
