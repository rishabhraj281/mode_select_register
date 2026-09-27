module tb_rcml_o;
    reg clk, rst;
    reg [1:0] mode;
    reg [7:0] load;
    wire [7:0] out;

    rcml_o dut (.clk(clk), .rst(rst), .mode(mode), .load(load), .out(out));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | rst=%b mode=%b load=%b out=%b", $time, rst, mode, load, out);

        rst = 0; mode = 2'b00; load = 8'h00;
        #12 rst = 1;

        mode = 2'b00; load = 8'hAA; #10;  // pass-through
        mode = 2'b01; load = 8'hAA; #10;  // shift right 1
        mode = 2'b10; load = 8'h03; #10;  // shift left 2
        mode = 2'b11; load = 8'h0F; #10;  // increment

        $finish;
    end
endmodule
