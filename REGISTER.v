/**
 * Universidade Estadual de Feira de Santana
 * Departamento de Tecnologia
 * Disciplina: MI- Sistemas Digitais
 * 
 * Registrador.
 *
 * @Devson Queiroz de Oliveira
 */
module REGISTER (
	clk,
	rst,
	data_in,
	data_out
);

input clk;
input rst;
input data_in;
output data_out;

wire clk;
wire rst;
wire [31:0] data_in;
reg [31:0] data_out;

initial begin
	data_out = 0;
end

always @(posedge clk) begin
	if (rst) begin
		data_out = 0;
	end else begin
		data_out = data_in;
	end
end

endmodule