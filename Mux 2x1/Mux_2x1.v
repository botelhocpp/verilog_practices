module Mux_2x1 (
    input [31:0] i_D0,
    input [31:0] i_D1,
    input i_Sel,
    output [31:0] o_Q
);
    assign o_Q = (i_Sel) ? i_D1 : i_D0;
endmodule : Mux_2x1;
