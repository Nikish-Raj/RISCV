module instructionmemory(
    input [31:0] pc,
    output [31:0] inst

    );
    reg [31:0] memory [255:0];
    initial begin
        $readmemh("MEMO.mem",memory);
        end
    assign inst=memory[pc>>2];
endmodule
