`timescale 1ns / 1ps

module decode_2bin_7seg (
    input bin,
    output [6:0] seg
);
    
    assign seg = bin ? 7'b1001111 : 7'b0000001 ;
    
endmodule
