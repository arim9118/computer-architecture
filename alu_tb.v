// ============================================
// ALU Testbench
// ============================================

`timescale 1ns/1ps

module alu_tb;

reg [7:0] A, B;
reg [2:0] ALU_Sel;
wire [15:0] ALU_Out;

// ALU 인스턴스
alu uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out)
);

initial begin
    $monitor("Time=%0d | A=%d B=%d Sel=%b | Out=%d",
              $time, A, B, ALU_Sel, ALU_Out);

    // Test Cases

    A = 12; B = 34; ALU_Sel = 3'b000; #10; // ADD
    A = 55; B = 20; ALU_Sel = 3'b001; #10; // SUB
    A = 9;  B = 8;  ALU_Sel = 3'b010; #10; // MUL
    A = 45; B = 6;  ALU_Sel = 3'b011; #10; // MOD
    A = 8'b10101010; B = 8'b11001100; ALU_Sel = 3'b100; #10; // AND
    A = 8'b00001111; B = 8'b11110000; ALU_Sel = 3'b101; #10; // OR

    $finish;
end

endmodule
