`timescale 1ns / 1ps

module input_d (
    input  clk,
    input  clk_debounce,
    input  rst_n,
    input  [1:0] d_i,
    output [1:0] d_o
);

    wire [1:0] buffer;
    
    debounce DEBOUNCE_D1(
        .clk(clk_debounce),
        .rst_n(rst_n),
        .signal_i(d_i[1]),
        .signal_o(buffer[1])
    );

    input_detect INPUT_D1(
        .clk(clk),
        .rst_n(rst_n),
        .signal_i(buffer[1]),
        .signal_o(d_o[1])
    );

    debounce DEBOUNCE_D0(
        .clk(clk_debounce),
        .rst_n(rst_n),
        .signal_i(d_i[0]),
        .signal_o(buffer[0])
    );

    input_detect INPUT_D0(
        .clk(clk),
        .rst_n(rst_n),
        .signal_i(buffer[0]),
        .signal_o(d_o[0])
    );
    
endmodule
