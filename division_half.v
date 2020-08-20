module division_half
#(
    parameter MUL_2 = 9
)
(
    input clk,rst,
    output cnt_pos_w,cnt_neg_w,
    output [4:0] cnt_w,
    output clk_o
);
reg [4:0] cnt;
reg  cnt_neg;
reg  cnt_pos;
assign cnt_pos_w = cnt_pos;
assign cnt_neg_w = cnt_neg;
assign cnt_w = cnt;
//counter
always @( posedge clk , negedge rst) begin
    if(!rst)
    begin
        cnt <= 3'b0;
    end
    else if (cnt == MUL_2-1)
    begin
        cnt <= 3'b0;
    end 
    else begin
        cnt <= cnt +1;
    end
end
//
always @( posedge clk , negedge rst) begin
    if(!rst)
    begin
        cnt_pos <= 3'b1;
    end
    else if (cnt == 1 || cnt == 8|| cnt == 3|| cnt == 6 ) begin
        cnt_pos <= ~cnt_pos;
    end
end
always @( negedge clk , negedge rst) begin
    if(!rst)
    begin
        cnt_neg <= 3'b1;
    end
    else if (cnt == 2 || cnt == 4||cnt == 6 || cnt == 8) begin
        cnt_neg <= ~cnt_neg;
    end
end
assign clk_o = cnt_neg & cnt_pos;
endmodule
