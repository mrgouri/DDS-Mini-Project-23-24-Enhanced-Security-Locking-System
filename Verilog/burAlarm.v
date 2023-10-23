module BurAla (input latch, output reg burAlarm);
always @(*) begin //triggers whenever 'latch' changes
    if(~latch == 1'b1)
    begin
        burAlarm <= 1'b1; // If 'latch' broken, indicating a certain condition, set 'burAlarm' to '1'.
    end
    else begin 
        burAlarm <= 1'b0;// If 'latch' is not broken,set 'burAlarm' to '0'.
    end
end
endmodule