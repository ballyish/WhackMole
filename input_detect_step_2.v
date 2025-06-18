`timescale 1ns / 1ps

module input_detect_step_2 (
    input  clk,
    input  rst_n,
    input  signal_i,
    output reg signal_o
);

    reg state;

    parameter OFF = 1'b0;
    parameter ON = 1'b1;
    
    always @ (posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            signal_o <= 1'b0;
            state <= OFF;
        end
        else if ((state == OFF) && signal_i) begin
            signal_o <= 1'b1;
            state <= ON;
        end
        else if ((state == ON) && signal_i) begin
            signal_o <= 1'b0;
            state <= ON;
        end
        else begin
            signal_o <= 1'b0;
            state <= OFF;
        end
    end
    
endmodule
