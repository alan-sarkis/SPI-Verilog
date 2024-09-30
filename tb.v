module tb();

reg clk = 0, start = 0;
reg [11:0] din = 0;
wire cs, mosi, done, sclk;

integer i = 0;

spi dut(clk, start, din, cs, mosi, done, sclk);

always #5 clk = ~clk;

initial begin
    for(i = 0; i < 10; i = i+ 1)begin
        din = $urandom;
        start = 1;
        @(posedge done);
    end

    $stop;
    
end

endmodule