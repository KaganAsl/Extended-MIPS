# CENG311 - Homework 3
Based on: [SingleCycle-Mips](https://github.com/KaganAsl/SingleCycle-MIPS) <br>
Course Info: [IZTECH - CENG311](https://ceng.iyte.edu.tr/courses/ceng-311)

### Instructions
| Binary Opcode | Instruction | Hex |
|:---:|:---:|:---:|
| 00101101 | R-type | 2D |
| 00101110 | lw | 2E |
| 00101111 | sw | 2F |
| 00110000 | jump | 30 |
| 00110001 | beq | 31 |
| 00110010 | bne | 32 |
| 00110011 | addi | 33 |

<br>

### Controller
| Instruction | RegDest | AluSrc | MemToReg | RegWrite | MemRead | MemWrite | BranchEq | BranchNotEq | AluOp1 | AluOp0 | Jump |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| R-format | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
| lw | 0 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 |
| sw | X | 1 | X | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| addi | 0 | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 |  0|
| jump | X | X | X | 0 | 0 | 0 | 0 | 0 | X | X | 1 |
| beq | X | 0 | X | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
| bne | X | 0 | X | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 |

<br>

### ALU
| Instruction Opcode | ALU Op | Instruction Operation | Function Field | ALU Action | Alu Control Input |
| :---: | :---: | :---: | :---: | :---: | :---: |
| R-format | 10 | NOR | 100001 | NOR | 011 |
| R-format | 10 | add | 100000 | add | 010 |
| R-format | 10 | subtract | 100010 | subtract | 110 |
| R-format | 10 | AND | 100011 | AND | 000 |
| R-format | 10 | OR | 110001 | OR | 001 |
| R-format | 10 | set on less than | 110000 | set on less than | 111 |
| lw | 00 | load word | XXXXXX | add | 010 |
| sw | 00 | store word | XXXXXX | add | 010 |
| addi | 00 | add immediate | XXXXXX | add | 010 |
| beq | 01 | branch equal | XXXXXX | subtract | 110 |  
| bne | 01 | branch not equal | XXXXXX | subtract | 110 |

<br>

### Code
#### Instructions
0) addi $1, $2, 3 <br>
Opcode/Rs = $2/Rt = $1/Const <br>
00110011/0010/0001/0000000000000011 <br>
33210003
1) add $2, $2, $1 <br>
Opcode/Rs = $2/Rt = $1/Rd = $2/Shift/Funct <br>
00101101/0010/0001/0010/000000/100000 <br>
2D212020
2) j 3 <br>
Opcode/Address <br>
00110000/000000000000000000000011 <br>
30000003
3) beq $5, $6, 1 <br>
Opcode/Rs = $6/Rt = $5/Address <br>
00110001/0110/0101/0000000000000001 <br>
31650001
4) nor $1, $2, $3 <br>
Opcode/Rs = $2/Rt = $3/Rd = $1/Shift/Funct <br>
00101101/0010/0011/0001/000000/100001 <br>
2D231021
5) sw $2, 4($6) <br>
Opcode/Rs = $6/Rt = $2/Address <br>
00101111/0110/0010/0000000000000100 <br>
2F620004
6) lw $3, 4($6) <br>
Opcode/Rs = $6/Rt = $3/Address <br>
00101110/0110/0011/0000000000000100 <br>
2E630004
7) bne $3, $4, -4 <br>
Opcode/Rs = $4/Rt = $3/Address <br>
00110010/0100/0011/1111111111111100 <br>
3243FFFC

### Datapath
![Datapath](./datapath.svg)