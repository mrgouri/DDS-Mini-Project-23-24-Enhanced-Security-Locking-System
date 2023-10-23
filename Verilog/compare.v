module comp(input[0:3]A, input [0:2]p, output  reg O);

    always @(*) begin //triggers whenever either 'A' or 'p' changes.
         
        if(p == 3'b001) begin
          //If the position is 1 it compares the input with the 1st digit of the 1st password which is 5
            O <= (A == 4'b0101); 
            end
        else if(p == 3'b010) begin
          //If the position is 2 it compares the input with the 2nd digit of the 1st  password which is 1
             O <= (A == 4'b0001);
        end
        else if(p == 3'b011)begin 
          //If the position is 3 it compares the input with the 3rd digit of the 1st password which is 7
             O <= (A == 4'b0111);
        end
        else if(p==3'b100)begin 
          //If the position is 4 it compares the input with the 4th digit of the 1st password which is 3
             O <= (A == 4'b0011);
        end
        else begin 
          //else it compares the input with the 5th digit of the 1st password which is 9
             O <= (A == 4'b1001);
        end
    end
endmodule
