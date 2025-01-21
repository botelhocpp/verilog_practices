module ALU (
    input [31:0] i_A,
    input [31:0] i_B,
    input [1:0] i_Sel,
    output o_Zero,
    output reg [31:0] o_Q
);
    localparam [31:0] c_ZERO = 0;
    
    always @ (*) begin
        case (i_Sel)
            2'b00: o_Q = i_A + i_B;
            2'b01: o_Q = i_A - i_B;
            2'b10:  o_Q = i_A & i_B;
            2'b11:  o_Q = i_A | i_B;
            default: o_Q = c_ZERO;
        endcase
    end
    
    assign o_Zero = (o_Q == c_ZERO);

endmodule : ALU;
