/*  Enfei Zhang
    V. Krasteva
    October 22, 2018
    This is a program that draws a background of a road.
*/
import java.awt.*;                                          // gives access to java command libraries
import hsa.Console;                                         // gives access to Console class file
import java.lang.*;                                         // gives access to Thread class file

public class Background                                      // creates a new class called Background
{ // creates an instance variable of Console

    private Console c;  //class so the output window can be made

    public void drawBackground ()                                // drawBackground method
    {
	//Local colour variable for the sun
	Color yellow = new Color (239, 247, 24);
	//Local colour variable for the sky
	Color skyBlue = new Color (66, 134, 244);
	//Local colour variable for the road
	Color roadGrey = new Color (82, 91, 88);
	//Local colou variable for anyuthing white
	Color White = new Color (255, 255, 255);
	//Local colour varfiable for anything else grey
	Color otherGrey = new Color (57, 63, 61);
	//Local colout variable for the tree trunk
	Color treeTrunk = new Color (96, 77, 0);
	//Local colour variable for the tree leaves
	Color plantGreen = new Color (27, 198, 44);
	//Local colour variable for the flower petals
	Color flowerPetal = new Color (234, 108, 11);
	//Local colour variable for the text
	Color text = new Color (0, 0, 0);

	//For loop to Draw the sky
	for (int x = 0 ; x < 640 ; x++)
	{
	    c.setColor (skyBlue);   //Sets the colour of the sky to sky blue
	    c.drawLine (x, 0, x, 300);  //Draws the sky
	}

	//For loop to draw the sun
	for (int x = 0 ; x < 80 ; x = x + 1)
	{
	    c.setColor (yellow); //Sets the colour of the sun to yellow
	    c.drawArc (0 - x, 0 - x, x * 2, x * 2, 270, 90);  //Draws the sun
	}

	//For loop to draw the bush
	for (int x = 0 ; x < 20 ; x = x + 1)
	{
	    c.setColor (plantGreen);
	    c.drawArc (200 - x, 280 - x, x * 2, 40 + x * 2, 0, 180);
	    c.drawArc (240 - x, 280 - x, x * 2, 40 + x * 2, 0, 180);
	    c.drawArc (220 - x, 260 - x, x * 2, 80 + x * 2, 0, 180);
	}

	//For loop to draw the road/ground
	for (int x = 0 ; x < 640 ; x++)
	{
	    c.setColor (roadGrey);  //Sets the colour of the road to grey
	    c.drawLine (x, 300, x, 500);    //Draws the road
	}

	//For loop to draw the dash marks on the road
	for (int x = 0 ; x < 40 ; x++)
	{
	    c.setColor (White);
	    c.drawLine (20 + x, 395, 20 + x, 405);
	    c.drawLine (120 + x, 395, 120 + x, 405);
	    c.drawLine (220 + x, 395, 220 + x, 405);
	    c.drawLine (320 + x, 395, 320 + x, 405);
	    c.drawLine (420 + x, 395, 420 + x, 405);
	    c.drawLine (520 + x, 395, 520 + x, 405);
	    c.drawLine (620 + x, 395, 620 + x, 405);
	}

	//For loop to draw the clouds
	for (int x = 0 ; x < 25 ; x++)
	{
	    c.setColor (White);    //Sets the coulour of the clouds to white
	    //Draws the cloud on the left
	    c.drawOval (140 + x, 0 + x, 60 - 2 * x, 40 - 2 * x);
	    c.drawOval (200 + x, 0 + x, 60 - 2 * x, 40 - 2 * x);
	    c.drawOval (140 + x, 40 + x, 60 - 2 * x, 40 - 2 * x);
	    c.drawOval (200 + x, 40 + x, 60 - 2 * x, 40 - 2 * x);
	    c.drawOval (160 + x, 20 + x, 80 - 2 * x, 40 - 2 * x);
	    //Draws the cloud in the middle
	    c.drawOval (340 + x, 20 + x, 60 - 2 * x, 40 - 2 * x);
	    c.drawOval (380 + x, 20 + x, 60 - 2 * x, 40 - 2 * x);
	    c.drawOval (420 + x, 20 + x, 60 - 2 * x, 40 - 2 * x);
	    //Draws the cloud on the right
	    c.drawOval (520 + x, 20 + x, 60 - 2 * x, 80 - 2 * x);
	    c.drawOval (500 + x, 40 + x, 100 - 2 * x, 40 - 2 * x);
	}

	//For loop to draw the light on the light pole
	for (int x = 0 ; x < 9 ; x = x + 1)
	{
	    c.setColor (yellow);
	    c.drawArc (275 - x, 190 - x, x * 2, x * 2, 180, 180);
	}

	//For loop to draw the light pole
	for (int x = 0 ; x < 20 ; x++)
	{
	    c.setColor (otherGrey);
	    c.drawLine (290 + x, 180, 290 + x, 300);    //Pole
	    c.drawOval (260 + x, 180 + x, 50 - 2 * x, 10 - 2 * x);  //Top part
	}

	//For loop to draw the tree trunks
	for (int x = 0 ; x < 40 ; x++)
	{
	    c.setColor (treeTrunk);
	    c.drawLine (440 + x, 240, 440 + x, 300);    //Right tree trunk
	    c.drawLine (60 + x, 260, 60 + x, 300);      //Left tree trunk

	}

	//For loop to draw the leaves of the tree on the right
	for (int x = 0 ; x < 40 ; x++)
	{
	    c.setColor (plantGreen);
	    c.drawOval (420 + x, 180 + x, 80 - 2 * x, 60 - 2 * x);
	    c.drawOval (380 + x, 200 + x, 60 - 2 * x, 60 - 2 * x);
	    c.drawOval (480 + x, 200 + x, 60 - 2 * x, 60 - 2 * x);
	    c.drawOval (420 + x, 220 + x, 40 - 2 * x, 40 - 2 * x);
	    c.drawOval (460 + x, 220 + x, 40 - 2 * x, 40 - 2 * x);
	}

	//For loop to draw the leaves of the tree on the left
	for (int x = 0 ; x < 40 ; x = x + 1)
	{
	    c.drawArc (80 - x, 260 - x, x * 2, x * 2, 0, 180);  //Tree leaves
	}

	//For loop to draw the flower stem
	for (int x = 0 ; x < 5 ; x++)
	{
	    c.setColor (plantGreen);
	    c.drawLine (138 + x, 284, 138 + x, 300);
	}

	//For loop to draw the top of the flower
	for (int x = 0 ; x < 6 ; x++)
	{
	    c.setColor (flowerPetal);
	    c.drawOval (134, 282, 6 - x, 6 - x);    //Flower petal
	    c.drawOval (142, 282, 6 - x, 6 - x);    //Flower petal
	    c.drawOval (134, 274, 6 - x, 6 - x);    //Flower petal
	    c.drawOval (142, 274, 6 - x, 6 - x);    //Flower petal
	    c.setColor (yellow);
	    c.drawOval (138, 278, 6 - x, 6 - x);    //Center of flower
	}

	c.setColor (text);
	c.drawString ("Take Back the Land", 40, 110);   //Title
	c.drawString ("By: Enfei Zhang", 40, 130);      //Name
    }


    public Background (Console con)                                     // Background class constructor
    {
	c = con;
	drawBackground ();
    }
}
