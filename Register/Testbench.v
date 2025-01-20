`timescale 1ns / 1ps

module Testbench;
    reg [31:0] r_D = 0;
    reg r_Load = 0;
    reg r_Clk = 0;
    reg r_Rst = 0;
    
    wire [31:0] w_Q;

    Register #( .p_INITIAL_VALUE(32'hFFFF_FFFF) )
    REGISTER_DUT (
        .i_D(r_D),
        .i_Load(r_Load),
        .i_Clk(r_Clk),
        .i_Rst(r_Rst),
        .o_Q(w_Q)
    );
    
    // Generate 50MHz Clock
    initial begin
        forever #20 r_Clk = ~r_Clk;
    end
    
    // Generate Reset
    initial begin
        r_Rst = 1;
        #1
        r_Rst = 0;
    end
    
    // Generate Stimulus
    initial begin
        r_D = 32'h8000_0000;
        r_Load = 0;
        #20
        
        r_D = 32'h8000_0000;
        r_Load = 1;
        #20
        
        r_D = 32'h8004_0000;
        r_Load = 0;
        #20
        
        r_D = 32'h8004_0000;
        r_Load = 1;
        #20
        
        r_D = 32'h8008_0000;
        r_Load = 1;
    end

endmodule : Testbench;