
0. Shortcuts :
   - to rotate block use "Ctrl+R";
   - to un/comment block use "Ctrl+Shift+X";

1. To add new blocks to the schematic, click on the "Library Browser" icon on the top bar, search for the desired block and drag it into the schematic.

2. To set the simulation parameters, click on the "Model Configuration Parameters" icon on the top bar (e.g. to set "start time" and "stop time" in the "Solver" tab). Otherwise, simply create a .m file containing all parameters and run it; then running the Simulink simulation, this will automatically read the parameters from the MATLAB workspace.

3. To create a global variable acting as parameter for multiple blocks within the simulation, click on the "Model Explorer" icon on the top bar, then go to "Simulink Root > PROJECT > Model Workspace" and click "Add MATLAB Variable".

4. To export simulation data to MATLAB workspace use check the "To Workspace" block specifying the variable name. After running the Simulink simulink the data can be seen from the MATLAB command window by typing NAME.Data (and NAME.Time if info about the timing is needed as well).

5. The BER block returns x3 values: the estimated BER (between 0 and 1), the number of wrong bits, and the total number of processed bits.

6. Blocks for which it's possible to enable extra error outputs (e.g. BSC or RS-Decoder), actually show just the the number of errors during the last cycle of the simulation: use BER clock for overall erorro estimateion!

7. To show signals size on connection wires, go to "Debug > Information Overlays" and tick "Signal Dimensions".