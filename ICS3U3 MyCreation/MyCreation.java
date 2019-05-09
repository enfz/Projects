/*  Enfei Zhang
    V. Krasteva
    October 15, 2018
    This is a story about a group of forest animals coming back to their land where
    there is now a road. The forests animals take back the land by forcing the cars off the road.
*/
import java.awt.*;                                          //Gives access to java command libraries
import hsa.Console;                                         //Gives access to Console class file

public class MyCreation                                      // creates a new class called MyCreation
{ // creates an instance variable of Console

    Console c;  //class so the output window can be made

    public void background ()                                // background method
    {
	Background b = new Background (c);
    }


    public void runBothCars ()
    {
	BothCars a = new BothCars (c);
	a.run ();
    }


    public void runEagle ()
    {
	Color eagle3 = new Color (71, 57, 0);
	Eagles f = new Eagles (c);
	f.start ();
	Eagles f1 = new Eagles (c, 10);
	f1.start ();
	Eagles f2 = new Eagles (c, eagle3, 5);
	f2.start ();
	//Makes sure BothCar class runs after this one is complete
	try
	{
	    f.join ();
	}
	catch (InterruptedException e)
	{
	}
    }


    public void runWolf ()
    {
	Wolf s = new Wolf (c);
	s.run ();
    }


    public void runToad ()
    {
	Toad t = new Toad (c);
	t.run ();
    }


    public void runDeer ()
    {
	Deer v = new Deer (c);
	v.run ();
    }


    public void runAnimalsAttack ()
    {
	AnimalsAttack b = new AnimalsAttack (c);
	b.start ();
    }


    public void runTopCar ()
    {
	TopCar z = new TopCar (c);
	z.start ();
    }


    public void runBottomCar ()
    {
	BottomCar n = new BottomCar (c);
	n.start ();

    }


    public MyCreation ()                                     // MyCreation class constructor
    {
	c = new Console ("Take Back the Land");                                 // creates a new Console object window
    }



    public static void main (String[] args)                 // main method of a Java application
    {
	MyCreation d;                                        // creates instance variable of MyCreation
	d = new MyCreation ();                               // constructs a new MyCreation object
	d.background ();
	d.runEagle ();
	d.runBothCars ();
	d.runWolf ();
	d.runToad ();
	d.runDeer ();
	d.runAnimalsAttack ();
	d.runTopCar ();
	d.runBottomCar ();
    }
}
