import os
from tkinter import *
from tkinter import Tk ,StringVar, ttk
from tkinter import filedialog
from tkinter.filedialog import askopenfilename
from tkinter import messagebox
import queue as queue
import threading
import time
import subprocess
from Icon import iconmap
import base64

files = []
queue = queue.Queue()
directory = os.getcwd()
root = Tk()


def savethefile():
    global directory
    directory = filedialog.askdirectory(parent=root ,title='Save a file ' , initialdir = 'C:\\') 

def FilePath():
    global files
    global directory
    files = list(filedialog.askopenfilenames(parent=root,title='Choose a file' , initialdir = 'C:\\'))
    if(len(files)!=0):
        directory = os.path.split(files[0])[0] 

def enable_user_input():
	Converter.config(state=NORMAL);             
	Save.config(state=NORMAL);
	Saveto.config(state = NORMAL)


def disable_user_input():
	Converter.config(state=DISABLED);             
	Save.config(state=DISABLED);
	Saveto.config(state = DISABLED)        

def setwidgetlayout():
    # get screen width and height
    ws = root.winfo_screenwidth();  #This value is the width of the screen
    hs = root.winfo_screenheight(); #This is the height of the screen
    #Set screen dimentions
    w = 450;# 570; # width
    h = 260;# 400; # height
    # calculate position x, y
    x = (ws/2) - (w/2);
    y = (hs/2) - (h/2);
    
    
    root.geometry('%dx%d+%d+%d' % (w, h, x, y));

    # disable resize else it will spoil the layout.
    root.resizable(0,0); # only minimize or close allowed
    Save.place(x=140,y= 43)
    Converter.place(x=40 , y=95)
    Saveto.place(x=240 , y=95)
    Status.place(x=5 , y = 210)
    frame.place(x=5 , y =150 )
    progressBar.pack(side = LEFT)
    percantage.pack(side = RIGHT)

    icondata= base64.b64decode(iconmap)
    tempFile = 'Icon.ico'
    iconfile = open(tempFile , 'wb')
    iconfile.write(icondata)
    iconfile.close()
    root.iconbitmap(tempFile)
    os.remove(tempFile)
    root.title("Audio Converter")
    


class ThreadedClient(threading.Thread):

    def __init__(self ): 
        threading.Thread.__init__(self)

    def run(self):
        global queue
        global files
        global directory
        
        filelist = [ f for f in files if f.endswith(".mp4")]

        directory = directory + "\\Audio"

        if not os.path.exists(directory ):
           os.makedirs(directory)

        
        counter = 1
        
        for song in filelist:
            Audiotrack = os.path.split(song)[1]
            queue.put(Audiotrack)
            Audiotrack = Audiotrack[:Audiotrack.rfind(".mp4")]
            Audiotrack = directory + "\\" +  Audiotrack + ".mp3"
            if(os.path.exists(Audiotrack)):
                continue
            command = []
            command.append('ffmpeg')
            command.append('-i')
            command.append(song)
            command.append('-vn')
            command.append('-ab')
            command.append('320')
            command.append(Audiotrack)
            subprocess.call(command, shell = True)
            queue.put((counter*100)/len(files))
            counter = counter + 1 
 

def Converter():
    
    global files
    global directory
    
    if(len(files)==0):
        Status.config(text = "Please Select some Files")
        
    disable_user_input()
    thread = ThreadedClient()
    thread.daemon = True
    thread.start()
    periodicCall(thread)

def periodicCall(thread):
    global root  
    checkqueue()
    if thread.is_alive():
        root.after(100 , periodicCall , thread)
    else:
        Status.config(text = 'Status : Task Completed')
        enable_user_input()


def checkqueue():
    global queue
    global files
    while(queue.qsize()):
        value = queue.get()
        if("mp4" in str(value)):
            if len(value)>65 :
                index = value[:65].rfind(" ")
                value = value[:index]+ '\n' + value[index:]            
            value = "Converting : " + value
            Status.config(text=value)
        else:
            string = str(int(value)) + " %"
            percantage.config(text = string)
            progressBar.step(100/len(files))
            progressBar.update_idletasks()


    


#http://www.motobit.com/util/base64-decoder-encoder.asp

Save          = Button(root, text ="Select Files", command = FilePath , width=22 ,bd=2)
Converter     = Button(root,text = "Convert",command = Converter ,width=22 ,bd=2);
Saveto        = Button(root,text = "SaveTo" ,command = savethefile ,width=22 ,bd=2)
Status	      = Label(root)
frame         = Frame(root)
progressBar   = ttk.Progressbar(frame ,orient='horizontal',length=393, mode='determinate' , maximum = 100.01)
percantage    = Label(frame)

def main():
    global root;
    setwidgetlayout() ;
    root.mainloop();

if __name__ == '__main__':    main();

