`include "compare.v"

module Lock(input [0:3]A, input [0:3]B, input [0:3]C,input [0:3]D,input [0:3]E,input fireAlarm,output O);
//4-bit inputs for each pushbutton 
wire [2:0]w;
    wire o1,o2,o3,o4,o5;
    comp c1 (A,3'b001,o1); //Comparing each one of the inputs to the digit of the first password in the respective position
    comp c2 (B,3'b010,o2);
    comp c3 (C,3'b011,o3);
    comp c4 (D,3'b100,o4);
    comp c5 (E,3'b101,o5);
    //Output 1 if firealarm is high or if the combination of the above comparisions is high
    assign O =fireAlarm | o1&o2&o3&o4&o5;
endmodule

