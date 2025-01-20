module Register (
    input [31:0] i_D,
    input i_Load,
    input i_Clk,
    input i_Rst,
    output reg [31:0] o_Q
);

    always @ (posedge i_Clk or posedge i_Rst) begin
        if (i_Rst)
            o_Q = 0;
        else
            o_Q = i_D;
    end
    
endmodule : Register;
