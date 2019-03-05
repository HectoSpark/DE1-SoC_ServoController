module ServoController (
	input 		 clock,
	input 		 load,
	input [7:0]  duty,
	output  	    PWMOut
);
	reg [9:0]counter = 0;
	initial counter = 0;
	
	localparam clockspeed = 128000; //set clockspeed in hz
	localparam integer counterspeed = 50000000/clockspeed;
	localparam integer halfcounterspeed = counterspeed/2;
	always @(posedge clock)
	begin
		if(counter == counterspeed) begin
		counter <= 0;
		end
		else begin
		counter <= counter + 1;
		end
	end
	
	wire clockdiv = (counter < halfcounterspeed) ? 1 : 0;
	
	PWM_gen pwmgen(
		.clock	 (clock),
		.clockdiv (clockdiv),
		.latch	 (load),
		.duty		 (duty),
		.PWMOut	 (PWMOut)
	);
endmodule

module PWM_gen(
	input       clock,
	input 		clockdiv,
	input [7:0] duty,
	input 		latch,
	output      PWMOut
);
	reg 		   reset = 0;
	localparam endcount = 2560; // 128khz * 0.02s
	
	reg [7:0] dutylatched = 0;
	initial dutylatched = 0;
	always @(posedge clock) begin
		if (latch) begin
			dutylatched <= duty;
		end
	end
	
	reg [11:0]counter = 0;
	initial counter = 0;
	always @(posedge clockdiv)
	begin
		if(counter == endcount) begin
		counter <= 0;
		end
		else begin
		counter <= counter + 1;
		end
	end
	
	assign PWMOut = (counter < (64+dutylatched)) ? 1 : 0;
	//a = b if c else d
		 
endmodule
