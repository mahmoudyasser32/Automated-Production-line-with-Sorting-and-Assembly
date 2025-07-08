#include <Servo.h>
//IR Sensors Pins
#define IRCam A6         //CAMERA STATION IR SENSOR
#define IRP11 A1          //PRODUCT 1 PART 1 IR SENSOR
#define IRP12 A2        //PRODUCT 1 PART 2 IR SENSOR
#define IRP21 A3          //PRODUCT 2 PART 1 IR SENSOR
#define IRP22 A4       //PRODUCT 2 PART 2 IR SENSOR
#define IRfeeding A5      //Feeding IR SENSOR

//Motor Driver Pins
#define Int1Conveyor 2    //int1 for Motor Driver
#define Int2Conveyor 4    //int2 for Motor Driver

//Servo Motors Realted Configuration
Servo CamServo;
Servo FeedingServo;
Servo Toll1Servo;
Servo Toll2Servo;
Servo Toll3Servo;
int posCam=0;
int posFeed=0;

//Condition Variables
char CameraSort=0;         //Variable recieved from camera to tell which part it did detect

int FeedingStart=1;       //Variable needed to initiate the Feeder
int sorting=0;            //Variable to tell that we are in the sorting camera stage if =1
int GateDown=0;           //Variable needed to tell if one of the main tolls are lowered
int P1P1=0;               //Variable to tell if part 1 of product 1 is in place
int P1P2=0;               //Variable to tell if part 2 of product 1 is in place
int P2P1=0;               //Variable to tell if part 1 of product 2 is in place
int P2P2=0;               //Variable to tell if part 2 of product 2 is in place
int Product1=0;           //Variable to tell if all of the parts of product 1 are in place
int Product2=0;           //Variable to tell if all of the parts of product 2 are in place 


void servoUp90(Servo servo)      //*Function to lower the camera station toll*
{
  for (posCam =  15; posCam <= 90; posCam += 5)   // goes from 0 degrees to 90 degrees in steps of 1 degree
  { 
    servo.write(posCam);                     // tell servo to go to position in variable 'posCam'
    delay(15);                                  // waits 15 ms for the servo to reach the position
  }
}
void servoDown90(Servo servo)        //*Function to lift the Camera Station toll*
{
  for ( posCam= 90; posCam >= 15; posCam -= 5) {   // goes from 90 degrees to 0 degrees
    servo.write(posCam);                       // tell servo to go to position in variable 'posCam'
    delay(15);                                    // waits 15 ms for the servo to reach the position
  }
}

void Feeding180()      //*Feeding Function Servo*
{
  for ( posFeed= 0; posFeed <= 120; posFeed += 1) { // goes from 0 degrees to 180 degrees in steps of 5 degree
    FeedingServo.write(posFeed);                    // tell servo to go to position in variable 'posFeed'
    delay(10);                                      // waits 15 ms for the servo to reach the position
  }
}

void FeedingReturn()    //*Feeding Returning Servo Function*
{
  for ( posFeed= 120; posFeed >= 0; posFeed -= 5) { // goes from 180 degrees to 0 degrees
    FeedingServo.write(posFeed);                    // tell servo to go to position in variable 'posFeed'
    delay(15);                                      // waits 15 ms for the servo to reach the position
  }
}

void setup() {
  CamServo.attach(9);
  FeedingServo.attach(10);
  Toll1Servo.attach(3);
  Toll2Servo.attach(5);
  Toll3Servo.attach(6);
  pinMode(Int1Conveyor,OUTPUT);
  pinMode(Int2Conveyor,OUTPUT);
  pinMode(IRCam,INPUT);
  pinMode(IRP11,INPUT);
  pinMode(IRP12,INPUT);
  pinMode(IRP21,INPUT);
  pinMode(IRP22,INPUT);
  pinMode(IRfeeding,INPUT);
  Serial.begin(9600);
  CamServo.write(0);
  FeedingServo.write(0);
  Toll1Servo.write(90);
  Toll2Servo.write(90);
  Toll3Servo.write(90);

}

