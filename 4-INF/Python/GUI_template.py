"""
" Title: TKINTER GUI TEMPLATE
" Author: Filippo Valmori
" Date: 07/06/2023
" Reference: [1] TutorialsPoint -> https://www.tutorialspoint.com/python/python_gui_programming.htm
"""

### LIBRARY ###

import sys
import tkinter as tk                                                                            # include tkinter library (assuming Python3 is used)
import tkinter.ttk as ttk



### BUILT-IN FUNCTIONS ###

# Function to initialize GUI.
def init(top, gui, *args, **kwargs):
    global w, top_level, root
    w = gui
    top_level = top
    root = top

# Function to start GUI (starting point when module is the main routine).
def vp_start_gui():
    global w, root
    root = tk.Tk()
    top = Toplevel1 (root)
    init(root, top)
    root.mainloop()

# Function to create toplevel (starting point when module is imported by another module).
def create_Toplevel1(rt, *args, **kwargs):
    global w, w_win, root
    root = rt
    w = tk.Toplevel (root)
    GUI_v2_support.set_Tk_var()
    top = Toplevel1 (w)
    GUI_v2_support.init(w, top, *args, **kwargs)
    return (w, top)

# Function to close GUI and release shell.
def destroy_window():
    global top_level
    top_level.destroy()
    top_level = None



### WINDOW CLASS ###

