/*--module to generate the PWM signal for the servo's--*/
module PWM_gen(
	input 			clockdiv,										//Input divided clock signal (128kHz)
	input [7:0] 	duty,												//Input duty cycle
	input 			latch,											//Input latch
	input	[11:0]	endcount,										//Input endcount for the counter
	output      	PWMOut											//Ouput PWM signal for servos
);
	reg 		   reset = 0;											//reset register
	reg [7:0] Setduty = 0;											//Duty cycle which was set on the last latch
	
	always @(posedge latch) begin									//always block to check for positive edge of latch being pressed
			Setduty <= duty;											//set latched duty to duty cycle input
	end
	
	reg [11:0]counter = 0;											//Create register counter which is initially 0

	always @(posedge clockdiv)										//at postive edge of the clock
	begin
		if(counter == endcount) begin								//If counter equals the endcount then set counter to 0
		counter <= 0;
		end
		else begin
		counter <= counter + 1;										//Else incremement counter
		end
	end
	
	assign PWMOut = (counter < (64+Setduty)) ? 1 : 0;		//If counter is smaller than latched duty cycle then output is 1, else is 0
		 
endmodule