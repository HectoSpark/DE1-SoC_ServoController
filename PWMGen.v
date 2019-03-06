module PWM_gen(
	input       	clock,
	input 			clockdiv,
	input [7:0] 	duty,
	input 			latch,
	input	[11:0]	endcount,
	output      	PWMOut
);
	reg 		   reset = 0;
	reg [7:0] dutylatch = 0;
	
	always @(posedge latch) begin
			dutylatch <= duty;
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
	
	assign PWMOut = (counter < (64+dutylatch)) ? 1 : 0;
		 
endmodule