


.PHONY:  all
all: decoder ALU CPU DataMemory InstructionMemory RegisterFile top sim waves  





.PHONY: decoder
decoder: 
	@iverilog -o out_decoder.out Decoder.v

.PHONY: ALU
ALU:
	@iverilog -o out_ALU.out ALU.v



.PHONY: CPU
CPU:
	@iverlog -o out_CPU.out CPU.v

.PHONY: DataMemory
DataMemory:
	@iverilog -o out_datamemory.out DataMemory.v

.PHONY: InstructionMemory
InstructionMemory:
	@iverilog -o out_instructionmemory.out InstructionMemory.v


.PHONY: RegisterFile
RegisterFile:
	@iverilog -o out_registerfile.out RegisterFile.v

.PHONY: top
top:
	@iverilog -o out_top.out top.v

.PHONY: waves
