// incorporate math library that contains advanced math functions
#include <math.h>

// rename pins used for easier coding =======================
byte Dir0 = 4;    byte Dir1 = 9;
byte Step0 = 5;   byte Step1 = 10;
byte m10 = 6;     byte m11 = 11;
byte m00 = 7;     byte m01 = 12;

// initialise motor pins catalog ============================
int motorCatalog[2][4] = {
  {Dir0, Step0, m10, m00},
  {Dir1, Step1, m11, m01}  
};

// initialise array of movement parameters ==================
long motorMove[2][6] = {};

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

// initialise locking variables =============================
//byte lock0 = 0;       byte lock1 = 0;


void setup() { //===========================================================================================
  // initialize the serial port: ============================
  Serial.begin(38400);
  while(!Serial){
    // Prevents other code from running until com port is connected
  }
  Serial.println("begin");
  
  // Define pins used =======================================
  pinMode(Dir0,OUTPUT);
  pinMode(Step0,OUTPUT);
  pinMode(m10,OUTPUT);
  // pinMode(M00,OUTPUT); needs to swap between input and 
  // output based on loop conditions
  pinMode(Dir1,OUTPUT);
  pinMode(Step1,OUTPUT);
  pinMode(m11,OUTPUT);
  // pinMode(M01,OUTPUT); needs to swap between input and 
  // output based on loop conditions
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

  float stepsToTake = Degrees*(stepsPerDegrees); 
  //how many motor steps per degrees
  
  // Troubleshoot Area ======================================
  //Serial.println(go);
  //Serial.println(motorName);
  //Serial.println(Resolution);
  //Serial.println(Direction);
  //Serial.println(Degrees);    

  // Calculate other variables ==============================
  float microStep = 1.0/(float)Resolution; // fraction needs to be float
  long microStepsToTake = round(abs(stepsToTake)*Resolution);

  // Troubleshoot Area ======================================
  
  //Serial.println(microStep);
  //Serial.println(microStepsToTake);
  
  // Save to Motor ==========================================
  if (go == 1){
    motorMove[motorName][0] = microStepsToTake;
  
  // Check Resolution Conditions ============================
  if (Resolution == 1){
    pinMode(motorCatalog[motorName][3],OUTPUT);
    digitalWrite(motorCatalog[motorName][3],LOW);
    digitalWrite(motorCatalog[motorName][2],LOW);
  }
  else if (Resolution == 2){
    pinMode(motorCatalog[motorName][3],OUTPUT);
    digitalWrite(motorCatalog[motorName][3],HIGH);
    digitalWrite(motorCatalog[motorName][2],LOW);
  }
  else if (Resolution == 4){
    pinMode(motorCatalog[motorName][3],INPUT);
    digitalWrite(motorCatalog[motorName][3],LOW);
    digitalWrite(motorCatalog[motorName][2],LOW);
  }
    else if (Resolution == 8){
    pinMode(motorCatalog[motorName][3],OUTPUT);
    digitalWrite(motorCatalog[motorName][3],LOW);
    digitalWrite(motorCatalog[motorName][2],HIGH);
  }
    else if (Resolution == 16){
    pinMode(motorCatalog[motorName][3],OUTPUT);
    digitalWrite(motorCatalog[motorName][3],HIGH);
    digitalWrite(motorCatalog[motorName][2],HIGH);
  }
    else if (Resolution == 32){
    pinMode(motorCatalog[motorName][3],INPUT);
    digitalWrite(motorCatalog[motorName][3],LOW);
    digitalWrite(motorCatalog[motorName][2],HIGH);
  }
  // Check Direction Conditions =============================
  if (Degrees > 0 && Direction == 0){
    digitalWrite(motorCatalog[motorName][0], LOW);
    //Serial.println(" Condition 1");
  }
  else if (Degrees > 0 && Direction == 1){
    digitalWrite(motorCatalog[motorName][0], HIGH);
    //Serial.println(" Condition 2");
  }
  else if (Degrees < 0 && Direction == 0){
    digitalWrite(motorCatalog[motorName][0], HIGH);
    //Serial.println(" Condition 3");
  }
  else if (Degrees < 0 && Direction == 1){
    digitalWrite(motorCatalog[motorName][0], LOW);
    //Serial.println(" Condition 4");
  }

  // Display motor information ==============================
  Serial.print("Moving motor ");
  Serial.print(motorName);
  Serial.print(" ");
  Serial.print(Degrees);
  Serial.print(" degrees in ");
  Serial.print(microStepsToTake);
  Serial.println(" micro steps");
  }
  }
  // Actually move motor ====================================
    if (ii < motorMove[0][0]){
    digitalWrite(motorCatalog[0][1], HIGH);
    ii = ii+1;
    }
    else if (ii == motorMove[0][0]){
    ii = 0;
    motorMove[0][0] = 0;
    }
    
    if (jj < motorMove[1][0]){
    digitalWrite(motorCatalog[1][1], HIGH);
    jj = jj+1; 
    }
    else if (jj == motorMove[1][0]){
    jj = 0;
    motorMove[1][0] = 0;
    }
  // switch pins off ========================================      
    delay(4);
    digitalWrite(motorCatalog[0][1], LOW);
    digitalWrite(motorCatalog[1][1], LOW);
}

