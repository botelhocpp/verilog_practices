module Block_RAM #(
    parameter p_DATA_WIDTH = 32,
    parameter p_ADDR_WIDTH = 10,
    parameter p_INIT_FILE = ""
)(
    input [p_DATA_WIDTH - 1:0] i_Data,  
    input [p_ADDR_WIDTH - 1:0] i_Address,         
    input [3:0] i_Byte_Enable,  
    input i_Write_Enable,     
    input i_Clk,       
    output [p_DATA_WIDTH - 1:0] o_Data   
);

    reg [p_DATA_WIDTH - 1:0] r_Contents [0:(1 << p_ADDR_WIDTH) - 1];
 
    /* Synchronous Write */ 
    always @(posedge i_Clk) begin
        if (i_Write_Enable) begin
            if (i_Byte_Enable[0]) r_Contents[i_Address][7:0]   <= i_Data[7:0];
            if (i_Byte_Enable[1]) r_Contents[i_Address][15:8]  <= i_Data[15:8];
            if (i_Byte_Enable[2]) r_Contents[i_Address][23:16] <= i_Data[23:16];
            if (i_Byte_Enable[3]) r_Contents[i_Address][31:24] <= i_Data[31:24];
        end
    end
    
    /* Asynchronous Write */
    assign o_Data = r_Contents[i_Address];

    /* Fill memory with file (optional) */
    generate
        if (p_INIT_FILE != "") begin
            initial begin
                $readmemh(p_INIT_FILE, r_Contents);
            end
        end
    endgenerate

endmodule
