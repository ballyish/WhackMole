`timescale 1ns / 1ps

module input_detect (
    input  clk,
    input  rst_n,
    input  signal_i,
    output signal_o
);
    
    wire buffer;

    input_detect_step_1 INPUT_STEP_1 (
        .clk(clk),
        .signal_i(signal_i),
        .signal_o(buffer)
    );

    input_detect_step_2 INPUT_STEP_2 (
        .clk(clk),
        .rst_n(rst_n),
        .signal_i(buffer),
        .signal_o(signal_o)
    );
    
endmodule
