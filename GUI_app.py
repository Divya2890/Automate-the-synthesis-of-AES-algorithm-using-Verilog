import subprocess
import os
from tkinter import *
import tkinter as tk
window= Tk()
window.title("AES Encryption")
window.configure(bg="#364F6B")
lbl = Label(window, text="Encryption - Decryption ", foreground="#3FC1C9",bg="#364F6B",font=("Arial Bold", 25))
lbl.place(x=50, y = 40,height=50,width=450)
window.geometry('850x600')
   
# display GUI widgets  for encrypting

data=StringVar()
result=StringVar()
x=StringVar()
key=None
Entry(window, font = 'arial 10 bold', textvariable = data, bg ='antiquewhite2').place(x=25, y = 250,height=50,width=150)
T = Entry(window,bg = "antiquewhite2").place(x=375, y = 250,height=50,width=150)
Q = Entry(window,bg = "antiquewhite2", textvariable = result ,font = 'arial 10 bold')
Q.place(x=25, y = 350,height=50,width=150)
P=Entry(window,bg = "antiquewhite2", font = 'arial 10 bold')
P.place(x=375, y = 350,height=50,width=150)

def KeyChange1():
    global key
    key=x.get()
    if key==None:
        KR.insert(END,"Enter Valid Key")
        
    else:
        KR.delete(0,'end')
        KR.insert(END,"Key is successfully changed")

K = Entry(window,bg = "antiquewhite2", textvariable = x ,font = 'arial 10 bold')
K.place(x=25, y = 150,height=50,width=150)
btn4= Button(window, font = 'arial 13 bold', text = 'Change Key',padx =5,bg ='#FC5185' ,command = KeyChange1).place(x=200,y=150,height=50,width=150)
KR= Entry(window,bg = "antiquewhite2", font = 'arial 10 bold')  
KR.place(x=375, y = 150,height=50,width=150)

def clicked() :
    a=data.get()
    if key==None:
        list_files = subprocess.run(('cd c:/iverilog/bin & iverilog -o a.out encryption.v main_tb.v & vvp a.out +data={0}'.format(a)),shell=True,capture_output=True)
    else:
        print("key is "+key)
        list_files = subprocess.run(('cd c:/iverilog/bin & iverilog -o a.out encryption.v main_tb_1.v & vvp a.out +data={0} +key={1} & exit'.format(a,key)),shell=True,capture_output=True)
        print(list_files)
    T = Entry(window,bg = "antiquewhite2", font = 'arial 10 bold')
    T.insert(END,list_files.stdout)
    T.place(x=375, y = 250,height=50,width=250)
    Q.delete(0, 'end')
    Q.insert(END,list_files.stdout)

def decrypt():
    a1=result.get()
    print(a1)
    P=Entry(window,bg = "antiquewhite2", font = 'arial 10 bold')
    P.place(x=375, y = 350,height=50,width=150)
    if key==None:
        list_files1 = subprocess.run(('cd c:/iverilog/bin & iverilog -o a1.out main_decry.v tb_decrypt.v & vvp a1.out +encr_data={0}'.format(a1)),shell=True,capture_output=True)
        print(list_files1)
        P.insert(END,list_files1.stdout)
    else:
        print("key is "+key)
        list_files1 = subprocess.run(('cd c:/iverilog/bin & iverilog -o a1.out main_decry.v tb_decrypt.v & vvp a1.out +encr_data={0}'.format(a1)),shell=True,capture_output=True)
        print(list_files1)
        P.insert(END,list_files1.stdout)
    
btn = Button(window, font = 'arial 13 bold', text = 'Encrypt',padx =5,bg ='#FC5185' ,command = clicked).place(x=200,y=250,height=50,width=150)
btn2=Button(window, font = 'arial 13 bold', text = 'Decrypt',padx =5,bg ='#FC5185' ,command = decrypt).place(x=200,y=350,height=50,width=150)
window.mainloop()
