`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:43:52 05/04/2021
// Design Name:   main_decry
// Module Name:   M:/VLSI/decryption/tb_decrypt.v
// Project Name:  decryption
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_decry
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_decrypt;

	// Inputs
	reg [0:127] encr_data;
	reg [0:127] key;

	// Outputs
	wire [0:127] decryp_data;

	// Instantiate the Unit Under Test (UUT)
	main_decry uut (
		.encr_data(encr_data), 
		.key(key), 
		.decryp_data(decryp_data)
	);

	initial begin
		// Initialize Inputs
		//encr_data = 128'h a13c4dcf3859ff78076bda87fc1856b5;
		key = "1234";
		// Wait 100 ns for global reset to finish
		#10;
		if($value$plusargs ("encr_data=%h",encr_data))
			//$display("encr_data is %h",encr_data);
		//if($value$plusargs ("key=%s",key))
			//$display("key is %s",key);
		$monitor("%s",decryp_data);
        
		// Add stimulus here

	end
      
endmodule

