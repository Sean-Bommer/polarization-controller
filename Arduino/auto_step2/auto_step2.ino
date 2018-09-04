 /* written by Sean Bommer, last edited 28/08/2018
this code is setup to test for any issues of motor drift in the setup, motor drift
is a measure of how much the rotation of the waveplate wanders over continous use.
to be used in conjuction with the matlab script 'motorDriftTest.m' available at 
https://github.com/Sean-Bommer/polarization-controller

for the experiental setup, place the PCU unit with one waveplate in between a polarized laser source 
and a polarizing beam splitter. Then have a photodiode connected to an oscilloscope reading the output
of that photodiode. A cos^2(2theta) waveform should be visible with horizontal sections each quarter turn.

these horizontal sections should be inline with each other with no noticable tendency to drift up or down.
this result by itself can be used if higher accuracy isn't required. 
If not, export this result to a spreadsheet file and analyse with the Matlab 'motorDriftTest.m' mentioned before.
*/

byte sleep1 = 8; 
byte step1 = 10;
byte m11 = 11;
byte m01 = 12;

byte sleep0 = 13;
byte step0 = 5;
byte m10 = 6;
byte m00 = 7;

// setup the pins to control both stepper motors.
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(sleep1, OUTPUT);
  pinMode(step1, OUTPUT);
  pinMode(m11, OUTPUT);
  pinMode(m01, OUTPUT);
  
  digitalWrite(sleep1, HIGH);
  // set the step resolution ===
  digitalWrite(m11, LOW);
  digitalWrite(m01, LOW);
  // ===========================
  pinMode(sleep0, OUTPUT);
  pinMode(step0, OUTPUT);
  pinMode(m10, OUTPUT);
  pinMode(m00, OUTPUT);

  digitalWrite(sleep0, HIGH); 
  // set the step resolution === 
  digitalWrite(m10, LOW);
  digitalWrite(m00, LOW);
  // ===========================
}

// the loop function runs over and over again forever
void loop() {

  // move the waveplates 90 degrees.
  for (int ii = 1; ii<= 720; ii++){
  digitalWrite(step1, HIGH);
  digitalWrite(step0, HIGH);
  delay(4);
  digitalWrite(step1, LOW);
  digitalWrite(step0, LOW);
  delay(4);
  }
  // switch off and pause the stepper motors 
  digitalWrite(sleep1, LOW);
  digitalWrite(sleep0, LOW);   
  delay(3000);
  digitalWrite(sleep1, HIGH);
  digitalWrite(sleep0, HIGH); 
}
