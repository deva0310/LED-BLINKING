`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2020 11:33:46
// Design Name: 
// Module Name: Led_blinking
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


module Led_blinking(
input clck,
//output LED
input [3:0]button,
output [3:0]anode,
output led_A,
output led_B,
output led_C,
output led_D,
output led_E,
output led_F,
output led_G
    );
 reg [25:0]r_counter_1 = 25'b0000000000000000000000000;
 reg [4:0] count_display = 5'b00000;
 reg r_led = 1'b0;
 reg [4:0] count_display_1 = 5'b00000;
 reg [9:0] counter_1 = 10'b0000000000;
 reg [1:0] anode_count = 2'b00;
 reg [3:0] anode_r = 4'b0000;
 parameter DELAY = 25000000;
 parameter DELAY_1 = 625;
 reg [6:0] display_number = 7'h00;
 parameter MAX_COUNT = 9;
 parameter ANODE_MAX_COUNT = 1;
 always@ (posedge clck)
 begin
 counter_1 <= counter_1 +1;
 if(r_counter_1 < DELAY)
 begin
  r_counter_1 <= r_counter_1+1;
 end
 else if(r_counter_1 == DELAY)
 begin
   r_counter_1 <= 0;
   count_display <= count_display+1;
   //r_led = ~r_led;
 end   
 else
 begin 
 r_counter_1 <= 0;
 end
 if(counter_1 == DELAY_1)
 begin 
  anode_count <= anode_count+1;
  counter_1   <= 0;
 end
 if(anode_count > ANODE_MAX_COUNT)
 begin
   anode_count <=0;
 end 
 if(count_display > MAX_COUNT)
 begin
   count_display<=0;
   count_display_1 <= count_display_1 +1;
 end
 if(count_display_1 > MAX_COUNT)
 begin
   count_display_1<=0;
 end
 if(anode_count==0)
 begin
 anode_r[0]<=0;
 anode_r[1]<=1;
 case(count_display)
   4'b0000: display_number <= 7'h7E;
   4'b0001: display_number <= 7'h30;
   4'b0010: display_number <= 7'h6d;
   4'b0011: display_number <= 7'h79;
   4'b0100: display_number <= 7'h33;
   4'b0101: display_number <= 7'h5b;
   4'b0110: display_number <= 7'h5f;
   4'b0111: display_number <= 7'h70;
   4'b1000: display_number <= 7'h7f;
   4'b1001: display_number <= 7'h7b;
 endcase
 end
 else if(anode_count==1)
 begin
 anode_r[0]<=1;
 anode_r[1]<=0;
 case(count_display_1)
   4'b0000: display_number <= 7'h7E;
   4'b0001: display_number <= 7'h30;
   4'b0010: display_number <= 7'h6d;
   4'b0011: display_number <= 7'h79;
   4'b0100: display_number <= 7'h33;
   4'b0101: display_number <= 7'h5b;
   4'b0110: display_number <= 7'h5f;
   4'b0111: display_number <= 7'h70;
   4'b1000: display_number <= 7'h7f;
   4'b1001: display_number <= 7'h7b;
 endcase
 end
 end
 //assign LED = r_led;
 assign anode = anode_r;
 //assign anode[0] = ~button[0];
 //assign anode[1] = ~button[1];
 //assign anode[2] = button[2];
 //assign anode[3] = button[3];
 assign led_A = ~display_number[6];
 assign led_B = ~display_number[5];
 assign led_C = ~display_number[4];
 assign led_D = ~display_number[3];
 assign led_E = ~display_number[2];
 assign led_F = ~display_number[1];
 assign led_G = ~display_number[0];
endmodule
