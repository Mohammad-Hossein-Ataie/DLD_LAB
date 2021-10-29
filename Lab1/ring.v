
`timescale 1ps/1ps

module RingOscillator#(parameter InverterCount = 5, parameter InverterDelay = 20)(input rst, output reg pulse);

    reg [InverterCount:0]w;
    integer i;
    always @(pulse) begin
        for (i = 0; i < InverterCount; i = i + 1) begin
            #(InverterDelay) w[i+1] = ~w[i];
        end
        w[0] = w[InverterCount];
    end

    always @(posedge rst)begin
        w[0] = 1'b0;
        w[InverterCount] = 1'b0;
    end

    always @(w[0]) begin
        pulse = w[0];
    end
    
endmodule