module extender(
    input [31:0] inst,
    input [2:0] immsrc,
    output reg [31:0] immext
    );
    always @(*) begin
        case(immsrc)
            3'b000: immext= {{20{inst[31]}},inst[31:20]}; //I-TYPE
            3'b001: immext= {{20{inst[31]}},inst[31:25],inst[11:7]}; //S-TYPE
            3'b010: immext= {{19{inst[31]}},inst[31],inst[7],inst[30:25],inst[11:8],1'b0}; //B-TYPE
            3'b011: immext= {inst[31:12],12'b0}; //U-TYPE
            3'b100: immext= {{12{inst[31]}},inst[31],inst[19:12],inst[20],inst[30:21],1'b0}; //J-TYPE
     default: immext=32'b0;
         endcase
            
    end  
endmodule
