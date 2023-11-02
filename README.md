# DDS-Mini-Project-23-24-Enhanced-Security-Locking-System

## Team Details
<details>
  <summary>Detail</summary>
Semester: 3rd Sem B. Tech. CSE

Section: S1

221CS114 	B Anagha			          banagha.221cs114@nitk.edu.in	      9108095497

221CS117	Ch V Sushma Reddy 		  sushmach.221cs117@nitk.edu.in	      7013060863

221CS125	Gouri M R			          gourimr.221cs125@nitk.edu.in	      7907526949

</details>


## Abstract
<details>
  <summary>Detail</summary>



BACKGROUND

Password-based locking mechanisms are increasingly favoured for protecting valuable possessions. Traditional locks have seen substantial modernisation recently, driven by rapid technological advancements. This evolution has ushered in advanced digital code locks that excel in compactness, security, and reliability compared to their mechanical counterparts. As a result, digital code locks have become the preferred choice for those seeking enhanced security measures in today's technologically driven world.

MOTIVATION

We wish to establish a robust security system to prevent individuals' unauthorised access to restricted areas. This system is anticipated to demonstrate significant utility in various public settings, including but not limited to hotels and staff-only zones. Our security systems are engineered to effectively deter unlawful entry while upholding safety protocols to facilitate swift evacuations during emergencies.

OUR UNIQUE CONTRIBUTION

Our system integrates a preset master password with a five-character input limit, facilitating door unlocking upon a correct match. It also includes a login attempt counter, triggering an alarm that can be silenced by a unique password distinct from the unlocking code. Additionally, we plan to implement comprehensive record-keeping, integration with a fire alarm system for emergency door unlocking during fire incidents, display if the entered password is correct and maintain a count of incorrect passwords entered. Moreover, a burglar alarm will be activated during forced entry to enhance security.

REFERENCES

Morris Mano Design of Digital Systems

https://www.gadgetronicx.com/digital-code-lock-circuit-without-microcontroller/

https://arduinogetstarted.com/tutorials/arduino-log-data-with-timestamp-to-sd-card

https://dronebotworkshop.com/sd-card-arduino/

https://www.chipverify.com/verilog/verilog-tutorial

</details>

## Working
<details>
  <summary>Detail</summary>


The security system operates through user input of a five-digit number. Initially, a
priority encoder converts decimal numbers into 4-bit binary representations, which
are then stored in five designated registers. These numbers are meticulously
organized using a counter and demultiplexer, ensuring they are sequenced based on
the order of entry.

Authentication is achieved through five 4-bit comparators, cross-referencing the
entered password with a one also stored in registers. An initial password is set and made known the user,
The user can reset the password after entering the correct password. 

The outputs of these comparators are systematically channeled to an AND gate. Access is granted only
when all the digits align correctly with the preset sequence, ensuring precise input
matching.

To manage user input, a digit counter restricts the number of digits entered to
five. Upon reaching the limit, a multiplexer resets the counter, ensuring accurate
input tracking. Simultaneously, another counter monitors incorrect password
attempts. After three unsuccessful inputs, an alarm is activated, indicating a
potential security breach.

To disable the alarm, a distinct password must be entered, different from the one
used to open the lock. Upon entering the correct disabling password, the alarm
ceases, and the counter tracking incorrect attempts resets to zero. Similarly, the
incorrect attempts counter resets whenever the correct password is entered,
maintaining security integrity.

In the event of a fire alarm, the system automatically opens the door, prioritizing
occupants' safety. Additionally, a mechanism is in place to detect forced entry: a
looped wire through the latch. If broken, it triggers an additional alarm, enhancing
security measures.

FUNCTIONAL TABLE

![image](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/1cbbe6da-5be7-4317-a359-fce20107dad7)

FLOWCHART

![Flowcharrrrrrtttttttttt drawio (3)](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/504b3002-f1a0-4872-a084-3759eed3ddc1)

Furthermore, the system incorporates a robust record-keeping feature.
Timestamps of the last 10 door openings are meticulously recorded. This 
functionality is facilitated through an SD card module connected to a real-time
clock module on an Arduino Uno board. When the door is opened, the SD card
captures the precise date and time from the RTC module, storing this crucial
information for future reference.
Moreover, users can review these records effortlessly. Upon providing input, the
system displays the recorded data from the SD card on an LCD screen, ensuring
transparency and enabling users to monitor access history comprehensively

</details>

## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>



![image](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/dfda6df3-dde1-4cbe-967d-4d9f36a5b6b7)

![image](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/8ad7b766-8a3e-4675-affb-489df0590333)

