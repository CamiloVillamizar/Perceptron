class Point {
  float x, y;//coordinates for each on-screen point
  int label;//keeps track of what the perceptron is supposed to guess
  
  Point(){
    x = random(width);//give initial random values for the x & y coordinates
    y = random(height);
    
    if(x > y) {//decide if point is above or below line
      label = 1;
    } else {
      label = -1;
    }
  }
  
  void show(){//show point on-screen
    stroke(0);
    if(label == 1){
      fill(255);
    }else {
      fill(0);
    }
    ellipse(x, y, 32, 32);
  }
  
}