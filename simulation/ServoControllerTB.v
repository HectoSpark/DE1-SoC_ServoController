/*Testbench*/


`timescale 1 ns / 100 ps

module ServoController_tb;

	reg		CLOCK;
	wire		PWMOUT;
	wire		CLOCKDIV;
	
ServoController dut (

	.clock(CLOCK),
	.clockdiv(CLOCKDIV),
	.PWMOut(PWMOUT)
);

localparam freq = 3900;

initial begin

	CLOCK = 1'b0;
	
end

always begin
	#freq CLOCK = ~CLOCK;
	
end

endmodule
