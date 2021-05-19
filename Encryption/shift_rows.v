`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:37 03/14/2021 
// Design Name: 
// Module Name:    shift_rows 
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
module shift_rows(b_shift,a_shift);
input [0:127] b_shift;
output [0:127] a_shift;

assign a_shift[0:7]   = b_shift[0:7]   ;//0 
assign a_shift[8:15] = b_shift[40:47];//1
assign a_shift[16:23] = b_shift[80:87];//2
assign a_shift[24:31] = b_shift[120:127];//3

assign a_shift[32:39] = b_shift[32:39];//4
assign a_shift[40:47] = b_shift[72:79];//5
assign a_shift[48:55] = b_shift[112:119];//6
assign a_shift[56:63] = b_shift[24:31];//7

assign a_shift[64:71] = b_shift[64:71];//8
assign a_shift[72:79] = b_shift[104:111];//9
assign a_shift[80:87] = b_shift[16:23];//10
assign a_shift[88:95] = b_shift[56:63];//11

assign a_shift[96:103] = b_shift[96:103];//12
assign a_shift[104:111] = b_shift[8:15];//13s
assign a_shift[112:119] = b_shift[48:55];//14
assign a_shift[120:127] = b_shift[88:95];//15

endmodule




