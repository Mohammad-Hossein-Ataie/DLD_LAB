`timescale 1ns/1ns
module FRS#(parameter fset_min = 8'b0,parameter fset_max = 8'b1)(input clk,rst,input [7:0] fset_ref, output reg[7:0] Setperiod);
  always @(posedge clk, posedge rst) begin
    if (rst == 1'b1)
          Setperiod <= 8'b0;
    if (fset_ref >= fset_min & fset_ref <= fset_max)
       Setperiod <= fset_ref;
  else if (fset_ref < fset_min)
     Setperiod <= fset_min;
  else
     Setperiod <= fset_max; 
  end 
endmodule

