module Mux_4x1 (
    input [31:0] i_D0,
    input [31:0] i_D1,
    input [31:0] i_D2,
    input [31:0] i_D3,
    input [1:0] i_Sel,
    output [31:0] o_Q
);
    assign o_Q = i_Sel[1] ? 
                 (i_Sel[0] ? i_D3 : i_D2) :
                 (i_Sel[0] ? i_D1 : i_D0);
endmodule : Mux_4x1;
