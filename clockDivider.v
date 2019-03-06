module clockDivider(
input 	clock,
output	clockdivided
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
	
	assign clockdivided = (counter < halfcounterspeed) ? 1 : 0;

endmodule
