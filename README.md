# HDLfinalProject

This very simple CPU is meant to be able to perform ALU and memory operations. The design can be built, simulation can be ran and waveforms show real inputs (No *unexpected* X values). While the waveforms do show X values, these are expected and wanted. For example for Control Type Instructions, reg_addr_2 should all be x's, which can be seen in the video before.



[2024-04-22 21-19-20.webm](https://github.com/doodoofarrd/HDLfinalProject/assets/143632432/d4219e77-a20c-43aa-8212-f4f34d5c32e9)




## How to use

- [ ] Download Icarus Verilog [here](https://github.com/steveicarus/iverilog)
- [ ] Download GTKWave [here](https://gtkwave.sourceforge.net/)
-   The makefiles should work on any bash shell, built on debian





| OPCODE (Decimal)   | OPERATION    | Relevant Info |
|------|-----------------------|-------------------------------------------------------------------------------------|
| 0    | Load Word             |  Take data from register file `reg_addr_0` and put it in memory at `addr` |   
| 1    | Store Word            | Take data from memory address `addr` and put it in the register file at address `reg_addr_0` |  
| 2    | Branch if Equal       | If `reg_addr_0` == `reg_addr_1`, PC = `addr` | 
| 3    | Branch if Less Than   | If `reg_addr_0` < `reg_addr_1`, PC = `addr` | 
| 4    | Add                   | Addition      | 
| 5    | Sub                   | Subtraction (complement if negative | 
| 6    | And                   | Bitwise AND   | 
| 7    | Or                    | Bitwise  OR   | 
