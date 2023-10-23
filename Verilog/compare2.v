module comp2(input[0:3]A, input [0:2]p,input alarm, output  reg O2);

    always @(*) begin //triggers whenever either 'A' or 'p' changes.
        if(alarm==1'b1) begin // THis is when the alarm goes high after 3 incorrect atttempts
        if(p == 3'b001) begin
          //If the position is 1 it compares the input with the 2nd digit of the 1st password which is 1
            O2 <= (A == 4'b0001);
            end
        else if(p == 3'b010) begin
          //If the position is 2 it compares the input with the 2nd digit of the 2nd password which is 6
             O2 <= (A == 4'b0110);
        end
        else if(p == 3'b011)begin 
          //If the position is 3 it compares the input with the 3rd digit of the 2nd password which is 2
             O2 <= (A == 4'b0010);
        end
        else if(p==3'b100)begin 
          //If the position is 3 it compares the input with the 4th digit of the 2nd password which is  8
             O2 <= (A == 4'b1000);
        end
        else begin 
          //else it compares the input with the 5th digit of the 2nd password which is 7
             O2 <= (A == 4'b0111);
        end
        end
 end
endmodule