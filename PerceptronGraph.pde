Perceptron perc;//create a variable to contain the perceptron
Point[] points = new Point[100];//create an array to hold 100 points onscreen
int ptCounter;//point counter keeps track of current point for training
boolean trainingDone;//used to check if the training process is done]
int itrCount;//counts how many training iterations have passed since the start of the program

void setup(){
  size(800, 800);//set screen size
  
  perc = new Perceptron();//initialize values
  ptCounter = 0;
  itrCount = 0;
  
  for(int i = 0; i < points.length; i++){
    points[i] = new Point();//fill points array with new point objects
  }
}

void draw(){
   background(255);//erase screen
   trainingDone = true;//reset training done variable to check for the current iteration
   
   stroke(0);//set line's color
   line(0, 0, width, height);//draw line
   
   for(Point pt : points) {
     pt.show();//show all the points on-screen
   }
   
   for(Point pt : points){
     float[] inputs = {pt.x, pt.y};//put current point's coordinates into an array
     int target = pt.label;//get where the point should be(above or below line)
     //perc.train(inputs, target);
     
     int guess = perc.guess(inputs);//see where the perceptron thinks the point is
     if (guess == target) {//if correct set color to green
       fill(0, 255, 0);
     } else {//if wrong set color to red
       fill(255, 0, 0);
       trainingDone = false;
     }
       noStroke();
       ellipse(pt.x, pt.y, 16, 16);//draw the colored ellipse to see if the
       //percepton's guess was right
   }
   
   if(ptCounter < 100){//makes perceptron train one point at a time
   //if it didn't it would be too fast to see it train
   
     float[] inputs = {points[ptCounter].x, points[ptCounter].y};//get currentPoint's coordinates
     int target = points[ptCounter].label;//get where the point should be(above or below line)
     perc.train(inputs, target);//send the data to the perceptron's training function for it to learn
     perc.printWeights();//print weights to look for a pattern in how they change
     ptCounter++;//increase counter so the next point will be processed
     
   } else {
     ptCounter = 0;//reset the counter if at the end of the array
   }
   
  if(trainingDone == true){
     println("TRAINING FINISHED -> ITERATION COUNT: " + itrCount);
     perc.printWeights();
     noLoop();
   }
   
   itrCount++;
}

void mousePressed(){
  perc.printWeights();
}