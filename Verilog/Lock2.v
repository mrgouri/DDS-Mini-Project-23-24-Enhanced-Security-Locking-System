`include "compare2.v"
//When the alarm is high the second password is to be entered
module Lock2(input [0:3]F, input [0:3]G, input [0:3]H,input [0:3]I,input [0:3]J,input alarm ,output  O2);
//4-bit inputs for each pushbutton 
wire [2:0]w;
wire o1,o2,o3,o4,o5;
    comp2 c6 (F,3'b001,alarm,o1);//Comparing each one of the inputs to the digit of thes second password in the respective position
    comp2 c7 (G,3'b010,alarm,o2);
    comp2 c8 (H,3'b011,alarm,o3);
    comp2 c9 (I,3'b100,alarm,o4);
    comp2 c10 (J,3'b101,alarm,o5);
    //Output 1 if the combination of the above comparisions is high and the alarm goes off
    assign O2 = o1&o2&o3&o4&o5;
   
endmodule