`timescale 1ns / 1ps

module seg_display (
    input  clk_seg,
    input  rst_n,
    input  [3:0] q,
    output reg [3:0] seg_index,
    output [6:0] seg
);

    reg q_seg;

    always @ (posedge clk_seg, negedge rst_n) begin
        if (!rst_n) begin
            seg_index <= 4'b0000;
            q_seg <= q[0];
        end
        else begin
            case (seg_index)
                4'b0000:    begin
                                seg_index <= 4'b1110;
                                q_seg <= q[0];
                            end
                4'b1110:    begin
                                seg_index <= 4'b1101;
                                q_seg <= q[1];
                            end
                4'b1101:    begin
                                seg_index <= 4'b1011;
                                q_seg <= q[2];
                            end
                4'b1011:    begin
                                seg_index <= 4'b0111;
                                q_seg <= q[3];
                            end
                4'b0111:    begin
                                seg_index <= 4'b1110;
                                q_seg <= q[0];
                            end
                default:    begin
                                seg_index <= 4'b1110;
                                q_seg <= q[0];
                            end
            endcase
        end
    end
    
    decode_2bin_7seg BIN_SEG (
        .bin(q_seg),
        .seg(seg)
    );
    
endmodule
