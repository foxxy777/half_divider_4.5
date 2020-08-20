`timescale 1ns / 1ns
module division_half_testbench();
reg clk;
reg rst;
wire clk_o;
wire cnt_pos_w;
wire cnt_neg_w;
wire [4:0] cnt_w;
parameter PERIOD = 10;
initial 
begin
    clk = 1;
    forever
    #(PERIOD/2) clk = ~clk; 
end 
division_half division_half_inst
(
    .clk(clk),
    .rst(rst),
    .cnt_pos_w(cnt_pos_w),
    .cnt_neg_w(cnt_neg_w),
    .cnt_w(cnt_w),
    .clk_o(clk_o)
);
initial 
begin
    rst = 1'b0;
    #1;
    rst = 1'b1;
    #1000
    $finish;
end
endmodule
