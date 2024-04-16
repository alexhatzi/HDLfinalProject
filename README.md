# HDLfinalProject


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
