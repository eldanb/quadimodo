import Tkinter

class StatusLabel(Tkinter.Frame):
     def __init__(self, owner, labelText):
          Tkinter.Frame.__init__(self, owner)
          self.valueLabel = Tkinter.Label(self, text="", fg="green")
          self.labelLabel = Tkinter.Label(self, text=labelText, font = "Helvetica 8")
     
          self.valueLabel.grid(row=0, column=0, padx=5)
          self.labelLabel.grid(row=1, column=0, padx=5)
          
          self.grid_columnconfigure(0, minsize=80)

     def setValue(self, value):
          self.valueLabel.config(text=value)

class ParameterInput(Tkinter.Frame):
     def __init__(self, owner, labelText, initialValue):
          Tkinter.Frame.__init__(self, owner)
          self.stringVar = Tkinter.StringVar(self, initialValue)
          self.valueEdit = Tkinter.Entry(self, width=5, textvariable=self.stringVar)
          self.labelLabel = Tkinter.Label(self, text=labelText, font = "Helvetica 8")
     
          self.valueEdit.grid(row=0, column=0, padx=5)
          self.labelLabel.grid(row=1, column=0, padx=5)
          
          self.grid_columnconfigure(0, minsize=80)

     def getValue(self):
          return self.stringVar.get()

