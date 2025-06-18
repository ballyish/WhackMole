`timescale 1ns / 1ps

module debounce (
    input  clk,
    input  rst_n,
    input  signal_i,
    output reg signal_o
);

    reg [3:0] buffer;
    
    always @ (posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            buffer <= 4'h0;
            signal_o <= 1'b0;
        end
        else begin
            buffer <= {buffer[2:0], signal_i};
            signal_o <= signal_o ? (| buffer) : (& buffer) ;
        end
    end
    
endmodule
