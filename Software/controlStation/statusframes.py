import Tkinter
from controls import StatusLabel, ParameterInput

class ImuFrame(Tkinter.LabelFrame):
     def __init__(self, master):
          Tkinter.LabelFrame.__init__(self, master, text="IMU Readings")

          self.statusAccX = StatusLabel(self, "AccX")
          self.statusAccY = StatusLabel(self, "AccY")
          self.statusAccZ = StatusLabel(self, "AccZ")

          self.statusGyX = StatusLabel(self, "GyX")
          self.statusGyY = StatusLabel(self, "GyY")
          self.statusGyZ = StatusLabel(self, "GyZ")

          self.statusAccX.grid(column=0, row=0)
          self.statusAccY.grid(column=1, row=0)
          self.statusAccZ.grid(column=2, row=0)

          self.statusGyX.grid(column=3, row=0)
          self.statusGyY.grid(column=4, row=0)
          self.statusGyZ.grid(column=5, row=0)

     def updateValues(self, values):
          self.statusAccX.setValue(values[1])
          self.statusAccY.setValue(values[2])
          self.statusAccZ.setValue(values[3])

          self.statusGyX.setValue(values[4])
          self.statusGyY.setValue(values[5])
          self.statusGyZ.setValue(values[6])


class OrientationFrame(Tkinter.LabelFrame):
     def __init__(self, master):
          Tkinter.LabelFrame.__init__(self, master, text="Orientation")

          self.statusPitch = StatusLabel(self, "Pitch")
          self.statusRoll = StatusLabel(self, "Roll")
          self.statusYaw = StatusLabel(self, "Yaw")

          self.statusPitch.grid(column=0, row=0)
          self.statusRoll.grid(column=1, row=0)
          self.statusYaw.grid(column=2, row=0)

     def updateValues(self, values):
          self.statusPitch.setValue(values[11])
          self.statusRoll.setValue(values[13])
          self.statusYaw.setValue(values[12])

class MotorStatusFrame(Tkinter.LabelFrame):
     def __init__(self, master):
          Tkinter.LabelFrame.__init__(self, master, text="Motor Output")

          self.statusMot1 = StatusLabel(self, "M1")
          self.statusMot2 = StatusLabel(self, "M2")
          self.statusMot3 = StatusLabel(self, "M3")
          self.statusMot4 = StatusLabel(self, "M4")

          self.statusMot1.grid(column=0, row=0)
          self.statusMot2.grid(column=1, row=0)
          self.statusMot3.grid(column=2, row=0)
          self.statusMot4.grid(column=3, row=0)

     def updateValues(self, values):
          self.statusMot1.setValue(values[7])
          self.statusMot2.setValue(values[8])
          self.statusMot3.setValue(values[9])
          self.statusMot4.setValue(values[10])


class LoopTimeFrame(Tkinter.LabelFrame):
     def __init__(self, master):
          Tkinter.LabelFrame.__init__(self, master, text="Loop Time")

          self.loopTimeMs = StatusLabel(self, "us")

          self.loopTimeMs.grid(column=0, row=0)

     def updateValues(self, values):
          self.loopTimeMs.setValue(values[14])
