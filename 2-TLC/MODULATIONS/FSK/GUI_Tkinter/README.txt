
### PYTHON SETUP ###
- install "Python" using the installer exe from Python website
- install additional modules via pip (e.g. scipy, see below)
- install "PAGE" and "ActiveTcl" for GUI development

### HOW TO USE PAGE ###
- run PAGE
- save the project into a dedicated folder with "File -> Save as" (name PRJ.tcl)
- design GUI and finally save
- click "Gen_Python -> Generate Python GUI" and then "Save"
- click "Gen_Python -> Generate Support Module" and then "Save"
- run GUI via command line by typing "cls && python GUI_FreqMods.py"

### CREATE EXE ###
- move to python gui folder via cmd
- type "pyinstaller --onefile PYGUINAME.py"
- the app is placed in \dist folder

### ADDITIONAL MODULES ###
pip install scipy (to use scientific library)
pip install matplotlib (to plot library)
pip install pyinstaller (to convert tkinter gui into exe)





