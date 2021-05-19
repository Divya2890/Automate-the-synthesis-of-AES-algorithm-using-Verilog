`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:27:29 03/14/2021
// Design Name:   main
// Module Name:   M:/VLSI/enc_decryp/main_tb.v
// Project Name:  enc_decryp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_tb;

	// Inputs
	reg [0:127] data;
	reg [0:127] key;

	// Outputs
	wire [0:127] en_key;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.data(data), 
		.key(key), 
		.en_key(en_key)
	);

	initial begin
		// Initialize Inputs
		//$monitor($time,"output is %h",en_key);
		//data ="This is the aes";
		key ="1234" ;
		#10;
		if($value$plusargs ("data=%s",data))
		//	$display("data is %s",data);
		//if($value$plusargs ("key=%s",key))
		//	$display("key is %s",key);
		$monitor("%h",en_key);

		
		// Add stimulus here

	end
      
endmodule

