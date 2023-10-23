module alarm(input [2:0]count,input latch,output reg alarm);//triggers whenever 'count' or 'latch' changes.
 always @(*) begin
if(count>=3'b011 | ~latch)begin
    alarm=1'b1;// Set alarm to '1' ,if 'count' is greater than or equal to 3 or 'latch' is broken.
 end
 else begin
alarm=1'b0; // Otherwise, seting 'alarm' to '0.
 end
 end
endmodule