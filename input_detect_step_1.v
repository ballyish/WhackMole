`timescale 1ns / 1ps

module input_detect_step_1 (
    input  clk,
    input  signal_i,
    output reg signal_o
);

    wire buffer;
    assign buffer = !signal_i;
    
    always @ (posedge clk, negedge buffer) begin
        if (!buffer) begin
            signal_o <= 1'b1;
        end
        else begin
            signal_o <= 1'b0;
        end
    end
    
endmodule
