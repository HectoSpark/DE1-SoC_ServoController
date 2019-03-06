module ServoController #(
	parameter channels = 4;
)(
	input 		 		   clock,
	input [channels-1:0]	load,
	input [7:0]  			duty,
	output[channels-1:0]	PWMOut
);
	wire clockdiv;
	//calculations
	localparam baseclock = 50000000;
	localparam clockspeed = 128000;
	//calculations for ClockDiv
	localparam integer counterspeed = baseclock/clockspeed;
	//calculations for PWMGen
	localparam endcount = clockspeed * 0.02;
	reg [11:0]endcountreg = endcount;
	
	//single clock divider for all 4 channels
	clockDivider # (
		.counterspeed(counterspeed)
	) clockdivider(
		.clock				(clock),
		.counterspeedreg	(counterspeed),
		.clockdivided		(clockdiv)
	);
	
	//Generate channels
	genvar i;
	
	generate
		for(i = 0; i < channels; i = i + 1) begin : PWMGen_Loops
			PWM_gen pwmgen(
				.clock	 			(clock),
				.clockdiv 			(clockdiv),
				.latch	 			(load[i]),
				.duty		 			(duty),
				.PWMOut	 			(PWMOut),
				.endcount 			(endcountreg)
			);
		end
	endgenerate
	//Generate end
endmodule


