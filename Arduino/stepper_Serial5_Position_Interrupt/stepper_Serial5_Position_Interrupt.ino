// incorporate math library that contains advanced math functions
#include <math.h>

// rename pins used for easier coding =======================

byte Dir0 = 4;    byte Dir1 = 9;
byte Step0 = 5;   byte Step1 = 10;
byte m10 = 6;     byte m11 = 11;
byte m00 = 7;     byte m01 = 12;
byte sleep0 = 13;  byte sleep1 = 8;
// initialise motor pins catalog ============================
int motorCatalog[2][5] = {
  {Dir0, Step0, m10, m00, sleep0},
  {Dir1, Step1, m11, m01, sleep1}  
};

// initialise array of movement parameters ==================
float motorMove[2][3] = {};

// initialise array of resolution values ====================
int resArray[6][3] ={
  {1,0,0},{1,1,0},{0,0,0},{1,0,1},{1,1,1},{0,0,1}
};

// csv parameters ===========================================
int motorName; 
int Resolution;   
int Direction;
int Degrees;
int go;  
int stepsToTake;  
float stepsPerDegrees = 8;

// initialise counter variables =============================
long ii = 0;           long jj = 0;
float distanceBetween0 = {};
float distanceBetween1 = {};

//  setup range function ====================================
bool inRange(int val, int minimum, int maximum)
{
  return ((minimum <= val) && (val <= maximum));
}

void setup() { //===========================================================================================
  // initialize the serial port: ============================
  Serial.begin(38400);
  while(!Serial){
    // Prevents other code from running until com port is connected
  }
  Serial.println("begin");
  
  // Define pins used =======================================
  pinMode(sleep0, OUTPUT);
  pinMode(Dir0,OUTPUT);
  pinMode(Step0,OUTPUT);
  pinMode(m10,OUTPUT);
  // pinMode(M00,OUTPUT); needs to swap between input and 
  // output based on loop conditions
  pinMode(sleep1, OUTPUT);
  pinMode(Dir1,OUTPUT);
  pinMode(Step1,OUTPUT);
  pinMode(m11,OUTPUT);
  // pinMode(M01,OUTPUT); needs to swap between input and 
  // output based on loop conditions

  // set current position as origin point ===================
  motorMove[0][0] = 0;
  motorMove[1][0] = 0;

  // setup rotation zero-ing pins ===========================
  pinMode(2, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(2),zeroM0, RISING);
  pinMode(3, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(3),zeroM1, RISING);

  // set sleep pins off =====================================
  digitalWrite(sleep0, LOW); // sleeps motor
  digitalWrite(sleep1, LOW); // sleeps motor
}

