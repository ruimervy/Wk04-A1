/*
*  A Super Simple 'k' drawn by positioning shapes
*  Colour changing for both parts of the letter
*  quek rui tian mervy 24/08/2012
*  ruimervy@gmail.com
*/




import processing.serial.*;  // Import Serial class library
Serial myPort;  // Create object from Serial class



float val1 = 0;
float val2 = 0;

void setup() 
{
  size(400, 400);
 
  //for Windows
  //String portName = "COM97"; //change this port the same name as Arduino->Tool->Serial Port
  //for Mac OSX
  String portName = Serial.list()[0]; //the first port
   
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n'); // buffer incoming characters until line feed.
}

//serialEvent function is called when incoming character reaches '\n'
void serialEvent(Serial p){
  String s = "";        // string value received.
  String[] values;      // splitted string values.
  
  if(p.available() > 0){  // check number of characters in the serial buffer 
    s = p.readString();   // read string.
    if(s != null){ 
      println("received:"+s);
      
      values = s.split(",");     // separate values with ',' characters.
      println(values);           
      
      val1 = float(values[0]);
      val2 = float(values[1]);
    }
  }
}

void draw()
{
  background(0);             // Set background to white
  fill(val1);                   // change fill color
noStroke();
quad(255,129,297,129,203,230,159,233);
quad(203,230,301,347,255,347,159,233);
fill(0,val2,234);
rect(121,31,38,315);

}