![image](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/6f19d42b-4f7f-4107-86b3-13d12d473dc6)

![image](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/84714195-35e1-4099-b9b3-837e8a162d59)

![image](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/150e909a-dd72-48c9-a762-b3f3931d04bd)

![image](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/c55c8411-35cf-4661-9a3c-04378d4889b1)

</details>

## Verilog Code
<details>
  <summary>Detail</summary>


Lock.v

```
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
```
Lock2.v
```
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
```
compare.v
```
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
```
compare2.v
```
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
```
counter.v
```
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
```
alarm.v
```
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
```
burAlarm.v
```
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
```
Lock_tb.v
```
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
```
Code for reading from and writing to an SD card
```
#include <SD.h>
#include <RTClib.h>
#include <LiquidCrystal.h>

//defining the ports of various inputs
LiquidCrystal lcd(12, 11, 5, 6, 7, 8);

#define PIN_SPI_CS 4
#define FILE_NAME "log.txt"
#define FILE_COPY "log_copy.txt"
#define SELECTVAR 3
#define READVAR 2

RTC_DS3231 rtc;
File myFile;
 //function to count number of lines in the file
int countLines(File file) {
  int count = 0;
  while (file.available()) {
    file.readStringUntil('\n');
    count++;
  }
  return count;
}

void setup() {
  Serial.begin(9600);

  // SETUP RTC MODULE
  if (!rtc.begin()) {
    Serial.println(F("Couldn't find RTC"));
    while (1);
  }

  if (!SD.begin(PIN_SPI_CS)) {
    Serial.println(F("SD CARD FAILED, OR NOT PRESENT!"));
    while (1); // don't do anything more:
  }

  Serial.println(F("SD CARD INITIALIZED."));
  Serial.println(F("--------------------"));
  lcd.begin(16, 2);
}

void loop() {
  if (digitalRead(SELECTVAR) == HIGH) { //prints dat and time into the file when input is given
    File dataFile = SD.open(FILE_NAME);
    int linesCount = countLines(dataFile);
    dataFile.close();

     File myFile = SD.open(FILE_NAME, FILE_WRITE);

      if (myFile) { //prints date and time if number of lines in the file s less than 10
            if (linesCount <= 10) {
        Serial.println(F("Writing log to SD Card"));

        // write timestamp
        DateTime now = rtc.now();
        myFile.print(now.year(), DEC);
        myFile.print('-');
        myFile.print(now.month(), DEC);
        myFile.print('-');
        myFile.print(now.day(), DEC);
        myFile.print(' ');
        myFile.print(now.hour(), DEC);
        myFile.print(':');
        myFile.print(now.minute(), DEC);
        myFile.print(':');
        myFile.print(now.second(), DEC);

        myFile.print("  "); // delimiter between timestamp and data
        myFile.println();   // new line

        myFile.close();
        delay(20000); // delay 20 seconds
      }
      else{ //deleting a line from the file if number of lines is greater than 10
        File myFileCopy = SD.open(FILE_COPY,FILE_WRITE);
        String s = myFile.readStringUntil('\n');
        while(myFile.available())
        {
          s=myFile.readStringUntil('\n');
          myFileCopy.println(s);
        }
        myFileCopy.close();
        myFile.remove();
        myFileCopy = SD.open(FILE_COPY);
        myFile = SD.open(FILE_NAME,FILE_WRITE);
        while(myFileCopy.available()){
          myFile.print(myFileCopy.readStringUntil('\n'));
        }
        myFileCopy.remove();
        DateTime now = rtc.now();
        myFile.print(now.year(), DEC);
        myFile.print('-');
        myFile.print(now.month(), DEC);
        myFile.print('-');
        myFile.print(now.day(), DEC);
        myFile.print(' ');
        myFile.print(now.hour(), DEC);
        myFile.print(':');
        myFile.print(now.minute(), DEC);
        myFile.print(':');
        myFile.print(now.second(), DEC);

        myFile.print("  "); // delimiter between timestamp and data
        myFile.println();   // new line

        myFile.close();
        delay(20000); 
      } 
      
    }
    else {
        Serial.print(F("SD Card: error on opening file "));
        Serial.println(FILE_NAME);
      }
  }

  if (digitalRead(READVAR) == HIGH) { //displaying contents of the file on an lcd screen
    File dataFile = SD.open(FILE_NAME);
    if (dataFile) {
      while (dataFile.available()) {
        String s = dataFile.readStringUntil('\n');
        lcd.print(s);
        delay(500);
        lcd.clear();
        delay(500);
      }
      dataFile.close();
    } else {
      Serial.println("error opening datalog.txt");
    }
  }
}
```
</details>



