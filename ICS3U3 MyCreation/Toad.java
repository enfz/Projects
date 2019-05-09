/* Enfei Zhang
   V. Krasteva
   October 22, 2018
   This is the class that will animate the toad.
*/

import java.awt.*;                          //Gives access to java command libraries
import hsa.Console;                         //Gives access to Console class
import java.lang.*;                         //Gives access to Thread class

public class Toad extends Thread          //Creates a class called TopCar
{

    private Console c;

    public void animateToad ()
    {
	//Local colour variable for the road
	Color roadGrey = new Color (82, 91, 88);
	//Local colour variable for the toad's skin
	Color skin = new Color (44, 86, 44);
	//Local colour variable for the other skin
	Color skin1 = new Color (59, 94, 47);
	//Local colour variable for the facial features
	Color face = new Color (0, 0, 0);
	//Local colour variable for the tongue
	Color tongue = new Color (214, 77, 77);
	//Local colour variable for the mouth
	Color mouth = new Color (226, 29, 29);

	//How far the toad moves
	for (int x = 0 ; x < 310 ; x++)
	{
	    c.setColor (roadGrey);
	    c.fillRect (-101 + x, 430, 90, 71);    //Erase
	    c.setColor (skin);
	    c.fillOval (-100 + x, 440, 50, 30);     //Toad body
	    c.fillOval (-70 + x, 435, 40, 30);      //Toad head
	    c.fillRect (-95 + x, 460, 10, 30);      //Toad left leg
	    c.fillRect (-70 + x, 460, 10, 25);      //Toad right leg
	    c.fillArc (-60 + x, 430, 10, 18, 0, 180);       //Toad ear
	    c.fillOval (-95 + x, 485, 10, 10);      //Toad left foot
	    c.fillOval (-70 + x, 480, 10, 10);      //Toad right foot
	    c.fillOval (-99 + x, 490, 6, 2);        //Toad left foot toe
	    c.fillOval (-94 + x, 490, 2, 6);        //Toad left foot toe
	    c.fillOval (-91 + x, 490, 2, 6);        //Toad left foot toe
	    c.fillOval (-88 + x, 490, 2, 6);        //Toad left foot toe
	    c.fillOval (-73 + x, 485, 6, 2);        //Toad right foot toe
	    c.fillOval (-70 + x, 485, 2, 6);        //Toad right foot toe
	    c.fillOval (-67 + x, 485, 2, 6);        //Toad right foot toe
	    c.fillOval (-64 + x, 485, 2, 6);        //Toad right foot toe
	    c.setColor (skin1);
	    c.fillOval (-100 + x, 440, 10, 10);     //Toad bump
	    c.fillOval (-80 + x, 435, 10, 10);     //Toad bump
	    c.fillOval (-90 + x, 440, 10, 10);     //Toad bump
	    c.fillOval (-75 + x, 450, 10, 10);     //Toad bump
	    c.drawLine (-90 + x, 480, -90 + x, 490);    //Toad bump
	    c.drawLine (-65 + x, 480, -65 + x, 485);    //Toad bump
	    c.setColor (face);
	    c.fillOval (-40 + x, 440, 2, 2);            //Toad eye
	    c.setColor (mouth);
	    c.fillOval (-40 + x, 450, 10, 10);            //Toad mouth
	    c.setColor (tongue);
	    c.fillOval (-40 + x, 452, 30, 5);             //Toad tongue
	    
	
	    try
	    {
		Thread.sleep (20);
	    }
	    catch (Exception e)
	    {
	    }
	}

    }


    public Toad (Console con)
    {
	c = con;
    }


    public void run ()
    {
	animateToad ();
    }
}
