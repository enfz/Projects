"""Enfei Zhang

October 26, 2021

This program is an updated version of my former project of 3d tic-tac-toe, made in Turing, but in Python.
"""

from tkinter import *

root = Tk()


def myClick():
    myLabel3 = Label(root, text="Hello " + e.get())
    myLabel3.pack()


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
