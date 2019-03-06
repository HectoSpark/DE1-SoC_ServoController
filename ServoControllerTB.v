/*Testbench*/


`timescale 1 ns / 100 ps

module ServoController_tb;

	reg		 	CLOCK = 0;
	reg  [7:0] 	duty = 8'h00;
	reg  [3:0] 	latch = 0;
	wire [3:0]	PWMOUT;
	
ServoController dut (

	.clock		(CLOCK),
	.duty			(duty),
	.latch		(latch),
	.PWMOut		(PWMOUT)
);

localparam freq = 10;
always #freq CLOCK = ~CLOCK;

initial begin
	CLOCK = 1'b0;
	latch = 0;
	
	#30_000_000;
	duty = 8'hFF;
	latch[0] = 1;
	latch[1] = 1;
	latch[2] = 1;
	latch[3] = 1;
	@(posedge CLOCK);
	latch[0] = 0;
	latch[1] = 0;
	latch[2] = 0;
	latch[3] = 0;
	#60_000_000;
	duty = 8'h80;
	latch[0] = 1;
	latch[1] = 1;
	latch[2] = 1;
	latch[3] = 1;
	@(posedge CLOCK);
	latch[0] = 0;
	latch[1] = 0;
	latch[2] = 0;
	latch[3] = 0;
	
	
end

endmodule
