/* Enfei Zhang
   V. Krasteva
   October 22, 2018
   This is the class that will animate the top car.
*/

import java.awt.*;                          //Gives access to java command libraries
import hsa.Console;                         //Gives access to Console class
import java.lang.*;                         //Gives access to Thread class

public class TopCar extends Thread          //Creates a class called TopCar
{

    private Console c;

    public void animateTopCar ()
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

	//How far the car moves
	for (int x = 0 ; x < 300 ; x++)
	{
	    synchronized (c)    //I learned of this from Feng Xiong
	    {
		//Draws the top car
		c.setColor (roadGrey);
		c.fillRect (389 + x, 300, 160, 91); //Erase
		c.setColor (topCarPaint);
		c.fillRect (430 + x, 341, 120, 40); //Car body
		c.fillArc (390 + x, 321, 80, 120, 90, 90);  //Car body
		c.fillArc (470 + x, 301, 80, 80, 0, 90);    //Car body
		c.fillRect (470 + x, 301, 40, 40);  //Car body
		c.setColor (carWindow);
		c.fillArc (430 + x, 301, 40, 40, 90, 90);   //Car window
		c.fillRect (450 + x, 301, 20, 20);  //Car window
		c.fillRect (430 + x, 321, 40, 20);  //Car window
		c.setColor (starYellow);
		c.fillStar (500 + x, 321, 30, 30);  //Car star
		c.setColor (wheels);
		c.fillOval (500 + x, 371, 20, 20);  //Car left wheel
		c.fillOval (420 + x, 371, 20, 20);  //Car eight wheel
		c.setColor (wheelsDetails);
		c.drawLine (510 + x, 372, 510 + x, 390);    //Car left wheel spokes
		c.drawLine (504 + x, 373, 516 + x, 387);    //Car left wheel spokes
		c.drawLine (502 + x, 385, 516 + x, 376);    //Car left wheel spokes
		c.drawLine (430 + x, 372, 430 + x, 390);    //Car right wheel spokes
		c.drawLine (424 + x, 373, 436 + x, 387);    //Car right wheel spokes
		c.drawLine (422 + x, 385, 436 + x, 376);    //Car right wheel spokes
		c.setColor (text);
		c.drawString ("# 1", 470 + x, 355); //Car text


		try
		{
		    Thread.sleep (20);  //Delay
		}
		catch (Exception e)
		{
		}
	    }
	}

    }


    public TopCar (Console con)
    {
	c = con;
    }


    public void run ()
    {
	animateTopCar ();
    }
}
