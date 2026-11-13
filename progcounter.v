module progcounter(input clk,input rst,
    input [31:0] pc_next,
    output reg [31:0] pc

    );
    always@(posedge clk or posedge rst)
        pc<=rst?32'd0:pc_next;
endmodule