void loop() {
  //Feeding Code || Explaination: the feeder feeds the part to the conveyor and returns back
  while(1)
   {
    if (FeedingStart==1 && digitalRead(IRfeeding)==LOW )//&& end==0)
     {
      Serial.println("Feed");
      CamServo.write(0);
      Toll1Servo.write(90);
      Toll2Servo.write(90);
      Toll3Servo.write(90);
      Feeding180();
      digitalWrite(Int1Conveyor, HIGH);    //Activate Motor of Conveyor
      digitalWrite(Int2Conveyor, LOW);
      delay(100);
      FeedingReturn();
      FeedingStart=0;
      sorting=1;
      break;
     }
   }
  while(1)
  {
  Serial.println("Cam");
  if(digitalRead(IRCam)==LOW && FeedingStart==0)
  {
    delay(800);
    digitalWrite(Int1Conveyor, HIGH);
    digitalWrite(Int2Conveyor, HIGH);
    break;
  }
  }
  //Sorting Gate Condition || Explaination: The code wait for an input from the camera module then opens the camera gate and restarts the conveyor
  while(sorting==1)
  {
  if(Serial.available())
  {
    delay(10); // For stability 
    CameraSort=Serial.read();
    switch(CameraSort)
    {
      case('R'):
      {
       
       CamServo.write(70);
       GateDown=1;
       sorting-=1;
        digitalWrite(Int1Conveyor, HIGH);    //Activate Motor of Conveyor
        digitalWrite(Int2Conveyor, LOW);
        delay(6000);
        FeedingStart=1;
       break;
      }

     case('r'):
      {
        servoDown90(Toll1Servo);
        CamServo.write(70);
        GateDown=1;
        sorting-=1;
        digitalWrite(Int1Conveyor, HIGH);    //Activate Motor of Conveyor
        digitalWrite(Int2Conveyor, LOW);
        delay(8000);
        FeedingStart=1;
        break;
      }

      case('B'):
    {
        servoDown90(Toll2Servo);
        CamServo.write(70);
        GateDown=1;
        sorting-=1;
        digitalWrite(Int1Conveyor, HIGH);    //Activate Motor of Conveyor
        digitalWrite(Int2Conveyor, LOW);
        delay(8000);
        FeedingStart=1;
        break;
    }
      case('b'):
    {
        servoDown90(Toll3Servo);
        CamServo.write(70);
        GateDown=1;
        sorting -=1;
        digitalWrite(Int1Conveyor, HIGH);    //Activate Motor of Conveyor
        digitalWrite(Int2Conveyor, LOW);
        delay(8000);
        FeedingStart=1;
        break;
    }
    }
    Serial.println("Sort");
  }
    
  }
  //Post-Sorting Camera Stage || Explaination: After the camera select which lane should the product be stored at this codes keeps checking when did the next product get to its place then after the awaited product is in place it lifts the  toll gate that was lowered and and give the green light for the next part to be fed into the system
  if(GateDown==1)
  {
    
      if (digitalRead(IRP11)==LOW)
      {
        P1P1=1;
        GateDown=0;
      }
      if (digitalRead(IRP12)==LOW )
      {
        P1P2 =1;
        GateDown=0;
      }
      if (digitalRead(IRP21)==LOW)
      {
        P2P1 =1;
        GateDown=0;
      }
      if (digitalRead(IRP22)==LOW )
      {
        P2P2 =1;
        GateDown=0;
      }
      }
  if( P1P1==1 && P1P2==1)
  {
    Product1 =1;
  }
  if( P2P1==1 && P2P2==1)
  {
    Product2 =1;
  }
  if ( Product1==1)
  {
    //sending a message to TIVA C to make the arm starts assembly of product 1
    P1P1 -=1;
    P1P2 -=1;
    Serial.println('m');
    Product1 -=1;
    
  }
  if( Product2==1)
  {
    //sending a message to TIVA C to make the arm starts assembly of product 2
    P2P1-=1;
    P2P2-=1;
    Serial.println('n');
    Product2 -=1;
    
  }

}






