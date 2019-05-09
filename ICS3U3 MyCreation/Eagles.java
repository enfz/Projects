/* Enfei Zhang
   V. Krasteva
   October 22, 2018
   This is the class that will animate the overloaded eagles.
*/

import java.awt.*;                          //Gives access to java command libraries
import hsa.Console;                         //Gives access to Console class
import java.lang.*;                         //Gives access to Thread class

public class Eagles extends Thread          //Creates a new class called Eagles
{

    private Console c;
    private Color eagle;
    private int delay = 15;

    public void eagleBase ()    //Method to draw the basic outline of the eagle
    {
	//Local colour variable for the road
	Color skyBlue = new Color (66, 134, 244);
	//Local colour variable for the wing
	Color wing = new Color (96, 77, 0);
	//Local colour variable for the neck
	Color neck = new Color (255, 255, 255);
	//Local colour variable for the facial features
	Color face = new Color (0, 0, 0);
	//Local colour variable for the beak
	Color beak = new Color (239, 247, 24);
	//Local colour variable for the talons
	Color talons = new Color (230, 250, 20);

	for (int x = 0 ; x < 1000 ; x++)
	{
	    c.setColor (skyBlue);   //Colour of the erase
	    c.fillRect (-281 + x, 100, 72, 41);      //Erase
	    c.setColor (talons);    //Colout of the talons
	    c.drawLine (-258 + x, 126, -260 + x, 135);   //The left talon of the eagle
	    c.drawLine (-260 + x, 135, -268 + x, 140);
	    c.drawLine (-260 + x, 135, -263 + x, 140);
	    c.drawLine (-260 + x, 135, -259 + x, 140);
	    c.drawLine (-250 + x, 126, -250 + x, 135);   //The right talon of the eagle
	    c.drawLine (-250 + x, 135, -255 + x, 140);
	    c.drawLine (-250 + x, 135, -251 + x, 140);
	    c.drawLine (-250 + x, 135, -245 + x, 140);
	    c.setColor (eagle); //Colour of the body of the eagle
	    c.fillOval (-260 + x, 110, 40, 20);      //The body of the eagle
	    c.fillRect (-225 + x, 110, 5, 10);       //The neck of the eagle
	    c.setColor (wing);  //Colour of the wings of the eagle
	    c.fillArc (-280 + x, 110, 80, 20, 90, 90);   //The wing of the eagle
	    c.setColor (neck);  //Colour of the neck and head of the eagle
	    c.fillArc (-230 + x, 105, 20, 20, 75, 80);   //The mane of the eagle
	    c.fillOval (-225 + x, 101, 10, 10);          //The head of the eagle
	    c.setColor (beak);  //Colour of the beak
	    c.fillArc (-220 + x, 105, 10, 5, 270, 180);  //The beak of the eagle
	    c.setColor (face);  //Colour of facial features
	    c.fillOval (-219 + x, 103, 2, 2);            //The eye of the eagle
	    c.drawLine (-215 + x, 107, -210 + x, 107);    //The mouth line of the eagle

	    try
	    {
		Thread.sleep (delay);   //Delay for how quickly the animation moves
	    }
	    catch (Exception e)
	    {
	    }
	}

    }


    //Default variation of the eagle
    public Eagles (Console con)
    {
	c = con;
	eagle = new Color (145, 136, 42);
    }


    //Variation of eagle with different delay
    public Eagles (Console con, int a)
    {
	c = con;
	eagle = new Color (145, 136, 42);
	delay = a;
    }


    //Variation of eagle with different delay and body clour
    public Eagles (Console con, Color q, int a)
    {
	c = con;
	eagle = q;
	delay = a;
    }


    public void run ()
    {
	eagleBase ();
    }
}
