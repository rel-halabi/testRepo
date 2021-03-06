import processing.video.*;
boolean shadowDetect;
Capture video;

void setup() {
  size(640,480);
  video = new Capture(this, 640, 480, 18);
  video.start();
  stroke(0,255,0);
  frameRate(18);
  shadowDetect= false;
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  background(0);
  image(video, 0,0);
  
  for (int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      color c = get(x,y);
      
      if (shadowDetect) {
        if (c < color(5)) {
          stroke(0,255,0) ;
          point(x,y);
        }
      }
      
    }
  }
 
}

void keyPressed() {
  switch(key) {
    case ' ':
      shadowDetect = !shadowDetect;
  }

}
