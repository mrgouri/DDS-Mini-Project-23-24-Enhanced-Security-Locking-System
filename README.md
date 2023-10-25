# DDS-Mini-Project-23-24-Enhanced-Security-Locking-System
Enhanced Security Locking Sytem - Design of Digital Systems(DDS) course mini project 

We wish to establish a robust security system to prevent individuals' unauthorised
access to restricted areas. This system is anticipated to demonstrate significant
utility in various public settings, including but not limited to hotels and staff-only
zones. Our security systems are engineered to effectively deter unlawful entry
while upholding safety protocols to facilitate swift evacuations during emergencies.

The security system operates through user input of a five-digit number. Initially, a
priority encoder converts decimal numbers into 4-bit binary representations, which
are then stored in five designated registers. These numbers are meticulously
organized using a counter and demultiplexer, ensuring they are sequenced based on
the order of entry.

Authentication is achieved through five 4-bit comparators, cross-referencing the
entered password with a one also stored in registers. An initial password is set and made known the user,
The user can reset the password after entering the correct password. 

![image](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/84714195-35e1-4099-b9b3-837e8a162d59)

The outputs of these comparators are systematically channeled to an AND gate. Access is granted only
when all the digits align correctly with the preset sequence, ensuring precise input
matching.

![image](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/dfda6df3-dde1-4cbe-967d-4d9f36a5b6b7)
![image](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/8ad7b766-8a3e-4675-affb-489df0590333)


To manage user input, a digit counter restricts the number of digits entered to
five. Upon reaching the limit, a multiplexer resets the counter, ensuring accurate
input tracking. Simultaneously, another counter monitors incorrect password
attempts. After three unsuccessful inputs, an alarm is activated, indicating a
potential security breach.

![image](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/6f19d42b-4f7f-4107-86b3-13d12d473dc6)

To disable the alarm, a distinct password must be entered, different from the one
used to open the lock. Upon entering the correct disabling password, the alarm
ceases, and the counter tracking incorrect attempts resets to zero. Similarly, the
incorrect attempts counter resets whenever the correct password is entered,
maintaining security integrity.
![image](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/150e909a-dd72-48c9-a762-b3f3931d04bd)

In the event of a fire alarm, the system automatically opens the door, prioritizing
occupants' safety. Additionally, a mechanism is in place to detect forced entry: a
looped wire through the latch. If broken, it triggers an additional alarm, enhancing
security measures.

![image](https://github.com/mrgouri/DDS-Mini-Project-23-24-Enhanced-Security-Locking-System/assets/127620752/c55c8411-35cf-4661-9a3c-04378d4889b1)

Furthermore, the system incorporates a robust record-keeping feature.
Timestamps of the last 10 door openings are meticulously recorded. This 
functionality is facilitated through an SD card module connected to a real-time
clock module on an Arduino Uno board. When the door is opened, the SD card
captures the precise date and time from the RTC module, storing this crucial
information for future reference.
Moreover, users can review these records effortlessly. Upon providing input, the
system displays the recorded data from the SD card on an LCD screen, ensuring
transparency and enabling users to monitor access history comprehensively
