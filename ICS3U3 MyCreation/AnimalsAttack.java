/* Enfei Zhang
   V. Krasteva
   October 22, 2018
   This is the class that will animate the wolf attacking the cars.
*/

import java.awt.*;                          //Gives access to java command libraries
import hsa.Console;                         //GIves access to Console class file
import java.lang.*;                         //Gives access to Thread class

public class AnimalsAttack extends Thread    //Creates a new class called Wolf
{

    private Console c;

    public void animateAnimalsAttack ()
    {
	//Local colour variable for the road
	Color roadGrey = new Color (82, 91, 88);
	//Local colour variable for the wolf's fur
	Color wolfFur = new Color (109, 111, 114);
	//Local colour variable for the wolf's other fur
	Color wolfFur1 = new Color (193, 193, 189);
	//Local colour variable for the wolf's eyes
	Color wolfEyes = new Color (226, 223, 0);
	//Local colour variable for other facial features
	Color face = new Color (0, 0, 0);
	//Local colour variable for the inner ear and nose
	Color face1 = new Color (237, 101, 131);
	//Local colour variable for the deer's fur
	Color fur = new Color (119, 107, 61);
	//Local colour variable for the deer's spots
	Color fur1 = new Color (255, 255, 255);
	//Local colour variable for the deer's hooves
	Color eyes = new Color (229, 224, 204);
	//Local colour variable for the toad's skin
	Color skin = new Color (44, 86, 44);
	//Local colour variable for the toad's other skin
	Color skin1 = new Color (59, 94, 47);
	//Local colour variable for the toad's tongue
	Color tongue = new Color (214, 77, 77);
	//Local colour variable for the toad's mouth
	Color mouth = new Color (226, 29, 29);

	//How far the animals moves
	for (int x = 0 ; x < 200 ; x++)
	{
	    synchronized (c)    //I learned of this from Feng Xiong
	    {
		//Draws the wolf
		c.setColor (roadGrey);
		c.fillRect (69 + x, 310, 120, 71);    //Erase for wolf
		c.setColor (wolfFur1);
		c.fillRect (100 + x, 350, 9, 30);  //Wolf leg
		c.fillRect (117 + x, 350, 9, 30);   //Wolf leg
		c.fillRect (134 + x, 350, 9, 30);   //Wolf leg
		c.fillRect (151 + x, 350, 9, 30);   //Wolf leg
		c.fillArc (92 + x, 372, 18, 8, 270, 180);    //Wolf paw
		c.fillArc (115 + x, 372, 18, 8, 270, 180);    //Wolf paw
		c.fillArc (132 + x, 372, 18, 8, 270, 180);    //Wolf paw
		c.fillArc (149 + x, 372, 18, 8, 270, 180);    //Wolf paw
		c.fillArc (70 + x, 340, 60, 20, 90, 90);  //Wolf tail
		c.fillOval (70 + x, 345, 9, 20);  //Wolf tail
		c.setColor (wolfFur);
		c.fillOval (90 + x, 330, 80, 30); //Wolf body
		c.fillRect (160 + x, 330, 10, 10);  //Wolf neck
		c.fillOval (160 + x, 320, 20, 20);  //Wolf head
		c.fillOval (170 + x, 329, 20, 10);  //Wolf snout
		c.fillArc (163 + x, 312, 5, 20, 0, 180);   //Wolf ear
		c.setColor (face);
		c.fillOval (172 + x, 325, 2, 2);    //Wolf eyes
		c.drawLine (180 + x, 335, 189 + x, 335);    //Wolf mouth
		c.fillOval (188 + x, 332, 2, 2);    //Wolf nose
		c.setColor (face1);
		c.fillArc (165 + x, 315, 2, 10, 10, 170);    //Wolf inner ear
		//Draws the deer
		c.setColor (roadGrey);
		c.fillRect (79 + x, 410, 120, 100);   //Erase for deer
		c.setColor (fur);
		c.fillRect (90 + x, 440, 70, 20); //Deer body
		c.fillArc (85 + x, 440, 20, 20, 90, 180); //Deer body
		c.fillArc (80 + x, 447, 20, 5, 90, 180);  //Deer tail
		c.fillArc (145 + x, 420, 30, 40, 270, 95);  //Deer neck
		c.fillRect (160 + x, 430, 10, 10);  //Deer neck
		c.fillOval (160 + x, 420, 40, 20);  //Deer head
		c.fillRect (90 + x, 460, 8, 35);  //Deer leg
		c.fillRect (110 + x, 460, 8, 35);  //Deer leg
		c.fillRect (130 + x, 460, 8, 35);  //Deer leg
		c.fillRect (150 + x, 460, 8, 35);  //Deer leg
		c.fillArc (165 + x, 416, 10, 15, 0, 180);   //Deer ear
		c.setColor (fur1);
		c.fillOval (100 + x, 445, 2, 2);   //Deer spot
		c.fillOval (110 + x, 450, 2, 2);   //Deer spot
		c.fillOval (120 + x, 445, 2, 2);   //Deer spot
		c.fillOval (130 + x, 450, 2, 2);   //Deer spot
		c.fillOval (140 + x, 445, 2, 2);   //Deer spot
		c.fillOval (150 + x, 450, 2, 2);   //Deer spot
		c.setColor (eyes);
		c.fillOval (180 + x, 423, 2, 2);  //Deer eyes
		c.setColor (face);
		c.drawLine (182 + x, 430, 197 + x, 432); //Deer mouth
		c.setColor (face1);
		c.drawOval (197 + x, 428, 2, 2);  //Deer nose
		c.drawOval (169 + x, 420, 2, 2);    //Deer inner ear
		//Draws the toad
		c.setColor (roadGrey);
		c.fillRect (209 + x, 430, 900, 71);    //Erase for toad
		c.setColor (skin);
		c.fillOval (210 + x, 440, 50, 30);     //Toad body
		c.fillOval (240 + x, 435, 40, 30);      //Toad head
		c.fillRect (215 + x, 460, 10, 30);      //Toad left leg
		c.fillRect (240 + x, 460, 10, 25);      //Toad right leg
		c.fillArc (250 + x, 430, 10, 18, 0, 180);       //Toad ear
		c.fillOval (215 + x, 485, 10, 10);      //Toad left foot
		c.fillOval (240 + x, 480, 10, 10);      //Toad right foot
		c.fillOval (211 + x, 490, 6, 2);        //Toad left foot toe
		c.fillOval (216 + x, 490, 2, 6);        //Toad left foot toe
		c.fillOval (219 + x, 490, 2, 6);        //Toad left foot toe
		c.fillOval (222 + x, 490, 2, 6);        //Toad left foot toe
		c.fillOval (237 + x, 485, 6, 2);        //Toad right foot toe
		c.fillOval (240 + x, 485, 2, 6);        //Toad right foot toe
		c.fillOval (243 + x, 485, 2, 6);        //Toad right foot toe
		c.fillOval (246 + x, 485, 2, 6);        //Toad right foot toe
		c.setColor (skin1);
		c.fillOval (210 + x, 440, 10, 10);     //Toad bump
		c.fillOval (230 + x, 435, 10, 10);     //Toad bump
		c.fillOval (220 + x, 440, 10, 10);     //Toad bump
		c.fillOval (235 + x, 450, 10, 10);     //Toad bump
		c.drawLine (220 + x, 480, 220 + x, 490);    //Toad bump
		c.drawLine (245 + x, 480, 245 + x, 485);    //Toad bump
		c.setColor (face);
		c.fillOval (270 + x, 440, 2, 2);            //Toad eye
		c.setColor (mouth);
		c.fillOval (270 + x, 450, 10, 10);            //Toad mouth
		c.setColor (tongue);
		c.fillOval (270 + x, 452, 30, 5);             //Toad tongue


		try
		{
		    Thread.sleep (30); //How quickly the animals move
		}
		catch (Exception e)
		{
		}
	    }

	}
    }



    public AnimalsAttack (Console con)
    {
	c = con;
    }


    public void run ()
    {
	animateAnimalsAttack ();
    }
}
