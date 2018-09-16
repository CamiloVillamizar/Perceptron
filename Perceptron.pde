class Perceptron {
  float[] weights = new float[2];//contains the weights for the inputs
  float lr = 0.01;//learning rate
  
  //Constructor
  Perceptron(){
    for(float weight : weights){
      weight = random(-1, 1);//assign random weights initially
    }
    
    printWeights();//print out initial weights
  }
  
  int guess(float[] inputs){//make a prediction for the point passed in
    float sum = 0;
    
    for(int i = 0; i < weights.length; i++){
      sum += inputs[i]*weights[i];
    } 
    return getSign(sum);//convert the sum into a 1 or -1 representing above or below the line
  }
  
  int getSign(float input){//returns 1 if input num is positive -1 if negative
    if(input >= 0){
      return 1;
    } else {
      return -1;
    }
  }
  
  void train(float[] inputs, int target){//adjusts weights if guess was wrong, if it was right, it does nothing
    int guess = guess(inputs);
    int error = target - guess;//0 if correct, 1 or -1 if not
    
    if(error != 0){
      for(int i = 0; i < weights.length; i++){
        weights[i] += error * inputs[i] * lr;
      }
    }
  }
  
  void printWeights(){
    println("[" + weights[0] + "], [" + weights[1] + "]");//print out weight data to screen
  }
}