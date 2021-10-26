"""
Calculator
"""

from tkinter import *

root = Tk()


def calculate(num: int) -> int:
    """This function does the calculations"""
    return num


def numberOne():
    myOneButton = Button(root, text="1", command=calculate(1))


e = Entry(root, width=40, borderwidth=60)
e.pack()
e.insert(0, "Please Write Something!")

# Creating a Label Widget
myLabel = Label(root, text="ASDASDASDASD")
myLabel2 = Label(root, text="DSADSADSADSA")

# Creating Buttons
myButton = Button(root, text="Click me!", padx=25, pady=25, command=myClick, fg="blue", bg="green")

# Showing it on Screen
# myLabel.grid(row=0, column=0)
# myLabel2.grid(row=1, column=1)
myButton.pack()

root.mainloop()
