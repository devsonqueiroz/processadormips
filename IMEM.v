/**
 * Universidade Estadual de Feira de Santana
 * Departamento de Tecnologia
 * Disciplina: MI- Sistemas Digitais
 * 
 * Memória.
 *
 * @Devson Queiroz de Oliveira
 */
 
module IMEM (
  address,
  instruction
);

input address;
output instruction;

wire [31:0] address;
reg [31:0] instruction;

reg [7:0] ROM [0:1023];

initial begin : load_default_memory
  integer   index;
  
  for (index = 0; index < 1024; index = index + 1)
	ROM[index] = 0;
  
  $readmemb("memory.bin", ROM);
  instruction = 0;
  
end

always begin
  
  if (address > 1020) begin
    $display("Instruction memory out of bounds!! Memory size is 1024 bytes.");
    $finish;
  end
  
  #10 instruction = {ROM[address+3], ROM[address+2], ROM[address+1], ROM[address]};
  
end

endmodule