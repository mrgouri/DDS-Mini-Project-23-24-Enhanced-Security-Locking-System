`include "Lock.v"
`include "counter.v"
`include "alarm.v"
`include "Lock2.v"
`include "burAlarm.v"

module Lock_tb;
    reg [0:3]A;
    reg [0:3]B;
    reg [0:3]C;
    reg [0:3]D;
    reg [0:3]E,F,G,H,I,J;
    reg fireAlarm;
    reg [0:2]iniCount;
    wire O,O2;
    wire [0:2]count;
    wire alarm,latch,burAlarm;
    Lock L1(A,B,C,D,E,fireAlarm,O);
counter l2(O,iniCount,fireAlarm,O2,count);
alarm l3(count,latch,alarm);
Lock2 l4(F,G, H,I,J,alarm,O2);
BurAla l5(latch,burAlarm);

assign latch  = 1'b1;

    initial begin
        $dumpfile("Lock.vcd");
        $dumpvars(0,Lock_tb);
    end

    initial begin 
        fireAlarm=1'b0;
        iniCount=3'b000;
        A = 4'b0101;
        B = 4'b0001;
        C = 4'b0111;
        D = 4'b0011;
        E = 4'b1001;
        $display("LOCK");
        $display("  Open |  Count  | Alarm | Burglar Alarm |");
        $monitor("%b  %b  %b  %b ",O,count,alarm,burAlarm);

        
        F = 4'b0001;
        G = 4'b0110;
        H = 4'b0010;
        I = 4'b1000;
        J = 4'b0111;
        // $display("LOCK");
        //$monitor("%b",O2);

        repeat(5)begin
        #100
        
        iniCount = count;
        A = A + 4'b0001;
        B = B + 4'b0001;
        C = C + 4'b0001;
        D = D + 4'b0001;
        E = E + 4'b0001; 
        end      
        #10
        fireAlarm=fireAlarm+ 1'b1;

    end
    initial #1000 $finish;



endmodule