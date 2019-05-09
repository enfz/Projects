/* Enfei Zhang
   V. Krasteva
   October 22, 2018
   This is the class that will animate the bottom car.
*/

import java.awt.*;                          //Gives access to java command libraries
import hsa.Console;                         //Gives access to Console class file
import java.lang.*;                         //Gives access to Thread class

public class BottomCar extends Thread           //Creates a new class called BottomCar
{

    private Console c;

    public void animateBottomCar ()
    {
	//Local colour variable for the road
	Color roadGrey = new Color (82, 91, 88);
	//Local colour variable for the maple leaf
	Color mapleLeaf = new Color (198, 27, 27);
	//Local colour variable for the car paint
	Color bottomCarPaint = new Color (234, 108, 11);
	//Local colour variable for the car window
	Color carWindow = new Color (29, 226, 223);
	//Local colour variable for the car wheels
	Color wheels = new Color (57, 63, 61);

	//How far the car moves
	for (int x = 0 ; x < 300 ; x++)
	{
	    synchronized (c)    //I learned of this from Feng Xiong
	    {
		//Draws the bottom car
		c.setColor (roadGrey);
		c.fillRect (389 + x, 410, 160, 71); //Erase
		c.setColor (bottomCarPaint);
		c.fillRect (410 + x, 430, 120, 40); //Body of bottom car
		c.fillArc (390 + x, 430, 40, 40, 90, 180);  //Body of bottom car
		c.fillArc (510 + x, 430, 40, 40, 270, 180); //Body of bottom car
		c.setColor (carWindow);
		c.fillArc (410 + x, 410, 80, 40, 90, 90);   //Window of bottom car
		c.fillArc (450 + x, 410, 80, 40, 0, 90);    //Window of bottom car
		c.fillRect (450 + x, 410, 40, 20);  //Window of bottom car
		c.setColor (wheels);
		c.fillOval (430 + x, 460, 20, 20);  //Left wheel of bottom car
		c.fillOval (490 + x, 460, 20, 20);  //Right wheel of bottom car
		c.setColor (mapleLeaf);
		c.fillMapleLeaf (460 + x, 440, 25, 25); //Maple leaf on bottom car


		try
		{
		    Thread.sleep (20); //How quickly the cars move
		}
		catch (Exception e)
		{
		}
	    }
	}
    }



    public BottomCar (Console con)
    {
	c = con;
    }


    public void run ()
    {
	animateBottomCar ();
    }
}
