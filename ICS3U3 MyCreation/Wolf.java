/* Enfei Zhang
   V. Krasteva
   October 22, 2018
   This is the class that will animate the wolf.
*/

import java.awt.*;                          //Gives access to java command libraries
import hsa.Console;                         //GIves access to Console class file
import java.lang.*;                         //Gives access to Thread class

public class Wolf extends Thread    //Creates a new class called Wolf
{

    private Console c;

    public void animateWolf ()
    {
	//Local colour variable for the road
	Color roadGrey = new Color (82, 91, 88);
	//Local colour variable for the wolfs fur
	Color fur = new Color (109, 111, 114);
	//Local colour variable for the other fur
	Color fur1 = new Color (193, 193, 189);
	//Local colour variable for the eyes
	Color eyes = new Color (226, 223, 0);
	//Local colour variable for other facial features
	Color face = new Color (0, 0, 0);
	//Local colour variable for the inner ear
	Color ear = new Color (237, 101, 131);

	//How far the wolf moves
	for (int x = 0 ; x < 200 ; x++)
	{
	    //Draws the wolf
	    c.setColor (roadGrey);
	    c.fillRect (-131 + x, 310, 120, 70);    //Erase
	    c.setColor (fur1);
	    c.fillRect (-100 + x, 350, 9, 30);  //Wolf leg
	    c.fillRect (-83 + x, 350, 9, 30);   //Wolf leg
	    c.fillRect (-66 + x, 350, 9, 30);   //Wolf leg
	    c.fillRect (-49 + x, 350, 9, 30);   //Wolf leg
	    c.fillArc (-102 + x, 372, 18, 8, 270, 180);    //Wolf paw
	    c.fillArc (-85 + x, 372, 18, 8, 270, 180);    //Wolf paw
	    c.fillArc (-68 + x, 372, 18, 8, 270, 180);    //Wolf paw
	    c.fillArc (-51 + x, 372, 18, 8, 270, 180);    //Wolf paw
	    c.fillArc (-130 + x, 340, 60, 20, 90, 90);  //Wolf tail
	    c.fillOval (-130 + x, 345, 9, 20);  //Wolf tail
	    c.setColor (fur);
	    c.fillOval (-110 + x, 330, 80, 30); //Wolf body
	    c.fillRect (-40 + x, 330, 10, 10);  //Wolf neck
	    c.fillOval (-40 + x, 320, 20, 20);  //Wolf head
	    c.fillOval (-30 + x, 329, 20, 10);  //Wolf snout
	    c.fillArc (-37 + x, 312, 5, 20, 0, 180);   //Wolf ear
	    c.setColor (face);
	    c.fillOval (-28 + x, 325, 2, 2);    //Wolf eyes
	    c.drawLine (-20 + x, 335, -11 + x, 335);    //Wolf mouth
	    c.fillOval (-12 + x, 332, 2, 2);    //Wolf nose
	    c.setColor (ear);
	    c.fillArc (-35 + x, 315, 2, 10, 10, 170);    //Wolf inner ear
	    

	    try
	    {
		Thread.sleep (20); //How quickly the wolf move
	    }
	    catch (Exception e)
	    {
	    }
	}
    }



    public Wolf (Console con)
    {
	c = con;
    }


    public void run ()
    {
	animateWolf ();
    }
}
