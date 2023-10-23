//This is to maintain the count of the number of wrong passwords entered and to reset it.
module counter(input O,input [0:2]iniCount, input fireAlarm,  input O2, output reg [0:2]count);
   always @(*) begin //Triggers whenever any of the input signals change.
      if ((fireAlarm | O2 | O) == 1'b1)
      begin
         count <= 3'b000;// , Resetting 'count' to '000',if any of 'fireAlarm', 'O2'(alarm is disabled), or 'O'(Entered password is correct) is high.
      end
else if(O==1'b0)
begin
count<=iniCount+3'b001;// If entered password is wrong, incrementing the counter
   end
else begin
count<=iniCount;//else maintain the same count
 end
   end
endmodule
