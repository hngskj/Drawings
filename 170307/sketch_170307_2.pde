import java.util.Calendar;
// http://www.ricardmarxer.com/geomerative/documentation/geomerative/RCommand.html
//
// Use this to set the segmentator type.
//
// ADAPTATIVE segmentator minimizes the number of segments avoiding perceptual
// artifacts like angles or cusps. Use this in order to have Polygons and Meshes
// with the fewest possible vertices. This can be useful when using or drawing a
// lot the same Polygon or Mesh deriving from this Shape.
//
// UNIFORMLENGTH segmentator is the slowest segmentator and it segments the curve
// on segments of equal length. This can be useful for very specific applications
// when for example drawing incrementaly a shape with a uniform speed.
//
// UNIFORMSTEP segmentator is the fastest segmentator and it segments the curve
// based on a constant value of the step of the curve parameter, or on the number
// of segments wanted. This can be useful when segmpointsentating very often a
// Shape or when we know the amount of segments necessary for our specific application.
import geomerative.*;

RFont font;
String myText = "alt";
RPoint[] myPoints;

void setup() {
  size(700, 700);
  pixelDensity(2);
  background(255);
  stroke(0);
  noFill();

  RG.init(this);
  font = new RFont("System San Francisco Display Regular.ttf", 500, CENTER);

  RCommand.setSegmentLength(20);//TRY DIFFERENT VALUES HERE
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  // RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  // RCommand.setSegmentator(RCommand.ADAPTATIVE);

  RGroup myGroup = font.toGroup(myText);
  myPoints = myGroup.getPoints();
}

void draw() {
  background(255);
  translate(width/2.2, height/1.4);
  beginShape();
  beginShape(TRIANGLE_STRIP);
  for (int i=0; i<myPoints.length; i++) {
    // vertex(myPoints[i].x, myPoints[i].y);

    // if(i%5 == 0){
    //   fill(255, 0, 0);
    // } else {
    //   fill(255);
    // }

    ellipse(myPoints[i].x, myPoints[i].y, 5, 5);
    // curveVertex(myPoints[i].x, myPoints[i].y);
    // line(30,150,myPoints[i].x, myPoints[i].y);
    float mx = map(mouseX, 0, width, -width/2 + (width*0.1), width/2);
    float my = map(mouseY, 0, height, -height/2 - (height*0.2), height/2- (height*0.2));
    line(mx,my,myPoints[i].x, myPoints[i].y);
  }
  endShape();
}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
