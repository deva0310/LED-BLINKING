`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.08.2020 21:21:10
// Design Name: 
// Module Name: Dflipflop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Debounce_Switch
(
input clck,
input i_switch,
output o_switch
);
reg [17:0] r_counter = 17'b00000000000000000;
reg r_switch_bounce =1'b0;
parameter DELAY = 25000; 
always@(posedge clck)
begin
if(r_switch_bounce!=i_switch && r_counter<DELAY)
begin
   r_counter <=r_counter+1;
end
else if(r_counter==DELAY)
begin 
  r_counter <= 0;
  r_switch_bounce <= i_switch;
end 
else
begin
  r_counter <=0;
end  
end
assign o_switch = r_switch_bounce;
endmodule
module Dflipflop(
input i_switch_1,
input i_clck,
output o_led
    );
 reg prev_switch = 1'b0;
 reg r_led       = 1'b0;
 wire w_switch;
 Debounce_Switch Instance 
 (
 .clck(i_clck),
 .i_switch(i_switch_1),
 .o_switch(w_switch)
 );
 always@(posedge i_clck)
 begin
 prev_switch <= w_switch;
 if(prev_switch == 1 && w_switch ==0)
 begin
   r_led = ~r_led;
 end 
 end
 assign o_led = r_led;
endmodule
