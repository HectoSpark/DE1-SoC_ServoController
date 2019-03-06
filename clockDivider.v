/*--Module to divide the clock into requested clock speed--*/
module clockDivider # (
	parameter counterspeed = 390 											//counterspeed parameter
) (
input 			clock,														//Input clock
output reg  	clockdivided												//Output clock
);

	reg [9:0]counter = 0;													//counter register which initial is set to 0
	
	localparam integer halfcounterspeed = counterspeed / 2;		//half counter speed for clock divided signal
	
	always @(posedge clock)													//always block at positive edge of clock to count
	begin
		if(counter == counterspeed) begin								//compare counter and counterspeed and if it has met counterspeed then set counter to 0
		counter <= 0;
		end
		else begin
		counter <= counter + 1;												//if not equal to counter speed then counter++
		end
	end
	
	//assign clockdivided = (counter < halfcounterspeed) ? 1 : 0; 
	
	always @(posedge clock) begin											//assign block if counter is smaller than halfcounterspeed then clockdivided is 0, else 1
		if(counter < halfcounterspeed) begin
			clockdivided <= 1;
		end else begin
			clockdivided <= 0;
		end
	end

endmodule
