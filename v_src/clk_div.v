`timescale 1ns / 1ps

module clk_div (
    input  clk,
    input  rst_n,
    output reg clk_fsm,
    // output reg clk_debounce
    output clk_debounce
);

    assign clk_debounce = clk_5MHz;

    clk_wiz CLK_WIZ (
        .clk_in(clk),
        .clk_out(clk_5MHz)
    ); 

    reg [16:0] counter;

    always @ (posedge clk_5MHz, negedge rst_n) begin
        if (!rst_n) begin
            counter <= 17'h00000;
        end
        else begin
            counter <= counter + 17'h00001;
        end
    end

    always @ (posedge clk_5MHz, negedge rst_n) begin
        if (!rst_n) begin
            clk_fsm <= 0;
        end
        else begin
            clk_fsm <= counter[16];
        end
    end

    /*
    always @ (posedge clk_5MHz, negedge rst_n) begin
        if (!rst_n) begin
            clk_debounce <= 0;
        end
        else begin
            clk_debounce <= counter[3];
        end
    end
    */

endmodule
