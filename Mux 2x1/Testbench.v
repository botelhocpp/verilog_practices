`timescale 1ns / 1ps

module Testbench;
    reg [31:0] r_D0 = 0;
    reg [31:0] r_D1 = 0;
    reg r_Sel = 0;
    
    wire [31:0] w_Q;

    Mux_2x1 MUX_DUT (
        .i_D0(r_D0),
        .i_D1(r_D1),
        .i_Sel(r_Sel),
        .o_Q(w_Q)
    );
    
    // Generate Stimulus
    initial begin
        r_D0 = 32'h8888_8888;
        r_D1 = 32'hAAAA_AAAA;
        r_Sel = 0;
        #40
        
        r_Sel = 1;
        #40
        
        r_D0 = 32'hDDDD_DDDD;
        r_D1 = 32'h2222_2222;
        r_Sel = 0;
        #40
        
        r_Sel = 1;
    end

endmodule : Testbench;