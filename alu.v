// ============================================
// ALU Module
// Name: HANARIM
// Student ID: 2024047992
// ============================================

module alu (
    input [7:0] A,
    input [7:0] B,
    input [2:0] ALU_Sel,
    output reg [15:0] ALU_Out
);

    always @(*) begin
        case (ALU_Sel)
            3'b000: ALU_Out = A + B;      // Addition
            3'b001: ALU_Out = A - B;      // Subtraction
            3'b010: ALU_Out = A * B;      // Multiplication
            3'b011: ALU_Out = (B != 0) ? (A % B) : 16'b0; // Modulus (Divide by zero protection)
            3'b100: ALU_Out = {8'b0, (A & B)}; // AND (Concatenation to match 16-bit)
            3'b101: ALU_Out = {8'b0, (A | B)}; // OR  (Concatenation to match 16-bit)
            default: ALU_Out = 16'b0;
        endcase
    end

endmodule
