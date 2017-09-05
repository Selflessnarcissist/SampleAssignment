//Setup
void setup () {
  size (400,400);
  background (0,0,0);
  frameRate (30);
  
}

//Initialize Variables
  boolean keyw = false;
  boolean keys = false;
  boolean keya = false;
  boolean keyd = false;
  boolean keyr = false;
  boolean keyup = false;
  boolean keydown = false;
  boolean keyleft = false;
  boolean keyright = false;
  int x = 200;
  int y = 200;
  float x2 = 200;
  float y2 = 200;
  float x3 = -100;
  float y3 = -100;
  float random;
  float speed = 3;
  int score = -1;
  boolean gameOn = true;
  int enemyCount = -1;
  boolean crashed = false;
  boolean wall = false;
  boolean debug = false;
  int keypressed = 0;
  
//Main Method
void draw () {
  
  
  if (gameOn == true) {
  background (0,0,0);
  fill(0,0,255);  
  rect (0,0,400,400);
  fill(0,0,0);  
  rect (3,3,394,394);
  
  fill(255,255,255);
  text("Score: "+score, 345,25);
  
  
  fill (255,255,255);
  noStroke();
  Food (x2,y2);
  Player (x,y);
  
  if (enemyCount >= 10) {
    Enemy(x3,y3);
  }
  
  
  
  if (enemyCount >= 10 && x3 > x) {
    x3 += -2;
  }
  if (enemyCount >= 10 && x3 < x) {
    x3 += 2;
  }
  if (enemyCount >= 10 && y3 > y) {
    y3 += -2;
  }
  if (enemyCount >= 10 && y3 < y) {
    y3 += 2;
  }
    
  if (keyup == true) {
    y+=-speed;
  }
  if (keydown == true) {
    y+=speed;
  }
  if (keyleft == true) {
    x+=-speed;
  }
  if (keyright == true) {
    x+=speed;
  }
  
  if (x2-x < 15 && y2-y < 15 && x-x2 < 15 && y-y2 < 15) {
    random = random (30,370);
    x2 = random;
    random = random (30,370);
    y2 = random;
    speed += 0.1;
    score += 1;
    enemyCount += 1;
  }
  
   if (x3-x < 10 && y3-y < 10 && x-x3 < 10 && y-y3 < 10) {
      gameOn = false;
      crashed = true;
   }
   
   if (x > 390 || x < 10 || y > 390 || y < 10) {
     gameOn = false;
     wall = true;
   }
  }
  
  //In between games
  if (gameOn == false) {
    background (0,0,0);
    fill(0,0,255);  
    rect (0,0,400,400);
    fill(0,0,0);  
    rect (3,3,394,394);
  
    fill(255,255,255);
    text("Score: "+score, 345,25);
    strokeWeight(30);
    textAlign(CENTER,CENTER);
    text ("GAME OVER", 190, 100);
    
    if (crashed == true) {
    strokeWeight(20);
    textAlign(CENTER,CENTER);
    text ("You crashed into an enemy.", 200, 150); 
    }
    
    if (wall == true) {
    strokeWeight(20);
    textAlign(CENTER,CENTER);
    text ("You crashed into the wall.", 200, 150); 
    }
    
    strokeWeight(20);
    textAlign(CENTER,CENTER);
    text ("Press R to restart.", 200, 250);
  
    fill (255,255,255);
    noStroke();
    Food (x2,y2);
    Player (x,y);
    
    if (enemyCount >= 10) {
      Enemy(x3,y3);
    }
    
    
    if (keyr == true) {
      gameOn = true;
      enemyCount = -1;
      keyr = false;
      keyup = false;
      keydown = false;
      keyleft = false;
      keyright = false;
      crashed = false;
      x = 200;
      y = 200;
      x2 = 200;
      y2 = 200;
      x3 = -100;
      y3 = -100;
      random = random (30,370);
      speed = 3;
      score = -1;
      
      
      //Not restarting properly!
      
    }
    
    
  }
}

void Player (int x,int y) {
  fill(255);
  noStroke();
  ellipse (x,y,35,35);
}

void Food (float x, float y) {
  fill(255,0,0);
  noStroke();
  ellipse (x,y,25,25);
  fill(255,0,0);
  noStroke();
  ellipse (x,y,25,25);
}

void Enemy (float x, float y) {
  fill(0,255,0);
  noStroke();
  ellipse (x,y,20,20);
}

void keyPressed() {
    if (keyCode == UP || key == 'w') {
      keyup = true;
    }
    if (keyCode == LEFT || key == 'a') {
      keyleft = true;
    }
    if (keyCode == RIGHT || key == 'd') {
      keyright = true;
    }
    if (keyCode == DOWN || key == 's') {
      keydown = true;
    }
    if (key == 'r') {
      keyr = true;
    }
}

void keyReleased() {
    if (keyCode == UP || key == 'w') {
      keyup = false;
    }
    if (keyCode == LEFT || key == 'a') {
      keyleft = false;
    }
    if (keyCode == RIGHT || key == 'd') {
      keyright = false;
    }
    if (keyCode == DOWN || key == 's') {
      keydown = false;
    }
}