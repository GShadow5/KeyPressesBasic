/*
    B12NumbersV3
    Basic processing key press tracker for reference.
    by Nayan Sawyer
    started May 13 2022
    version 1.0.1 May 16 2022
*/

int[] keys; // Declare key tracking array
Demo d; // Declare a demo object

void setup(){
  size(400,400);
  keys = new int[0]; // Initialize key tracking array
  d = new Demo(width/2,height/2); // Initialize demo object
}

void draw(){
  background(196);
  d.display(); // Display demo object
  
  // Output for demostration and debugging
  for(int i = 0; i < keys.length; i++){
    print(keys[i]);
  }
  println();
}

void keyPressed(){
  /*
    Add key to keys[] when it is pressed, but only add it one time
  */
  if(key == CODED){
    if(findInt(keys,keyCode) == -1){ // If key is not in keys[]
      keys = (int[])append(keys,keyCode); // Add keyCode to keys[]
    }
  }
  else{
    if(findInt(keys,key) == -1){ // If key is not in keys []
      keys = (int[])append(keys,key); // Add key to keys[]
    }
  }
}

void keyReleased(){
  /*
    Remove key from keys when it is released
  */
  int index = key == CODED ? findInt(keys,keyCode) : findInt(keys,key); // Get index of released key taking into account CODED status
  if(index != -1){ // If key is in keys[]
    keys[index] = keys[keys.length - 1]; // Swap key at end into the index to be replaced
    keys = (int[])shorten(keys); // Remove last key entry
  }
}

int findInt(int[] arr, int _in){
  /*
    Returns index of first instance of a given int in an array, and -1 if it is not present
  */
  if(arr.length == 0){return -1;} // Return -1 if array is empty
  for(int i = 0; i < arr.length; i++){ // For each element in the array
    if(arr[i] == _in){return i;} // If array[i] is the desired number return i 
  }
  return -1; // If the whole array has been parsed without returning return -1
}
