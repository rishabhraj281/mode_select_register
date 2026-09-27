module rcml_o(
	input wire  clk,
	input wire  rst,
        input wire [1:0] mode,
	input wire [7:0] load,
       	output reg [7:0] out);
always@(posedge clk or negedge rst)
begin
	if (!rst)
		out<=8'b00000000;
	else
	begin 
		case(mode)
			2'b00:out<=load;
			2'b01:out<=load>>1;
			2'b10:out<=load<<2;
			2'b11:out<=load+1;
			default:out<=out;
		endcase
	end 	
end 
endmodule 
