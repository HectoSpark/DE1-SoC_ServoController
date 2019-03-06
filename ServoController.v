module ServoController (
	input 		 clock,
	input 		 load,
	input [7:0]  duty,
	output  	    PWMOut
);
	localparam clockspeed = 128000
	wire clockdiv;

	clockDivider clockdivider(
		.clock(clock),
		.clockdivided(clockdiv)
	);

	PWM_gen pwmgen(
		.clock	 (clock),
		.clockdiv (clockdiv),
		.latch	 (load),
		.duty		 (duty),
		.PWMOut	 (PWMOut)
	);
endmodule


