/* Enfei Zhang
   V. Krasteva
   October 22, 2018
   This is the class that will animate the top car.
*/

import java.awt.*;                          //Gives access to java command libraries
import hsa.Console;                         //Gives access to Console class
import java.lang.*;                         //Gives access to Thread class

public class BothCars extends Thread        //Creates a new class called BothCars
{

    private Console c;

    public void bothCarsRace ()
    {
	//Local colour variable for the road
	Color roadGrey = new Color (82, 91, 88);
	//Local colour variable for the star
	Color starYellow = new Color (239, 247, 24);
	//Local colour variable for the car paint
	Color topCarPaint = new Color (157, 9, 198);
	//Local colour variable for the car window
	Color carWindow = new Color (29, 226, 223);
	//Local colour variable for the car wheels
	Color wheels = new Color (57, 63, 61);
	//Local colour variable for the wheel's details
	Color wheelsDetails = new Color (255, 255, 255);
	//Local colour variable for the text
	Color text = new Color (0, 0, 0);
	//Local colour variable for the bottom car's paint
	Color bottomCarPaint = new Color (234, 108, 11);
	//Local colour variable for the maple leaf
	Color mapleLeaf = new Color (198, 27, 27);

	//How far the cars moves
	for (int x = 0 ; x < 300 ; x++)
	{
	    //Draws the top car
	    c.setColor (roadGrey);
	    c.fillRect (691 - x, 300, 160, 91); //Top car rase
	    c.setColor (topCarPaint);
	    c.fillRect (730 - x, 341, 120, 40); //Top car body
	    c.fillArc (690 - x, 321, 80, 120, 90, 90);  //Top car body
	    c.fillArc (770 - x, 301, 80, 80, 0, 90);    //Top car body
	    c.fillRect (770 - x, 301, 40, 40);  //Top car body
	    c.setColor (carWindow);
	    c.fillArc (730 - x, 301, 40, 40, 90, 90);   //Top car window
	    c.fillRect (750 - x, 301, 20, 20);  //Top car window
	    c.fillRect (730 - x, 321, 40, 20);  //Top car window
	    c.setColor (starYellow);
	    c.fillStar (800 - x, 321, 30, 30);  //Star on top car
	    c.setColor (wheels);
	    c.fillOval (800 - x, 371, 20, 20);  //Left wheel on top car
	    c.fillOval (720 - x, 371, 20, 20);  //Right wheel on top car
	    c.setColor (wheelsDetails);
	    c.drawLine (810 - x, 372, 810 - x, 390);    //Left wheel spokes on top car
	    c.drawLine (804 - x, 373, 816 - x, 387);    //Left wheel spokes on top car
	    c.drawLine (802 - x, 385, 816 - x, 376);    //Left wheel spokes on top car
	    c.drawLine (730 - x, 372, 730 - x, 390);    //Right wheel spokes on top car
	    c.drawLine (724 - x, 373, 736 - x, 387);    //Right wheel spokes on top car
	    c.drawLine (722 - x, 385, 736 - x, 376);    //Right wheel spokes on top car
	    c.setColor (text);
	    c.drawString ("# 1", 770 - x, 355); //Text on top car
	    //Draws the bottom car
	    c.setColor (roadGrey);
	    c.fillRect (691 - x, 410, 160, 71); ////Bottom car erase
	    c.setColor (bottomCarPaint);
	    c.fillRect (710 - x, 430, 120, 40); //Bottom car body
	    c.fillArc (690 - x, 430, 40, 40, 90, 180);  //Bottom car body
	    c.fillArc (810 - x, 430, 40, 40, 270, 180); //Bottom car body
	    c.setColor (carWindow);
	    c.fillArc (710 - x, 410, 80, 40, 90, 90);   //Bottom car window
	    c.fillArc (750 - x, 410, 80, 40, 0, 90);    //Bottom car window
	    c.fillRect (750 - x, 410, 40, 20);  //Bottom car window
	    c.setColor (wheels);
	    c.fillOval (730 - x, 460, 20, 20);  //Bottom car left wheel
	    c.fillOval (790 - x, 460, 20, 20);  //Bottom car right wheel
	    c.setColor (mapleLeaf);
	    c.fillMapleLeaf (760 - x, 440, 25, 25); //Maple leaf on bottom car



	    try
	    {
		Thread.sleep (45); //How quickly the cars move
	    }
	    catch (Exception e)
	    {
	    }
	}

    }


    public BothCars (Console con)
    {
	c = con;
    }


    public void run ()
    {
	bothCarsRace ();
    }
}


