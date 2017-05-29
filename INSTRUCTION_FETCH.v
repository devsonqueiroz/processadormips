/**
 * Universidade Estadual de Feira de Santana
 * Departamento de Tecnologia
 * Disciplina: MI- Sistemas Digitais
 * 
 * Registrador.
 *
 * @Devson Queiroz de Oliveira
 */
 
module INSTRUCTION_FECTH (
	clk,
	rst,
	instruction
);

input clk;
input rst;
output instruction;

wire clk;
wire rst;
wire [31:0] instruction;

wire [31:0] pc_out;

wire [31:0] adder_pc_4_out;
wire [31:0] constant_4;

assign constant_4 = 4;

REGISTER PC (
	.clk(clk),
	.rst(rst),
	.data_in(adder_pc_4_out),
	.data_out(pc_out)
);

IMEM imem (
	.address(pc_out),
	.instruction(instruction)
);

ADDER adder_pc_4 (
	.a(pc_out),
	.b(constant_4),
	.c(adder_pc_4_out)
);

endmodule