class Toplevel1:
    def __init__(self, top=None):

        # Create toplevel window
        _bgcolor = '#d9d9d9'
        _fgcolor = '#000000'
        _compcolor = '#d9d9d9'
        _ana1color = '#d9d9d9'
        _ana2color = '#ececec'
        self.style = ttk.Style()
        if sys.platform == "win32":
            self.style.theme_use('winnative')
        self.style.configure('.',background=_bgcolor)
        self.style.configure('.',foreground=_fgcolor)
        self.style.configure('.',font="TkDefaultFont")
        self.style.map('.',background=[('selected', _compcolor), ('active',_ana2color)])



        ### CUSTOM FUNCTIONS ###

        # Function to update text-message box.
        def Update_Text( Str ) :
            self.Message_1.configure(state='normal')                                            # enable writing mode
            self.Message_1.insert(tk.END,' \u2022 ' + Str + '\n')                               # add new content to mesage box
            self.Message_1.configure(state='disabled')                                          # disable writing mode (read-only)
            self.Message_1.update()                                                             # refresh message box
            self.Message_1.see("end")                                                           # automatically scroll down to latest line

        # Function invoked when menu value is changed.
        def Menu_Callback( event ) :
            Val = self.Menu_1.get()                                                             # read current menu value selected
            Update_Text('Menu value : '+Val)

        # Function invoked when button is pressed.
        def Button_Callback( ) :
            Update_Text('Button pressed')
            Update_Text('Par#1 : '+self.Entry_1.get())                                          # read current parameter entry value

        # Function invoked when checkbox is un/ticked.
        def Cbox_Callback( ) :
            self.CboxFlagA.set(not(self.CboxFlagA.get()))                                       # invert checkbutton state upon pressure
            if self.CboxFlagA.get() == True :
                Update_Text('Checkbox state : ON')
            else :
                Update_Text('Checkbox state : OFF')



        ### WINDOW APPEARANCE ###
        
        top.geometry("1000x600+587+261")                                                        # set main window dimensions and position
        top.minsize(120, 1)                                                                     # minimum rescalable size [NOT ESSENTIAL]
        top.maxsize(3844, 1061)                                                                 # maximum rescalable size [NOT ESSENTIAL]
        top.resizable(1, 1)
        top.title("GUI TEMPLATE - Filippo Valmori")                                             # set main window title
        top.configure(background='whitesmoke')                                                  # set main window color

        # 0. FRAME #
        self.Frame_1 = tk.LabelFrame(top)                                                       # create new frame
        self.Frame_1.place(relx=0.05, rely=0.05, relheight=0.64, relwidth=0.4)
        self.Frame_1.configure(relief='groove')
        self.Frame_1.configure(foreground="black")
        self.Frame_1.configure(text='''PARAMETERS''',font=("Courier",12,"bold"))
        self.Frame_1.configure(background='whitesmoke')

        # 1. MENU #
        self.Menu_Val = tk.StringVar()                                                          # define menu state variable
        self.Menu_1 = ttk.Combobox(top, width=27, textvariable=self.Menu_Val)
        self.Menu_1.place(relx=0.27, rely=0.64, height=20, relwidth=0.145)                      # set position and dimension
        self.Menu_1['values'] = ( ' 1. Read Temperature',
                                  ' 2. Read current',
                                  ' 3. Read voltage')                                           # list of all menu entries
        self.Menu_1.current(1)                                                                  # initialize menu to 2nd value in list [NOT ESSENTIAL]
        self.Menu_1.bind('<<ComboboxSelected>>', Menu_Callback)                                 # link menu value update to callback [NOT ESSENTIAL]

        # 2. BUTTON #
        self.Button_1 = tk.Button(top, command=Button_Callback)                                 # create new button
        self.Button_1.place(relx=0.805, rely=0.12, height=40, width=60)
        self.Button_1.configure(activebackground="#ececec")
        self.Button_1.configure(activeforeground="#000000")
        self.Button_1.configure(background='lightskyblue')
        self.Button_1.configure(disabledforeground="#a3a3a3")
        self.Button_1.configure(foreground="#000000")
        self.Button_1.configure(highlightbackground="#d9d9d9")
        self.Button_1.configure(highlightcolor="black")
        self.Button_1.configure(pady="0")
        self.Button_1.configure(text='''BTN\n#1''')

        # 3. CHECKBOX #
        self.CboxFlagA = tk.IntVar()                                                            # define checkbox state variables
        self.CboxFlagB = tk.IntVar()
        self.Checkbox_1 = tk.Checkbutton(top, variable=self.CboxFlagA, command=Cbox_Callback)   # create new checkbox
        self.Checkbox_1.place(relx=0.1, rely=0.78, relheight=0.048, relwidth=0.092)
        self.Checkbox_1.configure(activebackground="#ececec")
        self.Checkbox_1.configure(activeforeground="#000000")
        self.Checkbox_1.configure(background='whitesmoke')
        self.Checkbox_1.configure(disabledforeground="#a3a3a3")
        self.Checkbox_1.configure(foreground="#000000")
        self.Checkbox_1.configure(highlightbackground="#d9d9d9")
        self.Checkbox_1.configure(highlightcolor="black")
        self.Checkbox_1.configure(justify='left')
        self.Checkbox_1.configure(text='''Checkbox #1''',font=("Helvetica", 10))
        self.Checkbox_1.configure(variable=self.CboxFlagB)

        # 4. ENTRY #
        self.Entry_1 = tk.Entry(top)                                                            # create new parameter entry
        self.Entry_1.place(relx=0.27, rely=0.1, height=20, relwidth=0.145)
        self.Entry_1.configure(background="white")
        self.Entry_1.configure(disabledforeground="#a3a3a3")
        self.Entry_1.configure(font="TkFixedFont")
        self.Entry_1.configure(foreground="#000000")
        self.Entry_1.configure(insertbackground="black")
        self.Entry_1.insert(tk.END, 199)                                                        # initialize entry

        # 5. LABEL #
        self.Label_1 = tk.Message(top)                                                          # create label (related to parameter entry)
        self.Label_1.place(relx=0.072, rely=0.1, relheight=0.034, relwidth=0.152)
        self.Label_1.configure(background='whitesmoke')
        self.Label_1.configure(foreground="#000000")
        self.Label_1.configure(highlightbackground="#d9d9d9")
        self.Label_1.configure(highlightcolor="black")
        self.Label_1.configure(text='''Par#1 name''',font=("Helvetica", 10, "normal", "italic"))
        self.Label_1.configure(width=88)

        # 6. MESSAGE-BOX #
        self.Scroll_1 = tk.Scrollbar(root,orient=tk.VERTICAL)                                   # create scrollbar for message text-box
        self.Scroll_1.pack(side=tk.RIGHT, fill=tk.Y)                                            # set scrollbar position and direction [NOT NEEDED IF LINE BELOW IS UNCOMMENTED]
        self.Scroll_1.place(relx=.90, rely=.36, relheight=0.6)                                  # set scrollbar diension and postion
        self.Message_1 = tk.Text(top,wrap=tk.NONE, yscrollcommand=self.Scroll_1.set)            # create message text-box
        self.Message_1.place(relx=0.56, rely=0.36, relheight=0.6, relwidth=0.34)
        self.Message_1.configure(background="white")
        self.Message_1.configure(font="TkTextFont")
        self.Message_1.configure(foreground="black")
        self.Message_1.configure(highlightbackground='white')
        self.Message_1.configure(highlightcolor="black")
        self.Message_1.configure(insertbackground="black")
        self.Message_1.configure(selectbackground="#c4c4c4")
        self.Message_1.configure(selectforeground="black")
        self.Message_1.configure(wrap="word")
        self.Message_1.configure(state='disabled')
        self.Scroll_1.config(command=self.Message_1.yview)


if __name__ == '__main__':
    vp_start_gui()



### NOTES ###

# 0. No additional packages need to be installed (only Tkinter, which is already included in Python installation).

# 1. add tabs
# 2. add UART comuniction
# 3. add real time plots
