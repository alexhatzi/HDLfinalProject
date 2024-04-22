# HDLfinalProject

This very simple CPU is meant to be able to perform ALU and memory operations. At time of writing it does not fully work. The design can be built, simulation can be ran and waveforms show real inputs (No *unexpected* X values). The register to memory interaction does not seem to actually work. The values stored in registers from the register file do not affect the data memory apart from a few testcases.

Additionally, while the ALU operations do work as intended based on their inputs and outputs, the inputs to the ALU are not behaving as expeted. These issues may all be corrected at a later time. 


![waveforms]([waveforms](https://imgur.com/aUDEWJY.png))




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
