`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:47:21 05/04/2021 
// Design Name: 
// Module Name:    inv_mix_col 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module inv_mix_col(i_shift,i_mix);
input [0:127]i_shift;
output [0:127]i_mix;
wire [0:127]temp;

assign i_mix[0:7] = mul_14(i_shift[0:7])^mul_11(i_shift[8:15])^mul_13(i_shift[16:23])^mul_9(i_shift[24:31]);
assign i_mix[8:15] =mul_9(i_shift[0:7])^mul_14(i_shift[8:15])^mul_11(i_shift[16:23])^mul_13(i_shift[24:31]);
assign i_mix[16:23] =mul_13(i_shift[0:7])^mul_9(i_shift[8:15])^mul_14(i_shift[16:23])^mul_11(i_shift[24:31]);
assign i_mix[24:31]=mul_11(i_shift[0:7])^mul_13(i_shift[8:15])^mul_9(i_shift[16:23])^mul_14(i_shift[24:31]);

assign i_mix[32:39] = mul_14(i_shift[32:39])^mul_11(i_shift[40:47])^mul_13(i_shift[48:55])^mul_9(i_shift[56:63]);
assign i_mix[40:47] = mul_9(i_shift[32:39])^mul_14(i_shift[40:47])^mul_11(i_shift[48:55])^mul_13(i_shift[56:63]);
assign i_mix[48:55] = mul_13(i_shift[32:39])^mul_9(i_shift[40:47])^mul_14(i_shift[48:55])^mul_11(i_shift[56:63]);
assign i_mix[56:63] = mul_11(i_shift[32:39])^mul_13(i_shift[40:47])^mul_9(i_shift[48:55])^mul_14(i_shift[56:63]);

assign i_mix[64:71] = mul_14(i_shift[64:71])^mul_11(i_shift[72:79])^mul_13(i_shift[80:87])^mul_9(i_shift[88:95]);
assign i_mix[72:79] = mul_9(i_shift[64:71])^mul_14(i_shift[72:79])^mul_11(i_shift[80:87])^mul_13(i_shift[88:95]);
assign i_mix[80:87] = mul_13(i_shift[64:71])^mul_9(i_shift[72:79])^mul_14(i_shift[80:87])^mul_11(i_shift[88:95]);
assign i_mix[88:95] = mul_11(i_shift[64:71])^mul_13(i_shift[72:79])^mul_9(i_shift[80:87])^mul_14(i_shift[88:95]);


assign i_mix[96:103] = mul_14(i_shift[96:103])^mul_11(i_shift[104:111])^mul_13(i_shift[112:119])^mul_9(i_shift[120:127]);
assign i_mix[104:111] = mul_9(i_shift[96:103])^mul_14(i_shift[104:111])^mul_11(i_shift[112:119])^mul_13(i_shift[120:127]);
assign i_mix[112:119] = mul_13(i_shift[96:103])^mul_9(i_shift[104:111])^mul_14(i_shift[112:119])^mul_11(i_shift[120:127]);
assign i_mix[120:127] = mul_11(i_shift[96:103])^mul_13(i_shift[104:111])^mul_9(i_shift[112:119])^mul_14(i_shift[120:127]);


function [0:7]xtime;
input [0:7]i;
begin
if(i[0] ==0)
xtime = {i[1:7],1'b0};
else
xtime = {i[1:7],1'b0}^8'h1b;
end
endfunction 


function [0:7]mul_14;

input [0:7]i;
reg [0:7]temp1,temp2,temp3;
begin
temp1=xtime(i[0:7]);
temp2=xtime(temp1[0:7]);
temp3=xtime(temp2[0:7]);
mul_14=temp1[0:7]^temp2[0:7]^temp3[0:7];
end
endfunction

function [0:7]mul_13;
input [0:7]i;
reg [0:7]temp1,temp2,temp3;
begin
temp1= xtime(i[0:7]);
temp2=xtime(temp1[0:7]);
temp3=xtime(temp2[0:7]);
mul_13= temp3[0:7]^temp2[0:7]^i[0:7];
end
endfunction

function [0:7]mul_11;
input [0:7]i;
reg [0:7]temp1,temp2,temp3;
begin
temp1= xtime(i[0:7]);
temp2=xtime(temp1[0:7]);
temp3=xtime(temp2[0:7]);
mul_11=temp3[0:7]^temp1[0:7]^i[0:7];
end
endfunction

function [0:7]mul_9;
input [0:7]i;
reg [0:7]temp1,temp2,temp3;
begin
temp1= xtime(i[0:7]);
temp2=xtime(temp1[0:7]);
temp3=xtime(temp2[0:7]);
mul_9=temp3[0:7]^i[0:7];
end
endfunction
endmodule