void loop() { // ============================================================================================
  
  // Have arduino wait to recieve input =====================
  while (Serial.available() > 0){
  
  // Interpret csv serial input =============================
  
  int motorName = Serial.parseInt();
  int Resolution = Serial.parseInt();
  int Direction = Serial.parseInt();
  float Degrees = Serial.parseFloat();
  int go = Serial.parseInt();
  
  // ========================================================
  if (go == 1){ 
  // only runs the following loop if the go condition is met,
  // prevents running when no serial information is given
  
  // ========================================================
  // calculate shortest possible path to take
  // VV reduces the Degrees value to either +/- 180 degrees from current position

  // could possibly be simplified
  
  while (Degrees > 360.0){
    Degrees = Degrees - 360.0;
  }
  if ((Degrees - motorMove[motorName][0]) > 180.0){
    Degrees = (Degrees - 360.0);
  }

  while (Degrees < -360.0){
    Degrees = Degrees + 360.0;
  }
  if ((Degrees - motorMove[motorName][0]) < -180.0){
    Degrees = (Degrees + 360.0);
  }

  float stepsToTake = (Degrees - motorMove[motorName][0])*(stepsPerDegrees);  //how many motor steps per degrees  

  // Calculate other variables ==============================
  float microStep = 1.0/(float)Resolution; // fraction needs to be float
  long microStepsToTake = round(abs(stepsToTake)*Resolution);
  
  // Save to Motor ==========================================
  motorMove[motorName][1] = (float)Resolution;
  motorMove[motorName][2] = (float)Degrees;
    Serial.println(motorMove[motorName][1]);
    Serial.println(motorMove[motorName][2]);
    delay(2000);

  // Check Resolution Conditions ============================
  int Res = log10(Resolution)/log10(2); 
  // ^^ finds the exponent value of 2^n, where n corresponds to a row in resArray
  // vv uses the information in the nth row of resArray to configure the resolution in the stepper board
    pinMode(motorCatalog[motorName][3],resArray[Res][0]);
    digitalWrite(motorCatalog[motorName][3],resArray[Res][1]);
    digitalWrite(motorCatalog[motorName][2],resArray[Res][2]);
    
  // Display motor information ==============================
  
  Serial.print("Moving motor ");
  Serial.print(motorName);
  Serial.print(" to ");
  Serial.print(Degrees);
  Serial.print(" degrees in ");
  Serial.print(microStepsToTake);
  Serial.println(" micro steps");
  }
  }
  // Actually move motor ====================================
    float increment0 = 1.0/(motorMove[0][1]*stepsPerDegrees);
    float increment1 = 1.0/(motorMove[1][1]*stepsPerDegrees);
    
    if (motorMove[0][0] >= motorMove[0][2] + increment0 || motorMove[0][0] <= motorMove[0][2] - increment0){  
      // ^^ compares current position to destination
      distanceBetween0 = motorMove[0][2] - motorMove[0][0];
      digitalWrite(motorCatalog[0][4], 1); // wakes motor
      
      if (distanceBetween0 >= increment0){  // checks if it should be moving clockwise or counter clockwise
        motorMove[0][0] = motorMove[0][0] + increment0;
        // ^^ adds 1 unit of distance to the position, proportional to resolution and steps per degrees
        Serial.println(motorMove[0][0]);
        digitalWrite(motorCatalog[0][0], 0); // sets direction
        digitalWrite(motorCatalog[0][1], 1); // sends pulse to step pin
      }
      else if (distanceBetween0 <= -increment0){  // checks if it should be moving clockwise or counter clockwise
        motorMove[0][0] = motorMove[0][0] - increment0;
        // ^^ subtracts 1 unit of distance to the position, proportional to resolution and steps per degrees
        Serial.println(motorMove[0][0]);
        digitalWrite(motorCatalog[0][0], 1); // sets direction
        digitalWrite(motorCatalog[0][1], 1); // sends pulse to step pin      
      }
    }
     else if (motorMove[0][0] <= motorMove[0][2] + increment0 && motorMove[0][0] >= motorMove[0][2] - increment0){
      digitalWrite(sleep0, LOW); // sleeps motor
    }
    if (motorMove[1][0] >= motorMove[1][2] + increment1 || motorMove[1][0] <= motorMove[1][2] - increment1){
      // ^^ compares current position to destination
      distanceBetween1 = motorMove[1][2] - motorMove[1][0];

      digitalWrite(motorCatalog[1][4], 1); // wakes motor
      if (distanceBetween1 >= increment1){  // checks if it should be moving clockwise or counter clockwise
        motorMove[1][0] = motorMove[1][0] + increment1;
        // ^^ adds 1 unit of distance to the position, proportional to resolution and steps per degrees        
        digitalWrite(motorCatalog[1][0], 0); // sets direction
        digitalWrite(Step1, 1); // sends pulse to step pin
      }
      else if (distanceBetween1 <= -increment1){  // checks if it should be moving clockwise or counter clockwise
        motorMove[1][0] = motorMove[1][0] - increment1;
        // ^^ subtracts 1 unit of distance to the position, proportional to resolution and steps per degrees
        digitalWrite(motorCatalog[1][0], 1); // sets direction
        digitalWrite(Step1, 1); // sends pulse to step pin        
      }
    }
     else if (motorMove[1][0] <= motorMove[1][2] + increment0 && motorMove[1][0] >= motorMove[1][2] - increment0){
      digitalWrite(sleep1, LOW); // sleeps motor
    }
    
  // switch pins off ========================================      
    delay(4);
    digitalWrite(motorCatalog[0][1], LOW);
    digitalWrite(motorCatalog[1][1], LOW);
}

void zeroM0() {
  motorMove[0][0] = 0;
  Serial.println("interrupt");
}
void zeroM1() {
  motorMove[1][0] = 0;
  Serial.println("interrupt");
}
