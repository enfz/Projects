/* Enfei Zhang
   V. Krasteva
   October 22, 2018
   This is the class that will animate the deer.
*/

import java.awt.*;                          //Gives access to java command libraries
import hsa.Console;                         //Gives access to Console class
import java.lang.*;                         //Gives access to Thread class

public class Deer extends Thread            //Creates a new class called Deer
{

    private Console c;

    public void animateDeer ()
    {
	//Local colour variable for the road
	Color roadGrey = new Color (82, 91, 88);
	//Local colour variable for the deer's fur
	Color fur = new Color (119, 107, 61);
	//Local colour variable for the deer's spots
	Color fur1 = new Color (255, 255, 255);
	//Local colour variable for the deer's hooves
	Color eyes = new Color (229, 224, 204);
	//Local colour variable for other facial features
	Color face = new Color (0, 0, 0);
	//Local colour variable for the inner ear and nose
	Color face1 = new Color (237, 101, 131);

	//How far the car moves
	for (int x = 0 ; x < 200 ; x++)
	{
	    //Draws the deer
	    c.setColor (roadGrey);
	    c.fillRect (-121 + x, 410, 120, 100);   //Erase
	    c.setColor (fur);
	    c.fillRect (-110 + x, 440, 70, 20); //Deer body
	    c.fillArc (-115 + x, 440, 20, 20, 90, 180); //Deer body
	    c.fillArc (-120 + x, 447, 20, 5, 90, 180);  //Deer tail
	    c.fillArc (-55 + x, 420, 30, 40, 270, 95);  //Deer neck
	    c.fillRect (-40 + x, 430, 10, 10);  //Deer neck
	    c.fillOval (-40 + x, 420, 40, 20);  //Deer head
	    c.fillRect (-110 + x, 460, 8, 35);  //Deer leg
	    c.fillRect (-90 + x, 460, 8, 35);  //Deer leg
	    c.fillRect (-70 + x, 460, 8, 35);  //Deer leg
	    c.fillRect (-50 + x, 460, 8, 35);  //Deer leg
	    c.fillArc (-35 + x, 416, 10, 15, 0, 180);   //Deer ear
	    c.setColor (fur1);
	    c.fillOval (-100 + x, 445, 2, 2);   //Deer spot
	    c.fillOval (-90 + x, 450, 2, 2);   //Deer spot
	    c.fillOval (-80 + x, 445, 2, 2);   //Deer spot
	    c.fillOval (-70 + x, 450, 2, 2);   //Deer spot
	    c.fillOval (-60 + x, 445, 2, 2);   //Deer spot
	    c.fillOval (-50 + x, 450, 2, 2);   //Deer spot
	    c.setColor (eyes);
	    c.fillOval (-20 + x, 423, 2, 2);  //Deer eyes
	    c.setColor (face);
	    c.drawLine (-18 + x, 430, -3 + x, 432); //Deer mouth
	    c.setColor (face1);
	    c.drawOval (-3 + x, 428, 2, 2);  //Deer nose
	    c.drawOval (-31 + x, 420, 2, 2);    //Deer inner ear
	    
	    try
	    {
		Thread.sleep (20); //How quickly the wolf move
	    }
	    catch (Exception e)
	    {
	    }
	}
    }



    public Deer (Console con)
    {
	c = con;
    }


    public void run ()
    {
	animateDeer ();
    }
}
