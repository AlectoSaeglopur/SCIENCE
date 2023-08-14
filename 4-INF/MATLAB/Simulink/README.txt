
0. Shortcuts :
   - to rotate block use "Ctrl+R";
   - to un/comment block use "Ctrl+Shift+X";
   - use "Shift+Enter" to break line while renaming a block;
   - to add a "text-block" for notes, just click the annotation icon on the left bar.

1. To add new blocks to the schematic, click on the "Library Browser" icon on the top bar, search for the desired block and drag it into the schematic.

2. To set the simulation parameters, click on the "Model Configuration Parameters" icon on the top bar (e.g. to set "start time" and "stop time" in the "Solver" tab). Otherwise, simply create a .m file containing all parameters and run it; then running the Simulink simulation, this will automatically read the parameters from the MATLAB workspace.

3. To create a global variable acting as parameter for multiple blocks within the simulation, click on the "Model Explorer" icon on the top bar, then go to "Simulink Root > PROJECT > Model Workspace" and click "Add MATLAB Variable".

4. To export simulation data to MATLAB workspace use check the "To Workspace" block specifying the variable name. After running the Simulink simulink the data can be seen from the MATLAB command window by typing NAME.Data (and NAME.Time if info about the timing is needed as well).

5. The BER block returns x3 values: the estimated BER (between 0 and 1), the number of wrong bits, and the total number of processed bits.

6. Blocks for which it's possible to enable extra error outputs (e.g. BSC or RS-Decoder), actually show just the the number of errors during the last cycle of the simulation: use BER clock for overall erorro estimateion!

7. To show signals size on connection wires, go to "Debug > Information Overlays" and tick "Signal Dimensions".

8. for displaying time and frequency plots, use the "Scope" and "Spectrum Analyzer" blocks respictively.

9. To redirect signal form one point of the schematic to the other without using cumbersome wires, use the "Goto" and "From" blocks.

10. To create a block implementing a custom function:
  - Drag the "MATLAB Function" block from the library;
  - Double-click on it and write the desired MATLAB function (with all inputs/parameters specified);
  - To customize appearance, right-click it and go to "Format";
  - To turn one or more inputs into block parameters, double-click on it (to see the actual MATLAB function), go to "MODELING (tab) > Symbols Pane". Now right-click on the parameter of interest and select "Inspect" and modify the "Scope" field to "Parameter". Repeat the same step for each parameter. Then go back to the main Simulink schematic and check these inputs disappeared from the block. Now right-click on the block, go to "Mask > Create Mask", left-click on the desired parameter type (e.g. "edit" or "popup") then edit the "Prompt" (e.g. as "Number of rows") and add the "Name" (e.g. as "M", NB: this shall match the function parameter names!) fields. Finally click "Save Mask" and move back to the main schematic.
  - As an example, see the convolutional interleaver in ex7.

11. To create a variable that can be read and written during the simulation, use the "Data Store Memory" block. See "ex6_dvbs_chain_v2" as an example: here the variable INIT is used to set to 0 the very first bits outcoming from the QPSK demodulator [The explanation is that the SRRC filter causes some initial delay (as 0-samples) which can be then wrongly demapped by the QPSK demodulator (because 0-samples lie exactly on the empper decision threshold). Plus, the subsystem created for this purpose in that schematic includes inside an example of "if-else" case.
