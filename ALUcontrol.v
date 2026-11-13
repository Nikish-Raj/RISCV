module ALUcontrol(
    input [31:0] a,
    input [31:0] b,
    input [5:0] aluctrl,
    output reg [31:0] aluresult

    );
    always @(*) begin
        case(aluctrl)
            //R-TYPE
         0: aluresult=a+b; //add
         1: aluresult=a-b; //sub
         2: aluresult=a&b; //bitwise and
         3: aluresult=a|b; //bitwise or
         4: aluresult=a^b; //bitwise xor
         5: aluresult=a<b?1:0;// sltu
         6: aluresult=($signed(a)<$signed(b))?1:0;//slt
         7: aluresult=a>>b[4:0];//srl
         8: aluresult=a<<b[4:0];//sll
         9: aluresult=$signed(a)>>b[4:0];//sra
         
            //I-TYPE
         10: aluresult=a+b; //addi
         11: aluresult=a&b; //bitwise andi
         12: aluresult=a|b; //bitwise ori
         13: aluresult=a^b; //bitwise xori
         14: aluresult=a<b?1:0;// sltui
         15: aluresult=($signed(a)<$signed(b))?1:0;//slti
         16: aluresult=a>>b[4:0];//srli
         17: aluresult=a<<b[4:0];//slli
         18: aluresult=$signed(a)>>b[4:0];//srai
         
            //Branch
         19: aluresult=($signed(a)<$signed(b));//blt
         20: aluresult=($signed(a)>=$signed(b));//bge
         21: aluresult=(a<b);//bltu
         22: aluresult=(a>=b);//bgeu
         23: aluresult=(a-b);//beq
         24: aluresult=(a-b);//bne
            
            //Store
         25: aluresult=a+b; //sw
            
            //Load
         26: aluresult=a+b; //lw
         
            //J-TYPE
         27: aluresult=a+4; //jal
         28: aluresult=(a+b)&~32'b1; //jalr
         
            //U-TYPE
         29: aluresult=b; //lui
         30: aluresult=a+b; //auipc
      
      
         default: aluresult=0;  
         endcase
         end 
endmodule
