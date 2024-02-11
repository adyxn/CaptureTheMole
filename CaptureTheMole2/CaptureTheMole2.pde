//Collaborative Project
// THE VARIABLE M used in comments shows code that my collegue worked on.

//CAPTURE THE MOLE GAME
Dirt1 [] dirt1=new Dirt1[6]; // list for rectangles M
float x;
float y;
int menu = 0; // start of game/TITLE
int Score = 0;
Button startButton;
Button resetButton;
Timer gameTime = new Timer(10);
Boolean GameOver = false; // sets global variable of GameOver to false
Boolean startButtonClicked = false;
Boolean timeAdded = false; // to stop timer from infinitely going up by 2

void setup()
{
  size(600, 260);
  startButton = new Button(250, 200, 100, 50, "Start", 0, 200, 0); //Button constructor
  resetButton = new Button(420, 200, 100, 50, "Reset Game", 0, 0, 200);
  x =random (30, 450); // random cord of ball
  y =random (30, 90);

  dirt1[0]= new Dirt1(5); //array list of rectangles M
  dirt1[1]= new Dirt1(105);
  dirt1[2]= new Dirt1(205);
  dirt1[3]= new Dirt1(305);
  dirt1[4]= new Dirt1(405);
  dirt1[5]= new Dirt1(505);
}
void draw()
{
  background(154, 107, 43);
  switch(menu) // switch cases
  {
  case 0: //TITLE SCREEEN
    {
      GameOver = !true;
      fill(0);
      textSize(30);
      text("Capture the Mole!", width/2, 100);
      startButton.update();
      startButton.render();
      if (startButton.getClicked() && !startButtonClicked) {
        startButtonClicked = true; // makes startbutton work everytime the case goes to 0.
        menu = 1;  //ends menu switches to gameplay
        Score = 0; //resets Score to 0 when resetGame is pressed in Case 2
        gameTime.setTime(10); // reset timer M
        for (int i = 0; i < dirt1.length; i++) {
          dirt1[i].reset(10); // M
        }
      }
      break;
    }
  case 1: //GAMEPLAY SCREEN
    {
      gameTime.countDown();
      if (Score >= 5 && Score % 5 == 0 && !timeAdded) { // if you find and click the mole 5 times before reaching 5 seconds, it adds 3 more seconds to the timer. M
        gameTime.setTime(gameTime.Time + 3);
        timeAdded = true;
        fill(0);
        text("+3", width/2, 150);
      }
      fill(0);
      text("Time left: " + int(gameTime.Time), width/2, 200); // Displays time left and text on screen
      fill(0);
      textSize(20);
      text("Score: " + Score, 100, 200);
      textSize(20);
      text("Click to dig and capture the mole!", 450, 150);

      fill(0); // MOLE you have to find and click
      ellipse(x, y, 10, 10); // uses float x,y to randomize location
      if (mouseX > x-5 && mouseX < x+5)
      {
        if (mouseY > y-5 && mouseY < y+5)
        {
          if (mousePressed)
          {
            Score += 1; //adds one to score
            menu = 1;
            x= random(30, 450);
            y=random(30, 90);
          }
        }
      }
      for (int i = 0; i < dirt1.length; i++) {
  if (dirt1[i] == null) {
    // Assuming Dirt1 objects have a clickedTime field
    if (millis() - dirt1[i].clickedTime >= 2000) {
      dirt1[i] = new Dirt1(i * 100 + 5); // Re-initialize after 2 seconds
    }
  } else {
    dirt1[i].display();
  }
}
      if (gameTime.Time<=0) //time is 0, game ends
      {
        menu = 2; //switches to end game screen
        background(255, 0, 0); // makes background red
        text("Game Over", 100, 200);
      }
    }

    break;
  case 2: //END GAME SCREEN
    {
      background(255, 0, 0); //makes background red
      text("Game Over", width/2, 220);
      text("Total Score: " + Score, width/2, 100); // add this line to display the total score on screen
      resetButton.update();
      resetButton.render();
      if (resetButton.getClicked()) {
        GameOver = true;
        menu = 0; // start screen
        startButtonClicked = false; // reset the start button click status
        Score = 0; // reset the score
        gameTime.resetTime(10); // reset the game timer M
        for (int i = 0; i < dirt1.length; i++) {
          dirt1[i] = new Dirt1(i*100+5); // re-initialize dirt1 array M
        }
      }
    }
    break;
  }
  {
  }
}
void mousePressed() {
  if (menu == 1) { // function only works on case 1.
    for (int i = 0; i < dirt1.length; i++) {
      if (dirt1[i] != null && mouseX > dirt1[i].x && mouseX < dirt1[i].x + dirt1[i].w && mouseY > dirt1[i].y && mouseY < dirt1[i].y + dirt1[i].h) { //sets paraemeters of rectangle so if clicked, it dissapears. M
         dirt1[i].clickedTime = millis();
        dirt1[i] = null; //use null to identify 0 and to make each rectangle dissapear when clicked. M
        break;
      }
    }
  }
}
