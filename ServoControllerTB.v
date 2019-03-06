/*Testbench*/


`timescale 1 ns / 100 ps

module ServoController_tb;

	reg		 	CLOCK = 0;
	reg  [7:0] 	duty = 8'h00;
	reg  [2:0]  channelselect = 2'b00;
	reg  		 	latchbtn = 0;
	wire [3:0]	PWMOut;
	
ServoController dut (

	.clock					(CLOCK),
	.channelselect			(channelselect),
	.duty						(duty),
	.latchbtn				(latchbtn),
	.PWMOut					(PWMOut)
);

localparam freq = 10;
always #freq CLOCK = ~CLOCK;

initial begin
	CLOCK = 1'b0;
	latchbtn = 1;
	
	#30_000_000;
	duty = 8'hFF;
	channelselect = 2'b00;
	latchbtn = 0;
	@(posedge CLOCK);
	latchbtn = 1;
	#60_000_000;
	channelselect = 2'b01;
	latchbtn = 0;
	@(posedge CLOCK);
	latchbtn = 1;
	#90_000_000;
	channelselect = 2'b10;
	latchbtn = 0;
	@(posedge CLOCK);
	latchbtn = 1;
	#120_000_000;
	channelselect = 2'b11;
	latchbtn = 0;
	@(posedge CLOCK);
	latchbtn = 1;
	#160_000_000;
	channelselect = 2'b11;
	latchbtn = 0;
	@(posedge CLOCK);
	latchbtn = 1;
	
end

endmodule
