`timescale 1ns / 1ps

module Testbench;
    parameter [127:0] c_TEST_DATA = {32'h3333_3333, 32'h2222_2222, 32'h1111_1111, 32'h0000_0000};

    reg [31:0] r_D0 = c_TEST_DATA[31:0];
    reg [31:0] r_D1 = c_TEST_DATA[63:32];
    reg [31:0] r_D2 = c_TEST_DATA[95:64];
    reg [31:0] r_D3 = c_TEST_DATA[127:96];
    reg [1:0] r_Sel = 0;
    
    wire [31:0] w_Q;

    Mux_4x1 MUX_DUT (
        .i_D0(r_D0),
        .i_D1(r_D1),
        .i_D2(r_D2),
        .i_D3(r_D3),
        .i_Sel(r_Sel),
        .o_Q(w_Q)
    );
    
    integer i;
    
    // Generate Stimulus
    initial begin
        for(i = 0; i <= 2'b11; i = i + 1) begin
            r_Sel = i;
            
            #10;
            
            $display("Output data 0x%08h for input %d", w_Q, i);
            
            if(w_Q != c_TEST_DATA[(32*i) +:32]) begin
                $display("Incorrect output data! Expected 0x%08h", c_TEST_DATA[(32*i) +:32]);
                $finish;
            end
        end
        
        $display("Test passed");
        $finish;
    end

endmodule : Testbench;