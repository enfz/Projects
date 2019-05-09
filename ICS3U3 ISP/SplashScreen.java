/* Enfei Zhang
   V. Krasteva
   October 22, 2018
   This is the class that will animate the bottom car.
*/

import java.awt.*;                          //Gives access to java command libraries
import hsa.Console;                         //Gives access to Console class file
import java.lang.*;                         //Gives access to Thread class

public class SplashScreen extends Thread           //Creates a new class called BottomCar
{

    private Console c;
    
    /*This method draws an animation to introduce the game

      Variable Dictionary
      Name              Type            Purpose
      arial             Font            Font for text
      biggerArial       Font            Font for text
      cyan              Color           Color for one of the balls
      lightBlue         Color           Color for one of the balls
    */
    public void animateSplashScreen ()
    {
	Font arial = new Font ("Arial", Font.PLAIN, 30);
	Font biggerArial = new Font ("Arial", Font.PLAIN, 50);
	Color cyan = new Color (0, 255, 255);
	Color lightBlue = new Color (0, 150, 255);
	Color purple = new Color (150, 0, 255);
	Color pink = new Color (255, 0, 255);
	Color brown = new Color (150, 75, 0);
	c.setFont (biggerArial);
	for (int x = 0 ; x < 500 ; x++)
	{
	    //Erase
	    c.setColor (Color.WHITE);
	    c.fillOval (-496 + x, 150, 100, 100);
	    c.fillOval (110, 651 - x, 100, 100);
	    c.fillOval (215, -351 + x, 100, 100);
	    c.fillOval (320, -351 + x, 100, 100);
	    c.fillOval (425, 651 - x, 100, 100);
	    c.fillOval (1031 - x, 150, 100, 100);
	    c.fillOval (-391 + x, 255, 100, 100);
	    c.fillOval (215, 756 - x, 100, 100);
	    c.fillOval (320, 756 - x, 100, 100);
	    c.fillOval (926 - x, 255, 100, 100);
	    c.setColor (Color.GREEN);
	    c.fillOval (-495 + x, 150, 100, 100);   //Draws the first ball on the first line
	    c.setColor (cyan);
	    c.fillOval (110, 650 - x, 100, 100);    //Draws the second ball on the first line
	    c.setColor (lightBlue);
	    c.fillOval (215, -350 + x, 100, 100);   //Draws the third ball on the first line
	    c.setColor (Color.BLUE);
	    c.fillOval (320, -350 + x, 100, 100);   //Draws the fourth ball on the first line
	    c.setColor (purple);
	    c.fillOval (425, 650 - x, 100, 100);    //Draws the first ball on the first line
	    c.setColor (pink);
	    c.fillOval (1030 - x, 150, 100, 100);   //Draws the last ball on the first line
	    c.setColor (brown);
	    c.fillOval (-390 + x, 255, 100, 100);   //Draws the first ball on the first line
	    c.setColor (Color.RED);
	    c.fillOval (215, 755 - x, 100, 100);    //Draws the second ball on the first line
	    c.setColor (Color.ORANGE);
	    c.fillOval (320, 755 - x, 100, 100);    //Draws the third ball on the first line
	    c.setColor (Color.YELLOW);
	    c.fillOval (925 - x, 255, 100, 100);    //Draws the last ball on the first line
	    c.setColor (Color.BLACK);
	    //Draws the first line of text
	    c.drawString ("M", -465 + x, 210);
	    c.drawString ("A", 145, 710 - x);
	    c.drawString ("S", 250, -290 + x);
	    c.drawString ("T", 355, -290 + x);
	    c.drawString ("E", 460, 710 - x);
	    c.drawString ("R", 1065 - x, 210);
	    //Draws the bottom line of text
	    c.drawString ("M", -360 + x, 315);
	    c.drawString ("I", 255, 815 - x);
	    c.drawString ("N", 355, 815 - x);
	    c.drawString ("D", 960 - x, 315);
	    try
	    {
		Thread.sleep (10);  //How quickly the animations move
	    }
	    catch (Exception e)
	    {
	    }
	}
	c.setColor (Color.BLACK);
	c.setFont (arial);
	c.drawString ("Welcome To", 240, 100);
	c.drawString ("Learn to Master the Game of ", 150, 400);
	c.drawString ("Minds", 270, 430);
	try
	{
	    Thread.sleep (2000);
	}
	catch (Exception e)
	{
	}
    }



    public SplashScreen (Console con)
    {
	c = con;
    }


    public void run ()
    {
	animateSplashScreen ();
    }
}
