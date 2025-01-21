`timescale 1ns / 1ps

module Testbench;
    parameter [127:0] c_TEST_OUTPUT = {32'h3333_3333, 32'h0000_0000, 32'h1111_1111, 32'h3333_3333};
    parameter [4:0] c_TEST_ZERO = {1'b0, 1'b1, 1'b0, 1'b0};

    reg [31:0] r_A = 32'h2222_2222;
    reg [31:0] r_B = 32'h1111_1111;
    reg [1:0] r_Sel = 0;
    wire w_Zero;
    wire [31:0] w_Q;

    ALU MUX_DUT (
        .i_A(r_A),
        .i_B(r_B),
        .i_Sel(r_Sel),
        .o_Zero(w_Zero),
        .o_Q(w_Q)
    );
    
    integer i;
    
    // Generate Stimulus
    initial begin
        for(i = 0; i <= 2'b11; i = i + 1) begin
            r_Sel = i;
            
            #10;
            
            $display("A = 0x%08h, B = 0x%08h, S = 0b%02b, Z = %d, Q = 0x%08h", r_A, r_B, r_Sel, w_Zero, w_Q);
            
            if(w_Q != c_TEST_OUTPUT[(32*i) +:32] & w_Zero != c_TEST_ZERO[i]) begin
                $display("Incorrect output data! Expected Q = 0x%08h and Z = %d", c_TEST_OUTPUT[(32*i) +:32], c_TEST_ZERO[i]);
                $finish;
            end
        end
        
        $display("Test passed");
        $finish;
    end

endmodule : Testbench;