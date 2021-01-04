`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2021 21:12:41
// Design Name: 
// Module Name: led_blinking
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


module led_blinking(
input clck,reset,
output [3:0] led
    );
parameter delay = 10_000_000;
integer count = 0;
reg[3:0] temp;
always@(posedge(clck))
begin
if(reset==1'b1)
begin
   count <= 0;
   temp <= 0;
end
else if(count < delay)
begin
   count <= count + 1;
end
else
begin
  count <= 0;
  temp = ~ temp;
end
end
assign led = temp;
endmodule
