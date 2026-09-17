module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output  reg [7:0] hh,
    output  reg [7:0] mm,
    output  reg [7:0] ss); 
    always @(posedge clk)begin
        if(reset) begin 
            hh<=8'h12;
            mm<=8'h00;
            ss<=8'h00;
            pm<=1'b0;
        end
        else if (ena) begin 
            if(ss!=8'h59)begin
                if(ss[3:0] == 4'h9)
                    ss<=ss+8'h07;
                else
                    ss<=ss+8'h01;
            end
            else begin 
                ss<=8'h00;
                if(mm != 8'h59)begin
                    if(mm[3:0] ==4'h9)
                        mm<=mm+8'h07;
                    else
                        mm<=mm+8'h01;
                end
                else begin 
                    mm<=8'h00;
                    if(hh == 8'h11)begin
                        hh<=8'h12;
                        pm<=~pm;
                    end
                    else if (hh == 8'h12)begin
                        hh <=8'h01;
                    end
                    else begin 
                        if(hh[3:0] == 4'h9)
                            hh<= hh+8'h07;
                        else
                            hh<=hh+8'h01;
                    end
                end
            end
        end
    end
endmodule
