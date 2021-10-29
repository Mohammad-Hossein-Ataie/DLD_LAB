
`timescale 1 ns/ 1 ns

module Tb();
    
    reg en = 1'b0;
    reg Dmsb = 1'b1;
    reg Cmsb = 1'b0;
    reg Bmsb = 1'b0;
    reg Amsb = 1'b0;
    reg Dlsb = 1'b1;
    reg Clsb = 1'b1;
    reg Blsb = 1'b1;
    reg Alsb = 1'b0;
    wire clk;
    reg Down_up = 1'b0;             // For count up
    reg en1 ;
    wire max_min;
    wire QAlsb;
    wire QBlsb;
    wire QClsb;
    wire QDlsb;
    wire QAmsb;
    wire QBmsb;
    wire QCmsb;
    wire QDmsb;

    Ring R(en1, clk);
    divider i1(max_min, en, Dmsb, Cmsb, Bmsb, Amsb, Dlsb, Clsb, Blsb, Alsb, clk, Down_up, QAlsb, QBlsb, QClsb, QDlsb, QAmsb, QBmsb, QCmsb, QDmsb);


    initial begin
        en1 = 1'b0;
        #3000 en1 = 1'b1;
        #100 en = 1'b1;
        #100 en = 1'b0;
        #100 en = 1'b1;
        #2000000 $stop;
    end


endmodule
	
	
	

