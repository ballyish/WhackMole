`timescale 1ns / 1ps

module lfsr_2bit(
    input   wire            I_clk,
    input   wire            I_rst_n,

    output  wire    [1:0]   O_pseudo_random
    );

    wire            [15:0]  lfsr;
    lfsr_16bit LFSR_GENE (I_clk, I_rst_n, lfsr);
    assign  O_pseudo_random = lfsr;

endmodule
