`timescale 1ns/1ns
module lm_555_timer#(
                        parameter Resistor1=1,      // Value of Resistor one
                        parameter Resistor2=100 ,     // Value of resistor two
			parameter capacitor=10      // Value of Capacitor

                        )(
                            input  clk, reset,
                            output reg pulse
                        ); 
		 			
    localparam integer onduration= ((Resistor1+Resistor2) * capacitor* 0.693); 
	localparam integer offduration= ( Resistor2 * capacitor*0.693); 
  always@(reset)
    if(reset == 1'b1)
      pulse <= 1'b1;
  always@(pulse)
   if(pulse == 1'b1)
      #onduration pulse <= 1'b0;
  always@(pulse)
   if(pulse == 1'b0)
      #offduration pulse <= 1'b1;
endmodule
`timescale 1ns/1ns
module lm_555_timer_TB();
	reg clk = 1'b0;
	reg rst = 1'b0;
	wire pulse;
	lm_555_timer l1(clk,rst,pulse);
	initial begin
	#10 rst = 1'b1;
	#10 rst = 1'b0;
	forever #600 clk = ~clk;
	end
endmodule
