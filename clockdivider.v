module clockkdivider(
    input clk,rst,
    output reg clkout
    );
reg [25:0] count;
always @(posedge clk or posedge rst)
 begin
    if(rst==1) begin
        count<=0;
        clkout<=0;
    end
    else if (count==50000000) 
        begin
            count<=0;
            clkout<=~clkout;
        end
    else 
        count<=count + 1;
 end
endmodule