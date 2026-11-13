module register_file(
    input clk,regwrite,
    input [31:0] wd3,
    input [4:0] rs1,rs2,rd,
    output [31:0] rd1,rd2,x1
    );
    reg [31:0] reg_mem[31:0];
    integer i;
    initial begin
        for(i=0;i<32;i=i+1) begin
            reg_mem[i]=32'b0;
        end
    end
    always @(posedge clk) begin
        if (regwrite && rd !=0)
            reg_mem[rd]<=wd3;
    end
    assign rd1=(rs1!=0)?reg_mem[rs1]:32'b0;
    assign rd2=(rs2!=0)?reg_mem[rs2]:32'b0;
    
endmodule
