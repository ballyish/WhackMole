`timescale 1ns / 1ps

module lfsr_16bit(
    input   wire            I_clk,
    input   wire            I_rst_n,

    output  wire    [15:0]  O_pseudo_random          
    );

    reg             [15:0]  lfsr;
    wire                    feedback;

    assign O_pseudo_random = lfsr;
    assign feedback = lfsr[15] ^ lfsr[13] ^ lfsr[12] ^ lfsr[10];

    always @(posedge I_clk or negedge I_rst_n)
    begin
        if(!I_rst_n)
            lfsr <= 16'h5555;
		else
        begin
            if (feedback)
                lfsr <= {lfsr[14:0], lfsr[15]};
            else
                lfsr <= {lfsr[14:0], ~lfsr[15]};
        end
    end

endmodule
