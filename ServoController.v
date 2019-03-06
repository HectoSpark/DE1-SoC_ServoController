/*--Top level module of servo controller--*/
module ServoController # (
	parameter channels = 4												//How many channels to generate
) (
	input 		 		   clock,										//Input clockspeed
	input [channels-1:0]	latch,										//Input latches
	input [7:0]  			duty,											//Input duty
	output[channels-1:0]	PWMOut										//Output the PWM signal for the servos
);
	wire clockdiv;
	//calculations
	localparam baseclock = 50000000; 								//Base clock of FPGA at 50MHz
	localparam clockspeed = 128000; 									//Set the output clockspeed of the clock divider
	
	//calculations for ClockDiv
	localparam integer counterspeed = baseclock/clockspeed; 	//Calculate how much the counter must count for the clock.
	
	//calculations for PWMGen
	localparam integer endcount = clockspeed * 0.02; 						//20ms * clockspeed to get the amount the counter must count for 20ms for the servo
	
	//single clock divider for all 4 channels
	clockDivider # (
		.counterspeed(counterspeed) 									//counterspeed parameter to be passed to module for calculations
	) clockdivider(
		.clock				(clock),  									//Clock assignment for module							//counterspeed to for module
		.clockdivided		(clockdiv)									//the divided clock speed out
	);
	
	//Generate channels
	genvar i;																//generate variable for the for loop
	generate
		for(i = 0; i < channels; i = i + 1) begin : PWMGen_Loops
			PWM_gen # (
				.endcount	      (endcount)
			) pwmgen(
				.clockdiv 			(clockdiv),							//divided clock
				.latch	 			(latch[i]),							//Latch of [i] channel
				.duty		 			(duty),								//Duty input
				.PWMOut	 			(PWMOut[i]) 						//PWM out
			);
		end
	endgenerate
	//Generate end
endmodule


