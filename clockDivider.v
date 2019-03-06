module clockDivider # (
	parameter counterspeed = 390
) (
input 			clock,
input	[11:0]	counterspeedreg,
output			clockdivided
);

	reg [9:0]counter = 0;
	initial counter = 0;
	
	localparam integer halfcounterspeed = counterspeed / 2;
	
	always @(posedge clock)
	begin
		if(counter == counterspeed) begin
		counter <= 0;
		end
		else begin
		counter <= counter + 1;
		end
	end
	
	assign clockdivided = (counter < halfcounterspeed) ? 1 : 0;

endmodule
