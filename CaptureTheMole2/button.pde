class Button
{
  PVector p1 = new PVector(0, 0); //methods
  float h1 = 0;
  float w1 = 0;
  color colour;
  String  txt;
  Boolean Pressed = false;
  Boolean Clicked = false;

  Button(int x, int y, int w, int h, String t, int r, int g, int b) //Constructor
  {
    p1.x = x;
    p1.y = y;
    w1 = w;
    h1 = h;
    colour = color(r,g,b);
    txt = t;
  }
  void update() // mouse click
  {
    if (mousePressed == true && mouseButton == LEFT && Pressed == false) //ONLY works is mouse is left clicked 
    {
      Pressed = true;
      if (mouseX >= p1.x && mouseX <= p1.x+w1 && mouseY >= p1.y && mouseY <= p1.y+h1) // sets parameters to detect when and where the mouse is pressed
      {
        Clicked = true;
      }
    } else
    {
      Clicked = false;
      Pressed = false; //makes click register once 
    }
  }
  void render() //display button on screen
  {
    fill(colour);
    rect(p1.x, p1.y, w1, h1); //displays rectangle you can click 

    fill(0);
    textAlign(CENTER, CENTER); //text inside the button
    textSize(18);
    text(txt, p1.x+(w1/2), p1.y+(h1/2));
  }
 boolean getClicked() //if button is clicked 
  {
    return Clicked;
  }
}
