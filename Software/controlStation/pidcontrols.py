import Tkinter
import struct
from controls import StatusLabel, ParameterInput

class PIDParamsInput(Tkinter.Frame):
     def __init__(self, master, name):
          Tkinter.Frame.__init__(self, master)

          self.valCoeffP = ParameterInput(self, "P", "100")
          self.valCoeffI = ParameterInput(self, "I", "100")
          self.valCoeffD = ParameterInput(self, "D", "100")
          self.valSetpoint = ParameterInput(self, "Setpoint", "0")
          
          titleLabel = Tkinter.Label(self, text=name)
          titleLabel.grid(column=0, row=0)
          self.valCoeffP.grid(column=1, row=0)
          self.valCoeffI.grid(column=2, row=0)
          self.valCoeffD.grid(column=3, row=0)
          self.valSetpoint.grid(column=4, row=0)
     
     def getP(self):
          return self.valCoeffP.getValue()

     def getI(self):
          return self.valCoeffI.getValue()

     def getD(self):
          return self.valCoeffD.getValue()

     def getSetpoint(self):
          return self.valSetpoint.getValue()

class MotorAutoFrame(Tkinter.LabelFrame):
     def __init__(self, master, clt):
          Tkinter.LabelFrame.__init__(self, master, text="Auto Motor Control")

          self.chopperListenerThread = clt

          self.valThrottle = ParameterInput(self, "Throttle", "800")
          self.sendButton = Tkinter.Button(self, text="Auto", command=self.sendAutoPacketForUi)
          self.calibrateButton = Tkinter.Button(self, text="Recalibrate", command=self.sendRecalibratePacket)

          self.pidRoll= PIDParamsInput(self, "Roll")
          self.pidPitch = PIDParamsInput(self, "Pitch")
          self.pidYaw = PIDParamsInput(self, "Yaw")
          
          
          self.valThrottle.grid(column=0, columnspan=1, row=0)
          self.sendButton.grid(column=1, row=0, columnspan=1, padx=(30, 5))
          self.calibrateButton.grid(column=2, row=0, columnspan=1, padx=(30, 5))

          self.pidRoll.grid(column=0, columnspan=3, row=1)
          self.pidPitch.grid(column=0, columnspan=3, row=2)
          self.pidYaw.grid(column=0, columnspan=3, row=3)

     def sendAutoPacketForUi(self):
          self.sendControlPacket(
               int(self.valThrottle.getValue()), 
               int(self.pidRoll.getP()), 
               int(self.pidRoll.getI()), 
               int(self.pidRoll.getD()), 
               int(self.pidRoll.getSetpoint()), 
               int(self.pidPitch.getP()), 
               int(self.pidPitch.getI()), 
               int(self.pidPitch.getD()), 
               int(self.pidPitch.getSetpoint()), 
               int(self.pidYaw.getP()), 
               int(self.pidYaw.getI()), 
               int(self.pidYaw.getD()),
               int(self.pidYaw.getSetpoint())
               ) 

     def sendControlPacket(self, throttle, rollp, rolli, rolld, rolls, pitchp, pitchi, pitchd, pitchs, yawp, yawi, yawd, yaws):
          autoMotorControlPacketStruct = struct.Struct("iiiiiiiiiiiiii")
          packet = autoMotorControlPacketStruct.pack(2, throttle, rollp, rolli, rolld, rolls, pitchp, pitchi, pitchd,pitchs, yawp, yawi, yawd, yaws) 
          self.chopperListenerThread.send(packet)
          global logEnabled
          logEnabled = True

     def sendRecalibratePacket(self):
          recalibratePacketStruct = struct.Struct("i")
          packet = recalibratePacketStruct.pack(3) 
          self.chopperListenerThread.send(packet)
