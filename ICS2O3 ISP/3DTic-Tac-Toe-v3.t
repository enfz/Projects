%Enfei Zhang
%Mr. Rosen
%May 22, 2018
%This program will allow you to play 3D Tic-Tac-Toe against a friend or anyone you wish to play against

import GUI

%Declaration Section
var bottomLayerBoxes : array 1 .. 9 of int := init (0, 0, 0, 0, 0, 0, 0, 0, 0)  %Checks if a square on the bottom layer is clicked, and by who
var middleLayerBoxes : array 1 .. 9 of int := init (0, 0, 0, 0, 0, 0, 0, 0, 0)  %Checks if a square on the middle layer is clicked, and by who
var topLayerBoxes : array 1 .. 9 of int := init (0, 0, 0, 0, 0, 0, 0, 0, 0) %Checls if a square on the top layer is clicked, and by who
var first : int := 0    %Determines whose turn it is
%GUI Buttons
var mainMenuButton, newGameButton, continueGameButton, instructionsButton, exitGameButton, gameMenuButton, topLayerButton, middleLayerButton, bottomLayerButton, swapTurnsButton, topViewButton : int
var key : string (1)    %Checks for the user to input a key
var gameStatus, menuStat : int := 1 %Determines the status of the game and menu
var mouseY, mouseX, button : int    %Mousewhere variables
var errorWindow : int   %Error trap window
var gameWindow : int    %Main window for the game
var bottomStatus, middleStatus, topStatus : int := 0    %Checks the status of the different layers
var stop : boolean := false %Determines when to stop the music

%Sets Screen Up
gameWindow := Window.Open ("position:300;300, graphics:700;500")    %Sets/Opens the main game window

forward procedure mainMenu  %Forwarded because I need to access it from multiple screens after the before the procedure and go back and forth between this window and other windows
forward procedure gameMenu  %Forwarded because I need to access it from multiple screens after the before the procedure and go back and forth between this window and other windows

procedure title %Procedure that clears the screen and puts the title
    cls %Clears the screen
    locate (1, 37)  %Where the text is
    put "3D Tic-Tac-Toe"    %The title
    put ""  %Blank space
end title   %Ends procedure title

procedure pauseProgram  %Procedure that is a placeholder to let the user read
    put ""  %Blank space
    put "Press any key to continue..." ..   %Tells user to press any key to continue
    getch (key) %Gets the key the user presses
end pauseProgram    %Ends procedure pauseProgram

process music   %Procedure that plays music
    loop    %Loops the music
	exit when stop  %Exits loop when the variable stop is true
	Music.PlayFile ("tetris.mp3")   %Plays the tetris music file
    end loop    %End of the loop
end music   %Ends the procedure music

procedure errorTrap (errorMessage : string) %Procedure for error traps
    errorWindow := Window.Open ("position:300;300, graphics:400;400")   %Opens a new window
    Window.Show (errorWindow)   %Shows the error window
    put errorMessage    %Puts the error message, determined by what the error is
    pauseProgram    %Placeholder to let the user read the error meesage
    Window.Close (errorWindow)  %Closes the error window
end errorTrap   %Ends procedure errorTrap

procedure turnDecider   %Procedure that determines the turn
    gameStatus := 2 %Sets the gameStatus to 2, which means the game has started and is in progress
    randint (first, 1, 2)   %Randomly selects who goes first (1 = X, 2 = O)
end turnDecider %Ends procedure turnDecider

procedure goodbye   %Procedure that Closes the game, and displays a goodbye message
    GUI.Hide (newGameButton)    %Hides the "New Game" button
    GUI.Hide (continueGameButton)   %Hide the "Continue Game" button
    GUI.Hide (instructionsButton)   %Hides the "Instructions" button
    GUI.Hide (exitGameButton)   %Hides the "Exit Game" button
    title   %Clears the screen, and puts the title
    locate (15, 25) %Where the text is
    put "Thank you for playing 3D Tic-Tac-Toe!" %Thank you message
    locate (16, 36) %Where the text is
    put "By: Enfei Zhang"   %My name
    delay (2000)    %How long until the window closes
    stop := true    %Stops the music loop
    Music.PlayFileStop      %Stops the music
    Window.Close (gameWindow)   %Closes the window
end goodbye %Ends the procedure goodbye

procedure win   %Procedure that displays who won at the end of a game
    var comicSans : int := Font.New ("comic sans:20")   %The Comic Sans font
    GUI.Hide (swapTurnsButton)  %Hides the "End Turn" button
    title   %Clears the screen and puts the title
    if gameStatus = 3 then  %If the user who is X won
	%Draws the X
	Draw.ThickLine (100, 150, 300, 350, 50, 7)     %Bottom left to top right line
	Draw.ThickLine (300, 150, 100, 350, 50, 7)     %Top left to bottom right line
	Font.Draw ("Wins!", 400, 250, comicSans, 7) %Text displaying "Wins!"
    elsif gameStatus = 4 then   %If the user who is O won
	%Draws the O
	for x : 0 .. 50 %How big the gap of the O is
	    drawoval (200, 250, 100 - x, 100 - x, 12)
	    drawoval (201, 250, 100 - x, 100 - x, 12)
	    drawoval (199, 250, 100 - x, 100 - x, 12)
	    drawoval (200, 251, 100 - x, 100 - x, 12)
	    drawoval (200, 249, 100 - x, 100 - x, 12)
	end for %Ends the for loop
	Font.Draw ("Wins!", 400, 250, comicSans, 7) %Text displaying "Wins!"
    elsif gameStatus = 5 then   %If the game was a tie
	Font.Draw ("No one wins!", 200, 250, comicSans, 7)   %Text displaying "No one wins!"
	%Draws a sad face
	drawfilloval (450, 300, 25, 25, 7)  %Left eye
	drawfilloval (650, 300, 25, 25, 7)  %Right eye
	drawfillarc (550, 200, 75, 50, 360, 180, 7) %Frown
    end if  %Ends the if statement
    GUI.Show (mainMenuButton)   %Shows the "Main Menu" button
    first := 0  %Resets variable determining who goes first
end win %Ends procedure win

procedure turnSwitch    %Procedure that displays when it is the other players turn
    var arial : int := Font.New ("arial:30")    %creates the Arial font
    GUI.Hide (swapTurnsButton)  %Hides the "End Turn" button
    title   %Clears the screen, and puts the title
    if first = 1 then   %If the last turn was made by X
	Draw.Text ("It is now", 100, 240, arial, 7) %Text displaying "It is now"
	%Draws an O
	for x : 0 .. 50 %How big the gap in the O is
	    drawoval (350, 250, 100 - x, 100 - x, 12)
	    drawoval (351, 250, 100 - x, 100 - x, 12)
	    drawoval (349, 250, 100 - x, 100 - x, 12)
	    drawoval (350, 251, 100 - x, 100 - x, 12)
	    drawoval (350, 249, 100 - x, 100 - x, 12)
	end for %Ends the for loop
	Draw.Text ("'s turn!", 460, 240, arial, 7)  %Text displaying "'s turn!"
	first := 2  %Sets it to O's turn
    else    %If the last turn was made by O
	Draw.Text ("It is now", 100, 240, arial, 7) %Text displaying "It is now"
	%Draws an X
	Draw.ThickLine (250, 150, 450, 350, 50, 7)  %Bottom left to top right line of X
	Draw.ThickLine (250, 350, 450, 150, 50, 7)  %Top left to bottom right line of X
	Draw.Text ("'s turn!", 460, 240, arial, 7)  %Text displaying "'s turn!"
	first := 1  %Sets it to X's turn
    end if  %Ends the if statement
    GUI.Show (gameMenuButton)   %Shows the "Game Menu" button
end turnSwitch  %Ends procedure turnSwitch

procedure topView   %Procedure that displays the full board
    GUI.Hide (topViewButton)    %Hides the "Full Board" button
    title   %Clears the screen and puts the title
    %Bottom Layer
    Draw.ThickLine (25, 475, 250, 475, 5, 7)    %Draws highest line of grid
    Draw.ThickLine (25, 400, 250, 400, 5, 7)    %Draws middle top line of grid
    Draw.ThickLine (25, 325, 250, 325, 5, 7)    %Draws middle bottom line of grid
    Draw.ThickLine (25, 250, 250, 250, 5, 7)    %Draws lowest line of grid
    Draw.ThickLine (25, 475, 25, 250, 5, 7) %Draws leftmost line
    Draw.ThickLine (100, 475, 100, 250, 5, 7)   %Draws middle left line of grid
    Draw.ThickLine (175, 475, 175, 250, 5, 7)   %Draws middle right line of grid
    Draw.ThickLine (250, 475, 250, 250, 5, 7)   %Draws rightmost line of grid
    locate (17, 12) %Where the text is
    put "Bottom Layer" ..   %Tells user which layer they are looking at
    %Middle Layer
    Draw.ThickLine (238, 230, 463, 230, 5, 7)   %Draws highest line of grid
    Draw.ThickLine (238, 155, 463, 155, 5, 7)   %Draws middle top line of grid
    Draw.ThickLine (238, 80, 463, 80, 5, 7) %Draws middle bottom line of grid
    Draw.ThickLine (238, 5, 463, 5, 5, 7)   %Draws lowest line of grid
    Draw.ThickLine (238, 230, 238, 5, 5, 7) %Draws leftmost line
    Draw.ThickLine (313, 230, 313, 5, 5, 7) %Draws middle left line of grid
    Draw.ThickLine (388, 230, 388, 5, 5, 7) %Draws middle right line of grid
    Draw.ThickLine (463, 230, 463, 5, 5, 7) %Draws rightmost line of grid
    locate (16, 39) %Where the text is
    put "Middle Layer"  %Tells user which layer they are looking at
    %Top Layer
    Draw.ThickLine (450, 475, 675, 475, 5, 7)   %Draws highest line of grid
    Draw.ThickLine (450, 400, 675, 400, 5, 7)   %Draws middle top line of grid
    Draw.ThickLine (450, 325, 675, 325, 5, 7)   %Draws middle bottom line of grid
    Draw.ThickLine (450, 250, 675, 250, 5, 7)   %Draws lowest line of grid
    Draw.ThickLine (450, 475, 450, 250, 5, 7)   %Draws leftmost line of grid
    Draw.ThickLine (525, 475, 525, 250, 5, 7)   %Draws middle left line of grid
    Draw.ThickLine (600, 475, 600, 250, 5, 7)   %Draws middle right line of grid
    Draw.ThickLine (675, 475, 675, 250, 5, 7)   %Draws rightmost line of grid
    locate (17, 67) %Where the text is
    put "Top Layer" ..  %Tells user which layer they are looking at
    if topLayerBoxes (1) = 1 then   %If player X selected the top left square of the top layer
	%Draws an X
	Draw.ThickLine (460, 410, 515, 465, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (460, 465, 515, 410, 5, 7)   %Top left to top right line
    end if  %Ends the if statement
    if topLayerBoxes (2) = 1 then   %If player X selected the top middle square of the top layer
	%Draws an X
	Draw.ThickLine (535, 410, 590, 465, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (535, 465, 590, 410, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if topLayerBoxes (3) = 1 then   %If the player X selected the top right square of the top layer
	%Draws an X
	Draw.ThickLine (610, 410, 665, 465, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (610, 465, 665, 410, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if topLayerBoxes (4) = 1 then   %If player X selected the middle left square of the top layer
	%Draws an X
	Draw.ThickLine (460, 335, 515, 390, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (460, 390, 515, 335, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if topLayerBoxes (5) = 1 then   %If player X selected the middle square of the top layer
	%Draws an X
	Draw.ThickLine (535, 335, 590, 390, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (535, 390, 590, 335, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if topLayerBoxes (6) = 1 then   %If player X selected the middle right square of the top layer
	%Draws an X
	Draw.ThickLine (610, 335, 665, 390, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (610, 390, 665, 335, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if topLayerBoxes (7) = 1 then   %If player X selected the bottom left square of the top layer
	%Draws an X
	Draw.ThickLine (460, 260, 515, 315, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (460, 315, 515, 260, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if topLayerBoxes (8) = 1 then   %If player X selected the middle bottom square of the top layer
	%Drwas an X
	Draw.ThickLine (535, 260, 590, 315, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (535, 315, 590, 260, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if topLayerBoxes (9) = 1 then   %If player X selected the bottom right square of the top layer
	%Draws an X
	Draw.ThickLine (610, 260, 665, 315, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (610, 316, 665, 260, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if topLayerBoxes (1) = 2 then   %If player O selected the top left square of the top layer
	%Draws an O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (487, 438, 30 - x, 30 - x, 12)
	    drawoval (486, 438, 30 - x, 30 - x, 12)
	    drawoval (487, 437, 30 - x, 30 - x, 12)
	    drawoval (488, 438, 30 - x, 30 - x, 12)
	    drawoval (487, 439, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if topLayerBoxes (2) = 2 then   %If player O selected the top middle square of the top layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (562, 438, 30 - x, 30 - x, 12)
	    drawoval (561, 438, 30 - x, 30 - x, 12)
	    drawoval (562, 437, 30 - x, 30 - x, 12)
	    drawoval (563, 438, 30 - x, 30 - x, 12)
	    drawoval (562, 439, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if topLayerBoxes (3) = 2 then   %If player O selected the top right square of the top layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (637, 438, 30 - x, 30 - x, 12)
	    drawoval (636, 438, 30 - x, 30 - x, 12)
	    drawoval (637, 437, 30 - x, 30 - x, 12)
	    drawoval (637, 438, 30 - x, 30 - x, 12)
	    drawoval (636, 439, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if topLayerBoxes (4) = 2 then   %If player O selected the middle left square of the top layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (487, 363, 30 - x, 30 - x, 12)
	    drawoval (486, 363, 30 - x, 30 - x, 12)
	    drawoval (487, 362, 30 - x, 30 - x, 12)
	    drawoval (488, 363, 30 - x, 30 - x, 12)
	    drawoval (487, 364, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if topLayerBoxes (5) = 2 then   %If player O selected the middle square of the top layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (562, 363, 30 - x, 30 - x, 12)
	    drawoval (561, 363, 30 - x, 30 - x, 12)
	    drawoval (562, 362, 30 - x, 30 - x, 12)
	    drawoval (563, 363, 30 - x, 30 - x, 12)
	    drawoval (562, 364, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if topLayerBoxes (6) = 2 then   %If player O selected the middle right square of the top layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (637, 363, 30 - x, 30 - x, 12)
	    drawoval (636, 363, 30 - x, 30 - x, 12)
	    drawoval (637, 362, 30 - x, 30 - x, 12)
	    drawoval (637, 363, 30 - x, 30 - x, 12)
	    drawoval (636, 364, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if topLayerBoxes (7) = 2 then   %If player O selected the bottom left square of the top layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (487, 288, 30 - x, 30 - x, 12)
	    drawoval (486, 288, 30 - x, 30 - x, 12)
	    drawoval (487, 287, 30 - x, 30 - x, 12)
	    drawoval (488, 288, 30 - x, 30 - x, 12)
	    drawoval (487, 289, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if topLayerBoxes (8) = 2 then   %If player O selected the bottom middle square of the top layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (562, 288, 30 - x, 30 - x, 12)
	    drawoval (561, 288, 30 - x, 30 - x, 12)
	    drawoval (562, 287, 30 - x, 30 - x, 12)
	    drawoval (563, 288, 30 - x, 30 - x, 12)
	    drawoval (562, 289, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if topLayerBoxes (9) = 2 then   %If player O selected the bottom right square of the top layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (637, 288, 30 - x, 30 - x, 12)
	    drawoval (636, 288, 30 - x, 30 - x, 12)
	    drawoval (637, 287, 30 - x, 30 - x, 12)
	    drawoval (637, 288, 30 - x, 30 - x, 12)
	    drawoval (636, 289, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if middleLayerBoxes (1) = 1 then   %If player X selected the top left square of the middle layer
	%Draws on X
	Draw.ThickLine (248, 220, 303, 165, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (248, 165, 303, 220, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if middleLayerBoxes (2) = 1 then   %If player X selected the top middle square of the middle layer
	%Draws on X
	Draw.ThickLine (323, 220, 378, 165, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (323, 165, 378, 220, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if middleLayerBoxes (3) = 1 then   %If player X selected the top right square of the middle layer
	%Draws on X
	Draw.ThickLine (398, 220, 453, 165, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (398, 165, 453, 220, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if middleLayerBoxes (4) = 1 then   %If player X selected the middle left square of the middle layer
	%Draws on X
	Draw.ThickLine (248, 145, 303, 90, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (248, 90, 303, 145, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if middleLayerBoxes (5) = 1 then   %If player X selected the middle square of the middle layer
	%Draws on X
	Draw.ThickLine (323, 145, 378, 90, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (323, 90, 378, 145, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if middleLayerBoxes (6) = 1 then   %If player X selected the middle right square of the middle layer
	%Draws on X
	Draw.ThickLine (398, 145, 453, 90, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (398, 90, 453, 145, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if middleLayerBoxes (7) = 1 then   %If player X selected the bottom left square of the middle layer
	%Draws on X
	Draw.ThickLine (248, 70, 303, 15, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (248, 15, 303, 70, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if middleLayerBoxes (8) = 1 then   %If player X selected the bottom middle square of the middle layer
	%Draws on X
	Draw.ThickLine (323, 70, 378, 15, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (323, 15, 378, 70, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if middleLayerBoxes (9) = 1 then   %If player X selected the bottom right square of the middle layer
	%Draws on X
	Draw.ThickLine (398, 70, 453, 15, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (398, 15, 453, 70, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if middleLayerBoxes (1) = 2 then    %If player O selected the top left square of the middle layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (275, 193, 30 - x, 30 - x, 12)
	    drawoval (274, 193, 30 - x, 30 - x, 12)
	    drawoval (276, 193, 30 - x, 30 - x, 12)
	    drawoval (275, 192, 30 - x, 30 - x, 12)
	    drawoval (275, 194, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if middleLayerBoxes (2) = 2 then   %If player O selected the top middle square of the middle layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (350, 193, 30 - x, 30 - x, 12)
	    drawoval (349, 193, 30 - x, 30 - x, 12)
	    drawoval (351, 193, 30 - x, 30 - x, 12)
	    drawoval (350, 192, 30 - x, 30 - x, 12)
	    drawoval (350, 194, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if middleLayerBoxes (3) = 2 then   %If player O selected the top right square of the middle layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (425, 193, 30 - x, 30 - x, 12)
	    drawoval (424, 193, 30 - x, 30 - x, 12)
	    drawoval (426, 193, 30 - x, 30 - x, 12)
	    drawoval (425, 192, 30 - x, 30 - x, 12)
	    drawoval (425, 194, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if middleLayerBoxes (4) = 2 then   %If player O selected the middle left square of the middle layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (275, 118, 30 - x, 30 - x, 12)
	    drawoval (274, 118, 30 - x, 30 - x, 12)
	    drawoval (276, 118, 30 - x, 30 - x, 12)
	    drawoval (275, 117, 30 - x, 30 - x, 12)
	    drawoval (275, 119, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if middleLayerBoxes (5) = 2 then   %If player O selected the middle square of the middle layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (350, 118, 30 - x, 30 - x, 12)
	    drawoval (349, 118, 30 - x, 30 - x, 12)
	    drawoval (351, 118, 30 - x, 30 - x, 12)
	    drawoval (350, 117, 30 - x, 30 - x, 12)
	    drawoval (350, 119, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if middleLayerBoxes (6) = 2 then   %If player O selected the middle right square of the middle layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (425, 118, 30 - x, 30 - x, 12)
	    drawoval (424, 118, 30 - x, 30 - x, 12)
	    drawoval (426, 118, 30 - x, 30 - x, 12)
	    drawoval (425, 117, 30 - x, 30 - x, 12)
	    drawoval (425, 119, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if middleLayerBoxes (7) = 2 then   %If player O selected the bottom left square of the middle layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (275, 43, 30 - x, 30 - x, 12)
	    drawoval (274, 43, 30 - x, 30 - x, 12)
	    drawoval (276, 43, 30 - x, 30 - x, 12)
	    drawoval (275, 42, 30 - x, 30 - x, 12)
	    drawoval (275, 44, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if middleLayerBoxes (8) = 2 then   %If player O selected the bottom middle square of the middle layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (350, 43, 30 - x, 30 - x, 12)
	    drawoval (349, 43, 30 - x, 30 - x, 12)
	    drawoval (351, 43, 30 - x, 30 - x, 12)
	    drawoval (350, 42, 30 - x, 30 - x, 12)
	    drawoval (350, 44, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if middleLayerBoxes (9) = 2 then   %If player O selected the bottom right square of the middle layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (425, 43, 30 - x, 30 - x, 12)
	    drawoval (424, 43, 30 - x, 30 - x, 12)
	    drawoval (426, 43, 30 - x, 30 - x, 12)
	    drawoval (425, 42, 30 - x, 30 - x, 12)
	    drawoval (425, 44, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if bottomLayerBoxes (1) = 1 then   %If player X selected the top left square of the bottom layer
	%Draws on X
	Draw.ThickLine (35, 410, 90, 465, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (35, 465, 90, 410, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if bottomLayerBoxes (2) = 1 then   %If player X selected the top middle square of the bottom layer
	%Draws on X
	Draw.ThickLine (110, 410, 165, 465, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (110, 465, 165, 410, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if bottomLayerBoxes (3) = 1 then   %If player X selected the top right square of the bottom layer
	%Draws on X
	Draw.ThickLine (185, 410, 240, 465, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (185, 465, 240, 410, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if bottomLayerBoxes (4) = 1 then   %If player X selected the middle left square of the bottom layer
	%Draws on X
	Draw.ThickLine (35, 335, 90, 390, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (35, 390, 90, 335, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if bottomLayerBoxes (5) = 1 then   %If player X selected the middle square of the bottom layer
	%Draws on X
	Draw.ThickLine (110, 335, 165, 390, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (110, 390, 165, 335, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if bottomLayerBoxes (6) = 1 then   %If player X selected the middle right square of the bottom layer
	%Draws on X
	Draw.ThickLine (185, 335, 240, 390, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (185, 390, 240, 335, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if bottomLayerBoxes (7) = 1 then   %If player X selected the bottom left square of the bottom layer
	%Draws on X
	Draw.ThickLine (35, 260, 90, 315, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (35, 315, 90, 260, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if bottomLayerBoxes (8) = 1 then   %If player X selected the bottom middle square of the bottom layer
	%Draws on X
	Draw.ThickLine (110, 260, 165, 315, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (110, 315, 165, 260, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if bottomLayerBoxes (9) = 1 then   %If player X selected the bottom right square of the bottom layer
	%Draws on X
	Draw.ThickLine (185, 260, 240, 315, 5, 7)   %Bottom left to top right line
	Draw.ThickLine (185, 316, 240, 260, 5, 7)   %Top left to bottom right line
    end if  %Ends the if statement
    if bottomLayerBoxes (1) = 2 then   %If player O selected the top left square of the bottom layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (62, 438, 30 - x, 30 - x, 12)
	    drawoval (61, 438, 30 - x, 30 - x, 12)
	    drawoval (63, 437, 30 - x, 30 - x, 12)
	    drawoval (62, 438, 30 - x, 30 - x, 12)
	    drawoval (62, 439, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if bottomLayerBoxes (2) = 2 then   %If player O selected the top middle square of the bottom layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (137, 438, 30 - x, 30 - x, 12)
	    drawoval (136, 438, 30 - x, 30 - x, 12)
	    drawoval (138, 437, 30 - x, 30 - x, 12)
	    drawoval (137, 438, 30 - x, 30 - x, 12)
	    drawoval (137, 439, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if bottomLayerBoxes (3) = 2 then   %If player O selected the top right square of the bottom layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (212, 438, 30 - x, 30 - x, 12)
	    drawoval (211, 438, 30 - x, 30 - x, 12)
	    drawoval (213, 437, 30 - x, 30 - x, 12)
	    drawoval (212, 438, 30 - x, 30 - x, 12)
	    drawoval (212, 439, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if bottomLayerBoxes (4) = 2 then   %If player O selected the middle left square of the bottom layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (62, 363, 30 - x, 30 - x, 12)
	    drawoval (61, 363, 30 - x, 30 - x, 12)
	    drawoval (63, 362, 30 - x, 30 - x, 12)
	    drawoval (62, 363, 30 - x, 30 - x, 12)
	    drawoval (62, 364, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if bottomLayerBoxes (5) = 2 then   %If player O selected the middle square of the bottom layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (137, 363, 30 - x, 30 - x, 12)
	    drawoval (136, 363, 30 - x, 30 - x, 12)
	    drawoval (138, 362, 30 - x, 30 - x, 12)
	    drawoval (137, 363, 30 - x, 30 - x, 12)
	    drawoval (137, 364, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if bottomLayerBoxes (6) = 2 then   %If player O selected the middle right square of the bottom layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (212, 363, 30 - x, 30 - x, 12)
	    drawoval (211, 363, 30 - x, 30 - x, 12)
	    drawoval (213, 362, 30 - x, 30 - x, 12)
	    drawoval (212, 363, 30 - x, 30 - x, 12)
	    drawoval (212, 364, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if bottomLayerBoxes (7) = 2 then   %If player O selected the bottom left square of the bottom layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (62, 288, 30 - x, 30 - x, 12)
	    drawoval (61, 288, 30 - x, 30 - x, 12)
	    drawoval (63, 287, 30 - x, 30 - x, 12)
	    drawoval (62, 288, 30 - x, 30 - x, 12)
	    drawoval (62, 289, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if bottomLayerBoxes (8) = 2 then   %If player O selected the bottom middle square of the bottom layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (137, 288, 30 - x, 30 - x, 12)
	    drawoval (136, 288, 30 - x, 30 - x, 12)
	    drawoval (138, 287, 30 - x, 30 - x, 12)
	    drawoval (137, 288, 30 - x, 30 - x, 12)
	    drawoval (137, 289, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if bottomLayerBoxes (9) = 2 then   %If player O selected the bottom right square of the bottom layer
	%Draws on O
	for x : 0 .. 15 %How big the gap in the O is
	    drawoval (212, 288, 30 - x, 30 - x, 12)
	    drawoval (211, 288, 30 - x, 30 - x, 12)
	    drawoval (213, 287, 30 - x, 30 - x, 12)
	    drawoval (212, 288, 30 - x, 30 - x, 12)
	    drawoval (212, 289, 30 - x, 30 - x, 12)
	end for %Ends the for loop
    end if  %Ends the if statement
    if topLayerBoxes (1) = 1 and topLayerBoxes (2) = 1 and topLayerBoxes (3) = 1 then   %Winning combination for X of top left, top middle and top right squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (4) = 1 and topLayerBoxes (5) = 1 and topLayerBoxes (6) = 1 then    %Winning combination for X of middle left, middle and top middle squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (7) = 1 and topLayerBoxes (8) = 1 and topLayerBoxes (9) = 1 then    %Winning combination for X of bottom left, bottom middle and bottom right squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (1) = 1 and topLayerBoxes (4) = 1 and topLayerBoxes (7) = 1 then    %Winning combination for X of top left, middle left and bottom left squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (2) = 1 and topLayerBoxes (5) = 1 and topLayerBoxes (8) = 1 then    %Winning combination for X of top middle, middle and bottom middle squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (3) = 1 and topLayerBoxes (6) = 1 and topLayerBoxes (9) = 1 then    %Winning combination for X of top right, middle right and bottom right squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (1) = 1 and topLayerBoxes (5) = 1 and topLayerBoxes (9) = 1 then    %Winning combination for X of top left, middle and bottom right squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (3) = 1 and topLayerBoxes (5) = 1 and topLayerBoxes (7) = 1 then    %Winning combination for X of top right, middle and bottom left squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif middleLayerBoxes (1) = 1 and middleLayerBoxes (2) = 1 and middleLayerBoxes (3) = 1 then   %Winning combination for X of top left, top middle and top right squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif middleLayerBoxes (4) = 1 and middleLayerBoxes (5) = 1 and middleLayerBoxes (6) = 1 then   %Winning combination for X of middle left, middle and middle right squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif middleLayerBoxes (7) = 1 and middleLayerBoxes (8) = 1 and middleLayerBoxes (9) = 1 then   %Winning combination for X of bottom left, bottom middle and bottom right squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif middleLayerBoxes (1) = 1 and middleLayerBoxes (4) = 1 and middleLayerBoxes (7) = 1 then   %Winning combination for X of top left, middle left and bottom left squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif middleLayerBoxes (2) = 1 and middleLayerBoxes (5) = 1 and middleLayerBoxes (8) = 1 then   %Winning combination for X of top middle, middle and bottom middle squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif middleLayerBoxes (3) = 1 and middleLayerBoxes (6) = 1 and middleLayerBoxes (9) = 1 then   %Winning combination for X of top right, middle right and bottom right squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif middleLayerBoxes (1) = 1 and middleLayerBoxes (5) = 1 and middleLayerBoxes (9) = 1 then   %Winning combination for X of top left, middle and bottom right squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif middleLayerBoxes (3) = 1 and middleLayerBoxes (5) = 1 and middleLayerBoxes (7) = 1 then   %Winning combination for X of top right, middle and bottom left squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif bottomLayerBoxes (1) = 1 and bottomLayerBoxes (2) = 1 and bottomLayerBoxes (3) = 1 then   %Winning combination for X of top left, top middle and top right squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif bottomLayerBoxes (4) = 1 and bottomLayerBoxes (5) = 1 and bottomLayerBoxes (6) = 1 then   %Winning combination for X of middle left, middle and middle right squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif bottomLayerBoxes (7) = 1 and bottomLayerBoxes (8) = 1 and bottomLayerBoxes (9) = 1 then   %Winning combination for X of bottom left, bottom middle and bottom right squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif bottomLayerBoxes (1) = 1 and bottomLayerBoxes (4) = 1 and bottomLayerBoxes (7) = 1 then   %Winning combination for X of top left, middle left and bottom left squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif bottomLayerBoxes (2) = 1 and bottomLayerBoxes (5) = 1 and bottomLayerBoxes (8) = 1 then   %Winning combination for X of top middle, middle and bottom middle squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif bottomLayerBoxes (3) = 1 and bottomLayerBoxes (6) = 1 and bottomLayerBoxes (9) = 1 then   %Winning combination for X of top right, middle right and bottom right squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif bottomLayerBoxes (1) = 1 and bottomLayerBoxes (5) = 1 and bottomLayerBoxes (9) = 1 then   %Winning combination for X of top left, middle and bottom right squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif bottomLayerBoxes (3) = 1 and bottomLayerBoxes (5) = 1 and bottomLayerBoxes (7) = 1 then   %Winning combination for X of top right, middle, and bottom left squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (1) = 1 and middleLayerBoxes (1) = 1 and bottomLayerBoxes (1) = 1 then  %Winning combination for X of top left squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (2) = 1 and middleLayerBoxes (2) = 1 and bottomLayerBoxes (2) = 1 then  %Winning combination for X of top middle squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (3) = 1 and middleLayerBoxes (3) = 1 and bottomLayerBoxes (3) = 1 then  %Winning combination for X of top right squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (4) = 1 and middleLayerBoxes (4) = 1 and bottomLayerBoxes (4) = 1 then  %Winning combination for X of middle left squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (5) = 1 and middleLayerBoxes (5) = 1 and bottomLayerBoxes (5) = 1 then  %Winning combination for X of middle squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (6) = 1 and middleLayerBoxes (6) = 1 and bottomLayerBoxes (6) = 1 then  %Winning combination for X of middle right squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (7) = 1 and middleLayerBoxes (7) = 1 and bottomLayerBoxes (7) = 1 then  %Winning combination for X of bottom left squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (8) = 1 and middleLayerBoxes (8) = 1 and bottomLayerBoxes (8) = 1 then  %Winning combination for X of bottom middle squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (9) = 1 and middleLayerBoxes (9) = 1 and bottomLayerBoxes (9) = 1 then  %Winning combination for X of bottom right squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (1) = 1 and middleLayerBoxes (2) = 1 and bottomLayerBoxes (3) = 1 then
	%Winning combination for X of top left top layer, top middle middle layer, and top right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (4) = 1 and middleLayerBoxes (5) = 1 and bottomLayerBoxes (6) = 1 then
	%Winning combination for X of middle left top layer, middle middle layer, and middle right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (7) = 1 and middleLayerBoxes (8) = 1 and bottomLayerBoxes (9) = 1 then
	%Winning combination for X of bottom left top layer, bottom middle middle layer, and bottom right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (3) = 1 and middleLayerBoxes (2) = 1 and bottomLayerBoxes (1) = 1 then
	%Winning combination for X of top right top layer, top middle middle layer, and top left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (6) = 1 and middleLayerBoxes (5) = 1 and bottomLayerBoxes (4) = 1 then
	%Winning combination for X of middle right top layer, middle middle layer, and middle left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (9) = 1 and middleLayerBoxes (8) = 1 and bottomLayerBoxes (7) = 1 then
	%Winning combination for X of bottom right top layer, bottom middle middle layer, and bottom left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (1) = 1 and middleLayerBoxes (4) = 1 and bottomLayerBoxes (7) = 1 then
	%Winning combination for X of top left top layer, middle left middle layer, and bottom left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (2) = 1 and middleLayerBoxes (5) = 1 and bottomLayerBoxes (8) = 1 then
	%Winning combination for X of top middle top layer, middle middle layer, and bottom middle bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (3) = 1 and middleLayerBoxes (6) = 1 and bottomLayerBoxes (9) = 1 then
	%Winning combination for X of top right top layer, middle right middle layer, and bottom right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (7) = 1 and middleLayerBoxes (4) = 1 and bottomLayerBoxes (1) = 1 then
	%Winning combination for X of bottom left top layer, middle left middle layer, and top left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (8) = 1 and middleLayerBoxes (5) = 1 and bottomLayerBoxes (2) = 1 then
	%Winning combination for X of bottom middle top layer, middle middle layer, and top middle bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (9) = 1 and middleLayerBoxes (6) = 1 and bottomLayerBoxes (3) = 1 then
	%Winning combination for X of bottom right top layer, middle right middle layer, and top right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (1) = 1 and middleLayerBoxes (5) = 1 and bottomLayerBoxes (9) = 1 then
	%Winning combination for X of top left top layer, middle middle layer, and bottom right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (9) = 1 and middleLayerBoxes (5) = 1 and bottomLayerBoxes (1) = 1 then
	%Winning combination for X of bottom right top layer, middle middle layer, and top left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (3) = 1 and middleLayerBoxes (5) = 1 and bottomLayerBoxes (7) = 1 then
	%Winning combination for X of top right top layer, middle middle layer, and bottom left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (7) = 1 and middleLayerBoxes (5) = 1 and bottomLayerBoxes (3) = 1 then
	%Winning combination for X of bottom left top layer, middle middle layer, and top right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 3 %Sets the gameStatus to X winning
    elsif topLayerBoxes (1) = 2 and topLayerBoxes (2) = 2 and topLayerBoxes (3) = 2 then   %Winning combination for O of top left, top middle and top right squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (4) = 2 and topLayerBoxes (5) = 2 and topLayerBoxes (6) = 2 then    %Winning combination for O of middle left, middle and top middle squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (7) = 2 and topLayerBoxes (8) = 2 and topLayerBoxes (9) = 2 then    %Winning combination for O of bottom left, bottom middle and bottom right squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (1) = 2 and topLayerBoxes (4) = 2 and topLayerBoxes (7) = 2 then    %Winning combination for O of top left, middle left and bottom left squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (2) = 2 and topLayerBoxes (5) = 2 and topLayerBoxes (8) = 2 then    %Winning combination for O of top middle, middle and bottom middle squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (3) = 2 and topLayerBoxes (6) = 2 and topLayerBoxes (9) = 2 then    %Winning combination for O of top right, middle right and bottom right squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (1) = 2 and topLayerBoxes (5) = 2 and topLayerBoxes (9) = 2 then    %Winning combination for O of top left, middle and bottom right squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (3) = 2 and topLayerBoxes (5) = 2 and topLayerBoxes (7) = 2 then    %Winning combination for O of top right, middle and bottom left squares of top layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif middleLayerBoxes (1) = 2 and middleLayerBoxes (2) = 2 and middleLayerBoxes (3) = 2 then   %Winning combination for O of top left, top middle and top right squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif middleLayerBoxes (4) = 2 and middleLayerBoxes (5) = 2 and middleLayerBoxes (6) = 2 then   %Winning combination for O of middle left, middle and middle right squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif middleLayerBoxes (7) = 2 and middleLayerBoxes (8) = 2 and middleLayerBoxes (9) = 2 then   %Winning combination for O of bottom left, bottom middle and bottom right squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif middleLayerBoxes (1) = 2 and middleLayerBoxes (4) = 2 and middleLayerBoxes (7) = 2 then   %Winning combination for O of top left, middle left and bottom left squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif middleLayerBoxes (2) = 2 and middleLayerBoxes (5) = 2 and middleLayerBoxes (8) = 2 then   %Winning combination for O of top middle, middle and bottom middle squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif middleLayerBoxes (3) = 2 and middleLayerBoxes (6) = 2 and middleLayerBoxes (9) = 2 then   %Winning combination for O of top right, middle right and bottom right squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif middleLayerBoxes (1) = 2 and middleLayerBoxes (5) = 2 and middleLayerBoxes (9) = 2 then   %Winning combination for O of top left, middle and bottom right squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif middleLayerBoxes (3) = 2 and middleLayerBoxes (5) = 2 and middleLayerBoxes (7) = 2 then   %Winning combination for O of top right, middle and bottom left squares of middle layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif bottomLayerBoxes (1) = 2 and bottomLayerBoxes (2) = 2 and bottomLayerBoxes (3) = 2 then   %Winning combination for O of top left, top middle and top right squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif bottomLayerBoxes (4) = 2 and bottomLayerBoxes (5) = 2 and bottomLayerBoxes (6) = 2 then   %Winning combination for O of middle left, middle and middle right squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif bottomLayerBoxes (7) = 2 and bottomLayerBoxes (8) = 2 and bottomLayerBoxes (9) = 2 then   %Winning combination for O of bottom left, bottom middle and bottom right squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif bottomLayerBoxes (1) = 2 and bottomLayerBoxes (4) = 2 and bottomLayerBoxes (7) = 2 then   %Winning combination for O of top left, middle left and bottom left squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif bottomLayerBoxes (2) = 2 and bottomLayerBoxes (5) = 2 and bottomLayerBoxes (8) = 2 then   %Winning combination for O of top middle, middle and bottom middle squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif bottomLayerBoxes (3) = 2 and bottomLayerBoxes (6) = 2 and bottomLayerBoxes (9) = 2 then   %Winning combination for O of top right, middle right and bottom right squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif bottomLayerBoxes (1) = 2 and bottomLayerBoxes (5) = 2 and bottomLayerBoxes (9) = 2 then   %Winning combination for O of top left, middle and bottom right squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif bottomLayerBoxes (3) = 2 and bottomLayerBoxes (5) = 2 and bottomLayerBoxes (7) = 2 then   %Winning combination for O of top right, middle, and bottom left squares of bottom layer
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (1) = 2 and middleLayerBoxes (1) = 2 and bottomLayerBoxes (1) = 2 then  %Winning combination for O of top left squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (2) = 2 and middleLayerBoxes (2) = 2 and bottomLayerBoxes (2) = 2 then  %Winning combination for O of top middle squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (3) = 2 and middleLayerBoxes (3) = 2 and bottomLayerBoxes (3) = 2 then  %Winning combination for O of top right squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (4) = 2 and middleLayerBoxes (4) = 2 and bottomLayerBoxes (4) = 2 then  %Winning combination for O of middle left squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (5) = 2 and middleLayerBoxes (5) = 2 and bottomLayerBoxes (5) = 2 then  %Winning combination for O of middle squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (6) = 2 and middleLayerBoxes (6) = 2 and bottomLayerBoxes (6) = 2 then  %Winning combination for O of middle right squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (7) = 2 and middleLayerBoxes (7) = 2 and bottomLayerBoxes (7) = 2 then  %Winning combination for O of bottom left squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (8) = 2 and middleLayerBoxes (8) = 2 and bottomLayerBoxes (8) = 2 then  %Winning combination for O of bottom middle squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (9) = 2 and middleLayerBoxes (9) = 2 and bottomLayerBoxes (9) = 2 then  %Winning combination for O of bottom right squares of all 3 layers
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (1) = 2 and middleLayerBoxes (2) = 2 and bottomLayerBoxes (3) = 2 then
	%Winning combination for O of top left top layer, top middle middle layer, and top right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (4) = 2 and middleLayerBoxes (5) = 2 and bottomLayerBoxes (6) = 2 then
	%Winning combination for O of middle left top layer, middle middle layer, and middle right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (7) = 2 and middleLayerBoxes (8) = 2 and bottomLayerBoxes (9) = 2 then
	%Winning combination for O of bottom left top layer, bottom middle middle layer, and bottom right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (3) = 2 and middleLayerBoxes (2) = 2 and bottomLayerBoxes (1) = 2 then
	%Winning combination for O of top right top layer, top middle middle layer, and top left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (6) = 2 and middleLayerBoxes (5) = 2 and bottomLayerBoxes (4) = 2 then
	%Winning combination for O of middle right top layer, middle middle layer, and middle left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (9) = 2 and middleLayerBoxes (8) = 2 and bottomLayerBoxes (7) = 2 then
	%Winning combination for O of bottom right top layer, bottom middle middle layer, and bottom left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (1) = 2 and middleLayerBoxes (4) = 2 and bottomLayerBoxes (7) = 2 then
	%Winning combination for O of top left top layer, middle left middle layer, and bottom left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (2) = 2 and middleLayerBoxes (5) = 2 and bottomLayerBoxes (8) = 2 then
	%Winning combination for O of top middle top layer, middle middle layer, and bottom middle bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (3) = 2 and middleLayerBoxes (6) = 2 and bottomLayerBoxes (9) = 2 then
	%Winning combination for O of top right top layer, middle right middle layer, and bottom right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (7) = 2 and middleLayerBoxes (4) = 2 and bottomLayerBoxes (1) = 2 then
	%Winning combination for O of bottom left top layer, middle left middle layer, and top left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (8) = 2 and middleLayerBoxes (5) = 2 and bottomLayerBoxes (2) = 2 then
	%Winning combination for O of bottom middle top layer, middle middle layer, and top middle bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (9) = 2 and middleLayerBoxes (6) = 2 and bottomLayerBoxes (3) = 2 then
	%Winning combination for O of bottom right top layer, middle right middle layer, and top right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (1) = 2 and middleLayerBoxes (5) = 2 and bottomLayerBoxes (9) = 2 then
	%Winning combination for O of top left top layer, middle middle layer, and bottom right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (9) = 2 and middleLayerBoxes (5) = 2 and bottomLayerBoxes (1) = 2 then
	%Winning combination for O of bottom right top layer, middle middle layer, and top left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (3) = 2 and middleLayerBoxes (5) = 2 and bottomLayerBoxes (7) = 2 then
	%Winning combination for O of top right top layer, middle middle layer, and bottom left bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topLayerBoxes (7) = 2 and middleLayerBoxes (5) = 2 and bottomLayerBoxes (3) = 2 then
	%Winning combination for O of bottom left top layer, middle middle layer, and top right bottom layer squares
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 4 %Sets the gameStatus to O winning
    elsif topStatus >= 9 and middleStatus >= 9 and bottomStatus >= 9 then   %If all the layers are full and no winning combinations are detected
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", win)   %Changes the "End Turn" button to go to the win screen
	gameStatus := 5 %Sets the gameStatus to a tie
    else    %If no winning combinations are found and there are still squares left to choose from
	swapTurnsButton := GUI.CreateButton (100, 50, 0, "End Turn", turnSwitch)    %Changes the "End Turn" button to go to the turnSwitch screen
    end if  %Ends the if statement
end topView %Ends the procedure topView

procedure topLayer  %Procedure that allows a player to pick a square from the top layer
    menuStat := 1   %Allows button to be created and counts the attempt
    if topStatus = 9 then   %If the layer is full
	errorTrap ("That layer is full! Please select another one!")    %Opens error window and tells user to pick another layer
	gameMenu    %Goes back to the gameMenu procedure
    else    %If the layer still has squares that can still be chosen
	GUI.Hide (topLayerButton)   %Hides the "Top Layer" button
	GUI.Hide (middleLayerButton)    %Hides the "Middle Layer" button
	GUI.Hide (bottomLayerButton)    %Hides the "Bottom Layer" button
	GUI.Hide (mainMenuButton)   %Hides the "Main Menu" button
	GUI.Hide (gameMenuButton)   %Hides the "Game Menu" button
	title   %Clears the screen and puts the title
	drawfillbox (295, 0, 400, 30, 2)    %Draws the background of the "Game Menu" mousewhere button
	locate (31, 40) %Where the text is for the button
	put "Game Menu" ..  %The text on the button
	locate (4, 37)  %Where the text is
	put "Pick a square!"    %Text telling the user what to do
	%Draws a grid
	Draw.ThickLine (200, 400, 500, 400, 10, 7)  %Highest line of the grid
	Draw.ThickLine (200, 300, 500, 300, 10, 7)  %Top middle line of the grid
	Draw.ThickLine (200, 200, 500, 200, 10, 7)  %Bottom middle line of the grid
	Draw.ThickLine (200, 100, 500, 100, 10, 7)  %Lowest line of the grid
	Draw.ThickLine (200, 400, 200, 100, 10, 7)  %Leftmost line of the grid
	Draw.ThickLine (300, 400, 300, 100, 10, 7)  %Middle left line of the grid
	Draw.ThickLine (400, 400, 400, 100, 10, 7)  %Middle right line of the grid
	Draw.ThickLine (500, 400, 500, 100, 10, 7)  %Rightmost line of the grid
	if topLayerBoxes (1) = 1 then   %If the top left square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (210, 310, 290, 390, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (210, 390, 290, 310, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if topLayerBoxes (2) = 1 then   %If the top middle square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (310, 310, 390, 390, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (310, 390, 390, 310, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if topLayerBoxes (3) = 1 then   %If the top right square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (410, 310, 490, 390, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (410, 390, 490, 310, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if topLayerBoxes (4) = 1 then   %If the middle left square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (210, 210, 290, 290, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (210, 290, 290, 210, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if topLayerBoxes (5) = 1 then   %If the middle square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (310, 210, 390, 290, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (310, 290, 390, 210, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if topLayerBoxes (6) = 1 then   %If the middle right square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (410, 210, 490, 290, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (410, 290, 490, 210, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if topLayerBoxes (7) = 1 then   %If the bottom left square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (210, 110, 290, 190, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (210, 190, 290, 110, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if topLayerBoxes (8) = 1 then   %If the bottom middle square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (310, 110, 390, 190, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (310, 190, 390, 110, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if topLayerBoxes (9) = 1 then   %If the bottom right square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (410, 110, 490, 190, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (410, 190, 490, 110, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if topLayerBoxes (1) = 2 then   %If the top left square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (250, 350, 40 - x, 40 - x, 12)
		drawoval (251, 350, 40 - x, 40 - x, 12)
		drawoval (249, 350, 40 - x, 40 - x, 12)
		drawoval (250, 351, 40 - x, 40 - x, 12)
		drawoval (250, 349, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if topLayerBoxes (2) = 2 then   %If the top middle square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (350, 350, 40 - x, 40 - x, 12)
		drawoval (351, 350, 40 - x, 40 - x, 12)
		drawoval (349, 350, 40 - x, 40 - x, 12)
		drawoval (350, 351, 40 - x, 40 - x, 12)
		drawoval (350, 349, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if topLayerBoxes (3) = 2 then   %If the top right square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (450, 350, 40 - x, 40 - x, 12)
		drawoval (451, 350, 40 - x, 40 - x, 12)
		drawoval (449, 350, 40 - x, 40 - x, 12)
		drawoval (450, 351, 40 - x, 40 - x, 12)
		drawoval (450, 349, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if topLayerBoxes (4) = 2 then   %If the midlde left square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (250, 250, 40 - x, 40 - x, 12)
		drawoval (251, 250, 40 - x, 40 - x, 12)
		drawoval (249, 250, 40 - x, 40 - x, 12)
		drawoval (250, 251, 40 - x, 40 - x, 12)
		drawoval (250, 249, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if topLayerBoxes (5) = 2 then   %If the middle square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (350, 250, 40 - x, 40 - x, 12)
		drawoval (351, 250, 40 - x, 40 - x, 12)
		drawoval (349, 250, 40 - x, 40 - x, 12)
		drawoval (350, 251, 40 - x, 40 - x, 12)
		drawoval (350, 249, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if topLayerBoxes (6) = 2 then   %If the middle right square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (450, 250, 40 - x, 40 - x, 12)
		drawoval (451, 250, 40 - x, 40 - x, 12)
		drawoval (449, 250, 40 - x, 40 - x, 12)
		drawoval (450, 251, 40 - x, 40 - x, 12)
		drawoval (450, 249, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if topLayerBoxes (7) = 2 then   %If the bottom left square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (250, 150, 40 - x, 40 - x, 12)
		drawoval (251, 150, 40 - x, 40 - x, 12)
		drawoval (249, 150, 40 - x, 40 - x, 12)
		drawoval (250, 151, 40 - x, 40 - x, 12)
		drawoval (250, 149, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if topLayerBoxes (8) = 2 then   %If the bottom middle square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (350, 150, 40 - x, 40 - x, 12)
		drawoval (351, 150, 40 - x, 40 - x, 12)
		drawoval (349, 150, 40 - x, 40 - x, 12)
		drawoval (350, 151, 40 - x, 40 - x, 12)
		drawoval (350, 149, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if topLayerBoxes (9) = 2 then   %If the bottom right square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (450, 150, 40 - x, 40 - x, 12)
		drawoval (451, 150, 40 - x, 40 - x, 12)
		drawoval (449, 150, 40 - x, 40 - x, 12)
		drawoval (450, 151, 40 - x, 40 - x, 12)
		drawoval (450, 149, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	loop    %Loops mousewhere until user selects a viable area
	    mousewhere (mouseX, mouseY, button) %Determines where the mouse is and if the user is clicking on the mouse
	    if button = 1 then  %If the user clicked with the mouse somewhere on the screen
		if first = 2 then   %If it is player O's turn
		    if (mouseX >= 200 and mouseX <= 300) and (mouseY >= 300 and mouseY <= 400) then %If the player O clicks the top left square
			if topLayerBoxes (1) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (250, 350, 40 - x, 40 - x, 12)
				drawoval (251, 350, 40 - x, 40 - x, 12)
				drawoval (249, 350, 40 - x, 40 - x, 12)
				drawoval (250, 351, 40 - x, 40 - x, 12)
				drawoval (250, 349, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    topLayerBoxes (1) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 300 and mouseY <= 400) then  %If the player O clicks the top middle square
			if topLayerBoxes (2) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (350, 350, 40 - x, 40 - x, 12)
				drawoval (351, 350, 40 - x, 40 - x, 12)
				drawoval (349, 350, 40 - x, 40 - x, 12)
				drawoval (350, 351, 40 - x, 40 - x, 12)
				drawoval (350, 349, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    topLayerBoxes (2) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 300 and mouseY <= 400) then  %If the player O clicks the top right square
			if topLayerBoxes (3) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (450, 350, 40 - x, 40 - x, 12)
				drawoval (451, 350, 40 - x, 40 - x, 12)
				drawoval (449, 350, 40 - x, 40 - x, 12)
				drawoval (450, 351, 40 - x, 40 - x, 12)
				drawoval (450, 349, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    topLayerBoxes (3) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 200 and mouseX <= 300) and (mouseY >= 200 and mouseY <= 300) then  %If the player O clicks the middle left square
			if topLayerBoxes (4) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (250, 250, 40 - x, 40 - x, 12)
				drawoval (251, 250, 40 - x, 40 - x, 12)
				drawoval (249, 250, 40 - x, 40 - x, 12)
				drawoval (250, 251, 40 - x, 40 - x, 12)
				drawoval (250, 249, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    topLayerBoxes (4) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 200 and mouseY <= 300) then  %If the player O clicks the middle square
			if topLayerBoxes (5) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (350, 250, 40 - x, 40 - x, 12)
				drawoval (351, 250, 40 - x, 40 - x, 12)
				drawoval (349, 250, 40 - x, 40 - x, 12)
				drawoval (350, 251, 40 - x, 40 - x, 12)
				drawoval (350, 249, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    topLayerBoxes (5) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 200 and mouseY <= 300) then  %If the player O clicks the middle right square
			if topLayerBoxes (6) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (450, 250, 40 - x, 40 - x, 12)
				drawoval (451, 250, 40 - x, 40 - x, 12)
				drawoval (449, 250, 40 - x, 40 - x, 12)
				drawoval (450, 251, 40 - x, 40 - x, 12)
				drawoval (450, 249, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    topLayerBoxes (6) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 200 and mouseX <= 300) and (mouseY >= 100 and mouseY <= 200) then  %If the player O clicks the bottom left square
			if topLayerBoxes (7) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (250, 150, 40 - x, 40 - x, 12)
				drawoval (251, 150, 40 - x, 40 - x, 12)
				drawoval (249, 150, 40 - x, 40 - x, 12)
				drawoval (250, 151, 40 - x, 40 - x, 12)
				drawoval (250, 149, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    topLayerBoxes (7) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 100 and mouseY <= 200) then  %If the player O clicks the bottom middle square
			if topLayerBoxes (8) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (350, 150, 40 - x, 40 - x, 12)
				drawoval (351, 150, 40 - x, 40 - x, 12)
				drawoval (349, 150, 40 - x, 40 - x, 12)
				drawoval (350, 151, 40 - x, 40 - x, 12)
				drawoval (350, 149, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    topLayerBoxes (8) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 100 and mouseY <= 200) then  %If the player O clicks the bottom right square
			if topLayerBoxes (9) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (450, 150, 40 - x, 40 - x, 12)
				drawoval (451, 150, 40 - x, 40 - x, 12)
				drawoval (449, 150, 40 - x, 40 - x, 12)
				drawoval (450, 151, 40 - x, 40 - x, 12)
				drawoval (450, 149, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    topLayerBoxes (9) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 295 and mouseX <= 400) and (mouseY >= 0 and mouseY <= 30) then %If the user clicks the "Game Menu" button
			gameMenu    %Goes to gameMenu
			menuStat := 2   %Stops the program from creating a button after changing screens
		    else    %If the user does not click on a viable place
			button := 0 %Allows user to continue clicking
		    end if  %Ends the if statement
		else    %If it is player X's turn
		    if (mouseX >= 200 and mouseX <= 300) and (mouseY >= 300 and mouseY <= 400) then %If the player X clicks the top left square
			if topLayerBoxes (1) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (210, 310, 290, 390, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (210, 390, 290, 310, 5, 7)   %Top left to bottom right line
			    topLayerBoxes (1) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 300 and mouseY <= 400) then  %If the player X clicks the top middle square
			if topLayerBoxes (2) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (310, 310, 390, 390, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (310, 390, 390, 310, 5, 7)   %Top left to bottom right line
			    topLayerBoxes (2) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 300 and mouseY <= 400) then  %If the player X clicks the top right square
			if topLayerBoxes (3) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (410, 310, 490, 390, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (410, 390, 490, 310, 5, 7)   %Top left to bottom right line
			    topLayerBoxes (3) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 200 and mouseX <= 300) and (mouseY >= 200 and mouseY <= 300) then  %If the player X clicks the middle left square
			if topLayerBoxes (4) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (210, 210, 290, 290, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (210, 290, 290, 210, 5, 7)   %Top left to bottom right line
			    topLayerBoxes (4) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 200 and mouseY <= 300) then  %If the player X clicks the middle square
			if topLayerBoxes (5) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (310, 210, 390, 290, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (310, 290, 390, 210, 5, 7)   %Top left to bottom right line
			    topLayerBoxes (5) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 200 and mouseY <= 300) then  %If the player X clicks the middle right square
			if topLayerBoxes (6) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (410, 210, 490, 290, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (410, 290, 490, 210, 5, 7)   %Top left to bottom right line
			    topLayerBoxes (6) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 200 and mouseX <= 300) and (mouseY >= 100 and mouseY <= 200) then  %If the player X clicks the bottom left square
			if topLayerBoxes (7) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (210, 110, 290, 190, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (210, 190, 290, 110, 5, 7)   %Top left to bottom right line
			    topLayerBoxes (7) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 100 and mouseY <= 200) then  %If the player X clicks the bottom middle square
			if topLayerBoxes (8) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (310, 110, 390, 190, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (310, 190, 390, 110, 5, 7)   %Top left to bottom right line
			    topLayerBoxes (8) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 100 and mouseY <= 200) then  %If the player X clicks the bottom right square
			if topLayerBoxes (9) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (410, 110, 490, 190, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (410, 190, 490, 110, 5, 7)   %Top left to bottom right line
			    topLayerBoxes (9) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 295 and mouseX <= 400) and (mouseY >= 0 and mouseY <= 30) then %If the user clicks the "Game Menu" button
			gameMenu    %Goes to gameMenu
			menuStat := 2   %Stops the program from creating a button after changing screens
		    else    %If the user does not click on a viable place
			button := 0 %Allows user to continue clicking
		    end if  %Ends the if statement
		end if  %Ends the if statement
		exit when button = 1    %Exits loop when the user clicks on a viable place
	    end if  %Ends the if statement
	end loop    %Ends the loop
	if menuStat = 1 then    %If the user has chosen a square and not the "Game Menu" button
	    drawfillbox (295, 0, 400, 30, 0)    %Erases the mousewhere button
	    topViewButton := GUI.CreateButton (305, 50, 0, "Full Board", topView)   %Creates button that goes to the topView
	    topStatus := topStatus + 1    %Adds one to the bottomStatus variable, keeping track of how many turns have been played on this layer
	end if  %Ends the if statement
    end if  %Ends the if statement
end topLayer

procedure middleLayer  %Procedure that allows a player to pick a square from the middle layer
    menuStat := 1   %Allows button to be created and counts the attempt
    if middleStatus >= 9 then   %If the layer is full
	errorTrap ("That layer is full! Please select another one!")    %Opens error window and tells user to pick another layer
	gameMenu    %Goes back to the gameMenu procedure
    else    %If the layer still has squares that can still be chosen
	GUI.Hide (topLayerButton)   %Hides the "Top Layer" button
	GUI.Hide (middleLayerButton)    %Hides the "Middle Layer" button
	GUI.Hide (bottomLayerButton)    %Hides the "Bottom Layer" button
	GUI.Hide (mainMenuButton)   %Hides the "Main Menu" button
	GUI.Hide (gameMenuButton)   %Hides the "Game Menu" button
	title   %Clears the screen and puts the title
	drawfillbox (295, 0, 400, 30, 2)    %Draws the background of the "Game Menu" mousewhere button
	locate (31, 40) %Where the text is for the button
	put "Game Menu" ..  %The text on the button
	locate (4, 37)  %Where the text is
	put "Pick a square!"    %Text telling the user what to do
	Draw.ThickLine (200, 400, 500, 400, 10, 7)  %Highest line of the grid
	Draw.ThickLine (200, 300, 500, 300, 10, 7)  %Top middle line of the grid
	Draw.ThickLine (200, 200, 500, 200, 10, 7)  %Bottom middle line of the grid
	Draw.ThickLine (200, 100, 500, 100, 10, 7)  %Lowest line of the grid
	Draw.ThickLine (200, 400, 200, 100, 10, 7)  %Leftmost line of the grid
	Draw.ThickLine (300, 400, 300, 100, 10, 7)  %Middle left line of the grid
	Draw.ThickLine (400, 400, 400, 100, 10, 7)  %Middle right line of the grid
	Draw.ThickLine (500, 400, 500, 100, 10, 7)  %Rightmost line of the grid
	if middleLayerBoxes (1) = 1 then   %If the top left square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (210, 310, 290, 390, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (210, 390, 290, 310, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if middleLayerBoxes (2) = 1 then   %If the top middle square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (310, 310, 390, 390, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (310, 390, 390, 310, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if middleLayerBoxes (3) = 1 then   %If the top right square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (410, 310, 490, 390, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (410, 390, 490, 310, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if middleLayerBoxes (4) = 1 then   %If the middle left square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (210, 210, 290, 290, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (210, 290, 290, 210, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if middleLayerBoxes (5) = 1 then   %If the middle square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (310, 210, 390, 290, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (310, 290, 390, 210, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if middleLayerBoxes (6) = 1 then   %If the middle right square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (410, 210, 490, 290, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (410, 290, 490, 210, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if middleLayerBoxes (7) = 1 then   %If the bottom left square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (210, 110, 290, 190, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (210, 190, 290, 110, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if middleLayerBoxes (8) = 1 then   %If the bottom middle square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (310, 110, 390, 190, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (310, 190, 390, 110, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if middleLayerBoxes (9) = 1 then   %If the bottom right square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (410, 110, 490, 190, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (410, 190, 490, 110, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if middleLayerBoxes (1) = 2 then   %If the top left square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (250, 350, 40 - x, 40 - x, 12)
		drawoval (251, 350, 40 - x, 40 - x, 12)
		drawoval (249, 350, 40 - x, 40 - x, 12)
		drawoval (250, 351, 40 - x, 40 - x, 12)
		drawoval (250, 349, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if middleLayerBoxes (2) = 2 then   %If the top middle square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (350, 350, 40 - x, 40 - x, 12)
		drawoval (351, 350, 40 - x, 40 - x, 12)
		drawoval (349, 350, 40 - x, 40 - x, 12)
		drawoval (350, 351, 40 - x, 40 - x, 12)
		drawoval (350, 349, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if middleLayerBoxes (3) = 2 then   %If the top right square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (450, 350, 40 - x, 40 - x, 12)
		drawoval (451, 350, 40 - x, 40 - x, 12)
		drawoval (449, 350, 40 - x, 40 - x, 12)
		drawoval (450, 351, 40 - x, 40 - x, 12)
		drawoval (450, 349, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if middleLayerBoxes (4) = 2 then   %If the middle left square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (250, 250, 40 - x, 40 - x, 12)
		drawoval (251, 250, 40 - x, 40 - x, 12)
		drawoval (249, 250, 40 - x, 40 - x, 12)
		drawoval (250, 251, 40 - x, 40 - x, 12)
		drawoval (250, 249, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if middleLayerBoxes (5) = 2 then   %If the middle square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (350, 250, 40 - x, 40 - x, 12)
		drawoval (351, 250, 40 - x, 40 - x, 12)
		drawoval (349, 250, 40 - x, 40 - x, 12)
		drawoval (350, 251, 40 - x, 40 - x, 12)
		drawoval (350, 249, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if middleLayerBoxes (6) = 2 then   %If the middle right square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (450, 250, 40 - x, 40 - x, 12)
		drawoval (451, 250, 40 - x, 40 - x, 12)
		drawoval (449, 250, 40 - x, 40 - x, 12)
		drawoval (450, 251, 40 - x, 40 - x, 12)
		drawoval (450, 249, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if middleLayerBoxes (7) = 2 then   %If the bottom left square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (250, 150, 40 - x, 40 - x, 12)
		drawoval (251, 150, 40 - x, 40 - x, 12)
		drawoval (249, 150, 40 - x, 40 - x, 12)
		drawoval (250, 151, 40 - x, 40 - x, 12)
		drawoval (250, 149, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if middleLayerBoxes (8) = 2 then   %If the bottom middle square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (350, 150, 40 - x, 40 - x, 12)
		drawoval (351, 150, 40 - x, 40 - x, 12)
		drawoval (349, 150, 40 - x, 40 - x, 12)
		drawoval (350, 151, 40 - x, 40 - x, 12)
		drawoval (350, 149, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if middleLayerBoxes (9) = 2 then   %If the bottom right square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (450, 150, 40 - x, 40 - x, 12)
		drawoval (451, 150, 40 - x, 40 - x, 12)
		drawoval (449, 150, 40 - x, 40 - x, 12)
		drawoval (450, 151, 40 - x, 40 - x, 12)
		drawoval (450, 149, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	loop    %Loops mousewhere until user selects a viable area
	    mousewhere (mouseX, mouseY, button) %Determines where the mouse is and if the user is clicking on the mouse
	    if button = 1 then  %If the user clicked with the mouse somewhere on the screen
		if first = 2 then   %If it is player O's turn
		    if (mouseX >= 200 and mouseX <= 300) and (mouseY >= 300 and mouseY <= 400) then %If the player O clicks the top left square
			if middleLayerBoxes (1) = 1 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (250, 350, 40 - x, 40 - x, 12)
				drawoval (251, 350, 40 - x, 40 - x, 12)
				drawoval (249, 350, 40 - x, 40 - x, 12)
				drawoval (250, 351, 40 - x, 40 - x, 12)
				drawoval (250, 349, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    middleLayerBoxes (1) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 300 and mouseY <= 400) then %If the player O clicks the top middle square
			if middleLayerBoxes (2) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (350, 350, 40 - x, 40 - x, 12)
				drawoval (351, 350, 40 - x, 40 - x, 12)
				drawoval (349, 350, 40 - x, 40 - x, 12)
				drawoval (350, 351, 40 - x, 40 - x, 12)
				drawoval (350, 349, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    middleLayerBoxes (2) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 300 and mouseY <= 400) then %If the player O clicks the top right square
			if middleLayerBoxes (3) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (450, 350, 40 - x, 40 - x, 12)
				drawoval (451, 350, 40 - x, 40 - x, 12)
				drawoval (449, 350, 40 - x, 40 - x, 12)
				drawoval (450, 351, 40 - x, 40 - x, 12)
				drawoval (450, 349, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    middleLayerBoxes (3) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 200 and mouseX <= 300) and (mouseY >= 200 and mouseY <= 300) then %If the player O clicks the middle left square
			if middleLayerBoxes (4) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (250, 250, 40 - x, 40 - x, 12)
				drawoval (251, 250, 40 - x, 40 - x, 12)
				drawoval (249, 250, 40 - x, 40 - x, 12)
				drawoval (250, 251, 40 - x, 40 - x, 12)
				drawoval (250, 249, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    middleLayerBoxes (4) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 200 and mouseY <= 300) then %If the player O clicks the middle square
			if middleLayerBoxes (5) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (350, 250, 40 - x, 40 - x, 12)
				drawoval (351, 250, 40 - x, 40 - x, 12)
				drawoval (349, 250, 40 - x, 40 - x, 12)
				drawoval (350, 251, 40 - x, 40 - x, 12)
				drawoval (350, 249, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    middleLayerBoxes (5) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 200 and mouseY <= 300) then %If the player O clicks the middle right square
			if middleLayerBoxes (6) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (450, 250, 40 - x, 40 - x, 12)
				drawoval (451, 250, 40 - x, 40 - x, 12)
				drawoval (449, 250, 40 - x, 40 - x, 12)
				drawoval (450, 251, 40 - x, 40 - x, 12)
				drawoval (450, 249, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    middleLayerBoxes (6) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 200 and mouseX <= 300) and (mouseY >= 100 and mouseY <= 200) then %If the player O clicks the bottom left square
			if middleLayerBoxes (7) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (250, 150, 40 - x, 40 - x, 12)
				drawoval (251, 150, 40 - x, 40 - x, 12)
				drawoval (249, 150, 40 - x, 40 - x, 12)
				drawoval (250, 151, 40 - x, 40 - x, 12)
				drawoval (250, 149, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    middleLayerBoxes (7) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 100 and mouseY <= 200) then %If the player O clicks the bottom middle square
			if middleLayerBoxes (8) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (350, 150, 40 - x, 40 - x, 12)
				drawoval (351, 150, 40 - x, 40 - x, 12)
				drawoval (349, 150, 40 - x, 40 - x, 12)
				drawoval (350, 151, 40 - x, 40 - x, 12)
				drawoval (350, 149, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    middleLayerBoxes (8) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 100 and mouseY <= 200) then %If the player O clicks the bottom right square
			if middleLayerBoxes (9) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (450, 150, 40 - x, 40 - x, 12)
				drawoval (451, 150, 40 - x, 40 - x, 12)
				drawoval (449, 150, 40 - x, 40 - x, 12)
				drawoval (450, 151, 40 - x, 40 - x, 12)
				drawoval (450, 149, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    middleLayerBoxes (9) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 295 and mouseX <= 400) and (mouseY >= 0 and mouseY <= 30) then %If the user clicks the "Game Menu" button
			gameMenu    %Goes to gameMenu
			menuStat := 2   %Stops the program from creating a button after changing screens
		    else    %If the user does not click on a viable place
			button := 0 %Allows user to continue clicking
		    end if  %Ends the if statement
		else    %If it is player X's turn
		    if (mouseX >= 200 and mouseX <= 300) and (mouseY >= 300 and mouseY <= 400) then %If the player X clicks the top left square
			if middleLayerBoxes (1) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (210, 310, 290, 390, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (210, 390, 290, 310, 5, 7)   %Top left to bottom right line
			    middleLayerBoxes (1) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 300 and mouseY <= 400) then  %If the player X clicks the top middle square
			if middleLayerBoxes (2) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (310, 310, 390, 390, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (310, 390, 390, 310, 5, 7)   %Top left to bottom right line
			    middleLayerBoxes (2) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 300 and mouseY <= 400) then  %If the player X clicks the top right square
			if middleLayerBoxes (3) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (410, 310, 490, 390, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (410, 390, 490, 310, 5, 7)   %Top left to bottom right line
			    middleLayerBoxes (3) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 200 and mouseX <= 300) and (mouseY >= 200 and mouseY <= 300) then  %If the player X clicks the middle left square
			if middleLayerBoxes (4) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (210, 210, 290, 290, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (210, 290, 290, 210, 5, 7)   %Top left to bottom right line
			    middleLayerBoxes (4) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 200 and mouseY <= 300) then  %If the player X clicks the middle square
			if middleLayerBoxes (5) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (310, 210, 390, 290, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (310, 290, 390, 210, 5, 7)   %Top left to bottom right line
			    middleLayerBoxes (5) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 200 and mouseY <= 300) then  %If the player X clicks the middle right square
			if middleLayerBoxes (6) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (410, 210, 490, 290, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (410, 290, 490, 210, 5, 7)   %Top left to bottom right line
			    middleLayerBoxes (6) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 200 and mouseX <= 300) and (mouseY >= 100 and mouseY <= 200) then  %If the player X clicks the bottom left square
			if middleLayerBoxes (7) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (210, 110, 290, 190, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (210, 190, 290, 110, 5, 7)   %Top left to bottom right line
			    middleLayerBoxes (7) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 100 and mouseY <= 200) then  %If the player X clicks the bottom middle square
			if middleLayerBoxes (8) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (310, 110, 390, 190, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (310, 190, 390, 110, 5, 7)   %Top left to bottom right line
			    middleLayerBoxes (8) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 100 and mouseY <= 200) then  %If the player X clicks the bottom right square
			if middleLayerBoxes (9) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (410, 110, 490, 190, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (410, 190, 490, 110, 5, 7)   %Top left to bottom right line
			    middleLayerBoxes (9) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 295 and mouseX <= 400) and (mouseY >= 0 and mouseY <= 30) then %If the user clicks the "Game Menu" button
			gameMenu    %Goes to gameMenu
			menuStat := 2   %Stops the program from creating a button after changing screens
		    else    %If the user does not click on a viable place
			button := 0 %Allows user to continue clicking
		    end if  %Ends the if statement
		end if  %Ends the if statement
		exit when button = 1    %Exits loop when the user clicks on a viable place
	    end if  %Ends the if statement
	end loop    %Ends the loop
	if menuStat = 1 then    %If the user has chosen a square and not the "Game Menu" button
	    drawfillbox (295, 0, 400, 30, 0)    %Erases the mousewhere button
	    topViewButton := GUI.CreateButton (305, 50, 0, "Full Board", topView)   %Creates button that goes to the topView
	    middleStatus := middleStatus + 1    %Adds one to the bottomStatus variable, keeping track of how many turns have been played on this layer
	end if  %Ends the if statement
    end if  %Ends the if statement
end middleLayer %Ends the procedure middleLayer

procedure bottomLayer  %Procedure that allows a player to pick a square from the bottom layer
    menuStat := 1   %Allows button to be created and counts the attempt
    if bottomStatus >= 9 then   %If the layer is full
	errorTrap ("That layer is full! Please select another one!")    %Opens error window and tells user to pick another layer
	gameMenu    %Goes back to the gameMenu procedure
    else    %If the layer still has squares that can still be chosen
	GUI.Hide (topLayerButton)   %Hides the "Top Layer" button
	GUI.Hide (middleLayerButton)    %Hides the "Middle Layer" button
	GUI.Hide (bottomLayerButton)    %Hides the "Bottom Layer" button
	GUI.Hide (mainMenuButton)   %Hides the "Main Menu" button
	GUI.Hide (gameMenuButton)   %Hides the "Game Menu" button
	title   %Clears the screen and puts the title
	drawfillbox (295, 0, 400, 30, 2)    %Draws the background of the "Game Menu" mousewhere button
	locate (31, 40) %Where the text is for the button
	put "Game Menu" ..  %The text on the button
	locate (4, 37)  %Where the text is
	put "Pick a square!"    %Text telling the user what to do
	Draw.ThickLine (200, 400, 500, 400, 10, 7)  %Highest line of the grid
	Draw.ThickLine (200, 300, 500, 300, 10, 7)  %Top middle line of the grid
	Draw.ThickLine (200, 200, 500, 200, 10, 7)  %Bottom middle line of the grid
	Draw.ThickLine (200, 100, 500, 100, 10, 7)  %Lowest line of the grid
	Draw.ThickLine (200, 400, 200, 100, 10, 7)  %Leftmost line of the grid
	Draw.ThickLine (300, 400, 300, 100, 10, 7)  %Middle left line of the grid
	Draw.ThickLine (400, 400, 400, 100, 10, 7)  %Middle right line of the grid
	Draw.ThickLine (500, 400, 500, 100, 10, 7)  %Rightmost line of the grid
	if bottomLayerBoxes (1) = 1 then   %If the top left square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (210, 310, 290, 390, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (210, 390, 290, 310, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if bottomLayerBoxes (2) = 1 then   %If the top middle square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (310, 310, 390, 390, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (310, 390, 390, 310, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if bottomLayerBoxes (3) = 1 then   %If the top right square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (410, 310, 490, 390, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (410, 390, 490, 310, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if bottomLayerBoxes (4) = 1 then   %If the middle left square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (210, 210, 290, 290, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (210, 290, 290, 210, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if bottomLayerBoxes (5) = 1 then   %If the middle square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (310, 210, 390, 290, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (310, 290, 390, 210, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if bottomLayerBoxes (6) = 1 then   %If the middle right square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (410, 210, 490, 290, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (410, 290, 490, 210, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if bottomLayerBoxes (7) = 1 then   %If the bottom left square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (210, 110, 290, 190, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (210, 190, 290, 110, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if bottomLayerBoxes (8) = 1 then   %If the bottom middle square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (310, 110, 390, 190, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (310, 190, 390, 110, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if bottomLayerBoxes (9) = 1 then   %If the bottom right square had been selected by player X
	    %Draws an X
	    Draw.ThickLine (410, 110, 490, 190, 5, 7)   %Bottom left to top right line
	    Draw.ThickLine (410, 190, 490, 110, 5, 7)   %Top left to bottom right line
	end if  %Ends the if statement
	if bottomLayerBoxes (1) = 2 then   %If the top left square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (250, 350, 40 - x, 40 - x, 12)
		drawoval (251, 350, 40 - x, 40 - x, 12)
		drawoval (249, 350, 40 - x, 40 - x, 12)
		drawoval (250, 351, 40 - x, 40 - x, 12)
		drawoval (250, 349, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if bottomLayerBoxes (2) = 2 then   %If the top middle square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (350, 350, 40 - x, 40 - x, 12)
		drawoval (351, 350, 40 - x, 40 - x, 12)
		drawoval (349, 350, 40 - x, 40 - x, 12)
		drawoval (350, 351, 40 - x, 40 - x, 12)
		drawoval (350, 349, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if bottomLayerBoxes (3) = 2 then   %If the top right square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (450, 350, 40 - x, 40 - x, 12)
		drawoval (451, 350, 40 - x, 40 - x, 12)
		drawoval (449, 350, 40 - x, 40 - x, 12)
		drawoval (450, 351, 40 - x, 40 - x, 12)
		drawoval (450, 349, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if bottomLayerBoxes (4) = 2 then   %If the middle left square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (250, 250, 40 - x, 40 - x, 12)
		drawoval (251, 250, 40 - x, 40 - x, 12)
		drawoval (249, 250, 40 - x, 40 - x, 12)
		drawoval (250, 251, 40 - x, 40 - x, 12)
		drawoval (250, 249, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if bottomLayerBoxes (5) = 2 then   %If the middle square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (350, 250, 40 - x, 40 - x, 12)
		drawoval (351, 250, 40 - x, 40 - x, 12)
		drawoval (349, 250, 40 - x, 40 - x, 12)
		drawoval (350, 251, 40 - x, 40 - x, 12)
		drawoval (350, 249, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if bottomLayerBoxes (6) = 2 then   %If the middle right square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (450, 250, 40 - x, 40 - x, 12)
		drawoval (451, 250, 40 - x, 40 - x, 12)
		drawoval (449, 250, 40 - x, 40 - x, 12)
		drawoval (450, 251, 40 - x, 40 - x, 12)
		drawoval (450, 249, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if bottomLayerBoxes (7) = 2 then   %If the bottom left square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (250, 150, 40 - x, 40 - x, 12)
		drawoval (251, 150, 40 - x, 40 - x, 12)
		drawoval (249, 150, 40 - x, 40 - x, 12)
		drawoval (250, 151, 40 - x, 40 - x, 12)
		drawoval (250, 149, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if bottomLayerBoxes (8) = 2 then   %If the bottom middle square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (350, 150, 40 - x, 40 - x, 12)
		drawoval (351, 150, 40 - x, 40 - x, 12)
		drawoval (349, 150, 40 - x, 40 - x, 12)
		drawoval (350, 151, 40 - x, 40 - x, 12)
		drawoval (350, 149, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	if bottomLayerBoxes (9) = 2 then   %If the bottom right square had been selected by player O
	    %Draws on O
	    for x : 0 .. 20 %How big the gap in the O is
		drawoval (450, 150, 40 - x, 40 - x, 12)
		drawoval (451, 150, 40 - x, 40 - x, 12)
		drawoval (449, 150, 40 - x, 40 - x, 12)
		drawoval (450, 151, 40 - x, 40 - x, 12)
		drawoval (450, 149, 40 - x, 40 - x, 12)
	    end for %Ends the for loop
	end if  %Ends the if statement
	loop    %Loops mousewhere until user selects a viable area
	    mousewhere (mouseX, mouseY, button) %Determines where the mouse is and if the user is clicking on the mouse
	    if button = 1 then  %If the user clicked with the mouse somewhere on the screen
		if first = 2 then   %If it is player O's turn
		    if (mouseX >= 200 and mouseX <= 300) and (mouseY >= 300 and mouseY <= 400) then %If the player O clicks the top left square
			if bottomLayerBoxes (1) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (250, 350, 40 - x, 40 - x, 12)
				drawoval (251, 350, 40 - x, 40 - x, 12)
				drawoval (249, 350, 40 - x, 40 - x, 12)
				drawoval (250, 351, 40 - x, 40 - x, 12)
				drawoval (250, 349, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    bottomLayerBoxes (1) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 300 and mouseY <= 400) then  %If the player O clicks the top middle square
			if bottomLayerBoxes (2) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (350, 350, 40 - x, 40 - x, 12)
				drawoval (351, 350, 40 - x, 40 - x, 12)
				drawoval (349, 350, 40 - x, 40 - x, 12)
				drawoval (350, 351, 40 - x, 40 - x, 12)
				drawoval (350, 349, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    bottomLayerBoxes (2) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 300 and mouseY <= 400) then  %If the player O clicks the top right square
			if bottomLayerBoxes (3) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (450, 350, 40 - x, 40 - x, 12)
				drawoval (451, 350, 40 - x, 40 - x, 12)
				drawoval (449, 350, 40 - x, 40 - x, 12)
				drawoval (450, 351, 40 - x, 40 - x, 12)
				drawoval (450, 349, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    bottomLayerBoxes (3) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 200 and mouseX <= 300) and (mouseY >= 200 and mouseY <= 300) then  %If the player O clicks the middle left square
			if bottomLayerBoxes (4) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (250, 250, 40 - x, 40 - x, 12)
				drawoval (251, 250, 40 - x, 40 - x, 12)
				drawoval (249, 250, 40 - x, 40 - x, 12)
				drawoval (250, 251, 40 - x, 40 - x, 12)
				drawoval (250, 249, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    bottomLayerBoxes (4) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 200 and mouseY <= 300) then  %If the player O clicks the middle square
			if bottomLayerBoxes (5) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (350, 250, 40 - x, 40 - x, 12)
				drawoval (351, 250, 40 - x, 40 - x, 12)
				drawoval (349, 250, 40 - x, 40 - x, 12)
				drawoval (350, 251, 40 - x, 40 - x, 12)
				drawoval (350, 249, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    bottomLayerBoxes (5) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 200 and mouseY <= 300) then  %If the player O clicks the middle right square
			if bottomLayerBoxes (6) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (450, 250, 40 - x, 40 - x, 12)
				drawoval (451, 250, 40 - x, 40 - x, 12)
				drawoval (449, 250, 40 - x, 40 - x, 12)
				drawoval (450, 251, 40 - x, 40 - x, 12)
				drawoval (450, 249, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    bottomLayerBoxes (6) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 200 and mouseX <= 300) and (mouseY >= 100 and mouseY <= 200) then  %If the player O clicks the bottom left square
			if bottomLayerBoxes (7) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (250, 150, 40 - x, 40 - x, 12)
				drawoval (251, 150, 40 - x, 40 - x, 12)
				drawoval (249, 150, 40 - x, 40 - x, 12)
				drawoval (250, 151, 40 - x, 40 - x, 12)
				drawoval (250, 149, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    bottomLayerBoxes (7) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 100 and mouseY <= 200) then  %If the player O clicks the bottom middle square
			if bottomLayerBoxes (8) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (350, 150, 40 - x, 40 - x, 12)
				drawoval (351, 150, 40 - x, 40 - x, 12)
				drawoval (349, 150, 40 - x, 40 - x, 12)
				drawoval (350, 151, 40 - x, 40 - x, 12)
				drawoval (350, 149, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    bottomLayerBoxes (8) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 100 and mouseY <= 200) then  %If the player O clicks the bottom right square
			if bottomLayerBoxes (9) = 0 then   %If the square hasn't been selected beforehand
			    %Draws on O
			    for x : 0 .. 20 %How big the gap in the O is
				drawoval (450, 150, 40 - x, 40 - x, 12)
				drawoval (451, 150, 40 - x, 40 - x, 12)
				drawoval (449, 150, 40 - x, 40 - x, 12)
				drawoval (450, 151, 40 - x, 40 - x, 12)
				drawoval (450, 149, 40 - x, 40 - x, 12)
			    end for %Ends the for loop
			    bottomLayerBoxes (9) := 2   %Sets the squares value to 2
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 295 and mouseX <= 400) and (mouseY >= 0 and mouseY <= 30) then      %If the user clicks the "Game Menu" button
			gameMenu    %Goes to gameMenu
			menuStat := 2   %Stops the program from creating a button after changing screens
		    else    %If the user does not click on a viable place
			button := 0 %Allows user to continue clicking
		    end if  %Ends the if statement
		else    %If it is player X's turn
		    if (mouseX >= 200 and mouseX <= 300) and (mouseY >= 300 and mouseY <= 400) then %If the player X clicks the top left square
			if bottomLayerBoxes (1) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (210, 310, 290, 390, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (210, 390, 290, 310, 5, 7)   %Top left to bottom right line
			    bottomLayerBoxes (1) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 300 and mouseY <= 400) then  %If the player X clicks the top middle square
			if bottomLayerBoxes (2) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (310, 310, 390, 390, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (310, 390, 390, 310, 5, 7)   %Top left to bottom right line
			    bottomLayerBoxes (2) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 300 and mouseY <= 400) then  %If the player X clicks the top right square
			if bottomLayerBoxes (3) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (410, 310, 490, 390, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (410, 390, 490, 310, 5, 7)   %Top left to bottom right line
			    bottomLayerBoxes (3) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 200 and mouseX <= 300) and (mouseY >= 200 and mouseY <= 300) then  %If the player X clicks the middle left square
			if bottomLayerBoxes (4) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (210, 210, 290, 290, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (210, 290, 290, 210, 5, 7)   %Top left to bottom right line
			    bottomLayerBoxes (4) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 200 and mouseY <= 300) then  %If the player X clicks the middle square
			if bottomLayerBoxes (5) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (310, 210, 390, 290, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (310, 290, 390, 210, 5, 7)   %Top left to bottom right line
			    bottomLayerBoxes (5) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 200 and mouseY <= 300) then  %If the player X clicks the middle right square
			if bottomLayerBoxes (6) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (410, 210, 490, 290, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (410, 290, 490, 210, 5, 7)   %Top left to bottom right line
			    bottomLayerBoxes (6) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 200 and mouseX <= 300) and (mouseY >= 100 and mouseY <= 200) then  %If the player X clicks the bottom left square
			if bottomLayerBoxes (7) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (210, 110, 290, 190, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (210, 190, 290, 110, 5, 7)   %Top left to bottom right line
			    bottomLayerBoxes (7) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 300 and mouseX <= 400) and (mouseY >= 100 and mouseY <= 200) then  %If the player X clicks the bottom middle square
			if bottomLayerBoxes (8) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (310, 110, 390, 190, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (310, 190, 390, 110, 5, 7)   %Top left to bottom right line
			    bottomLayerBoxes (8) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 400 and mouseX <= 500) and (mouseY >= 100 and mouseY <= 200) then  %If the player X clicks the bottom right square
			if bottomLayerBoxes (9) = 0 then   %If the square hasn't been selected beforehand
			    %Draws an X
			    Draw.ThickLine (410, 110, 490, 190, 5, 7)   %Bottom left to top right line
			    Draw.ThickLine (410, 190, 490, 110, 5, 7)   %Top left to bottom right line
			    bottomLayerBoxes (9) := 1   %Sets the squares value to 1
			else    %If user clicks on this square when it has already been selected before
			    errorTrap ("That square has already been chosen! Please select another one!")   %Opens error window and shows error message telling user to select another square
			    button := 0 %Allows user to continue clicking
			end if  %Ends the if statement
		    elsif (mouseX >= 295 and mouseX <= 400) and (mouseY >= 0 and mouseY <= 30) then %If the user clicks the "Game Menu" button
			gameMenu    %Goes to gameMenu
			menuStat := 2   %Stops the program from creating a button after changing screens
		    else    %If the user does not click on a viable place
			button := 0 %Allows user to continue clicking
		    end if  %Ends the if statement
		end if  %Ends the if statement
		exit when button = 1    %Exits loop when the user clicks on a viable place
	    end if  %Ends the if statement
	end loop    %Ends the loop
	if menuStat = 1 then    %If the user has chosen a square and not the "Game Menu" button
	    drawfillbox (295, 0, 400, 30, 0)    %Erases the mousewhere button
	    topViewButton := GUI.CreateButton (305, 50, 0, "Full Board", topView)   %Creates button that goes to the topView
	    bottomStatus := bottomStatus + 1    %Adds one to the bottomStatus variable, keeping track of how many turns have been played on this layer
	end if  %Ends the if statement
    end if  %Ends the if statement
end bottomLayer %Ends the bottomLayer procedure

body procedure gameMenu %Declares procedure that displays the game menu
    GUI.Hide (newGameButton)    %Hides the "New Game" button
    GUI.Hide (instructionsButton)   %Hides the "Instructions" button
    GUI.Hide (exitGameButton)   %Hides the "Exit Game" button
    GUI.Hide (continueGameButton)   %Hides the "Continue Game" button
    if gameStatus = 1 then  %If the user has not started a game and tries to click the "Continue Game" button
	errorTrap ("You must start a game before continuing a game!")   %Opens error window and shows error message telling the user to start a new game
	mainMenu    %Goes back to mainMenu
    elsif gameStatus = 3 or gameStatus = 4 or gameStatus = 5 then %If a game has finished and the user tries to click the "Continue Game" button
	errorTrap ("The game has ended! Please start a new one!")   %Opens error window and shows error message telling the user to start a new game
	mainMenu    %Goes back to mainMenu
    else    %If user has started a game that is continuable
	topViewButton := GUI.CreateButton (305, 50, 0, "Full Board", topView)   %Creates a new button that goes to the full board
	GUI.Hide (topViewButton)    %Hides the "Full Board" button
	GUI.Hide (gameMenuButton)   %Hides the "Game Menu" button
	title   %Clears the screen and puts the title
	GUI.Show (mainMenuButton)   %Shows the "Main Menu" button
	topLayerButton := GUI.CreateButton (300, 300, 0, "Top Layer", topLayer) %Creates a new button that goes to the top layer
	middleLayerButton := GUI.CreateButton (292, 250, 0, "Middle Layer", middleLayer)    %Creates a new button that goes to the middle layer
	bottomLayerButton := GUI.CreateButton (292, 200, 0, "Bottom Layer", bottomLayer)    %Creates a new button that goes to the bottom layer
    end if  %Ends the if statement
end gameMenu    %Ends the gameMenu procedure

procedure turnDecided     %Declares procedure that displays who goes first
    GUI.Hide (newGameButton)     %Hides the "New Game" button
    GUI.Hide (continueGameButton)     %Hides the "Continue Game" button
    GUI.Hide (instructionsButton)     %Hides the "Instructions" button
    GUI.Hide (exitGameButton)     %Hides the "Exit Game" button
    topStatus := 0  %Resets the top layer checker
    middleStatus := 0   %Resets the middle layer checker
    bottomStatus := 0   %Resets the bottom layer checker
    title     %Clears the screen and puts the title
    turnDecider         %Runs procedure to determine value of first
    for x : 1 .. 9     %The different places of the array
	topLayerBoxes (x) := 0     %Resets the top layer boxes
	middleLayerBoxes (x) := 0     %Resets the middle layer boxes
	bottomLayerBoxes (x) := 0     %Resets the bottom layer boxes
    end for     %Ends the for loop
    if first = 1 then             %If first is 1 then X goes first
	Draw.ThickLine (100, 150, 300, 350, 50, 7)     %Bottom left to top right line
	Draw.ThickLine (300, 150, 100, 350, 50, 7)     %Top left to bottom right line
	locate (15, 50)     %Where the text is
	put "Goes first!"     %Text displaying "Goes first!"
    elsif first = 2 then     %If first is 2 then O goes first
	%Draws an O
	for x : 0 .. 50     %How big the gap in the center is
	    drawoval (200, 250, 100 - x, 100 - x, 12)
	    drawoval (201, 250, 100 - x, 100 - x, 12)
	    drawoval (199, 250, 100 - x, 100 - x, 12)
	    drawoval (200, 251, 100 - x, 100 - x, 12)
	    drawoval (200, 249, 100 - x, 100 - x, 12)
	end for     %Ends the for loop
	locate (15, 50)     %Where the text is
	put "Goes first!"     %Text displaying "Goes first!"
    end if     %Ends the if statement
    gameMenuButton := GUI.CreateButton (300, 50, 0, "Game Menu", gameMenu)     %Creats button that allows you to go to procedure gameMenu
end turnDecided %Ends the turnDecided procedure

procedure instructions  %Instructions on how to play the game
    GUI.Hide (newGameButton)    %Hides the "New Game" button
    GUI.Hide (continueGameButton)   %Hides the "Continue Game" button
    GUI.Hide (instructionsButton)   %Hides the "Instructions" button
    GUI.Hide (exitGameButton)   %Hides the "Exit Game" button
    title   %Clears the screen and shows the title
    locate (5, 20)  %Where the text is"
    put "1. Before playing decide who is X and who is O."   %Text displaying the first set of instructions"
    locate (7, 20)  %Where the text is"
    put "2. Then start the game to decide who goes first."  %Text displaying the second set of instructions"
    locate (9, 4)   %Where the text is"
    put "3. Once in the game, you must deicde which layer you want to pick a square from."  %Text displaying the third set of instructions"
    locate (11, 20) %Where the text is"
    put "4. Once at the layer pick one of the 9 squares."   %Text displaying the fourth set of instructions"
    locate (13, 6)  %Where the text is"
    put "5. First to 3 in a row either vertically, horizontally, or diagonally wins!"   %Text displaying the final set of instructions"
    locate (24, 40) %Where the text is"
    put "Have fun!" %Text displaying
    GUI.Show (mainMenuButton)   %Shows the "Main Menu" button
end instructions    %Ends the instructions procedure

%Shows the buttons to allow the user to play, exit, or learn about the game
body procedure mainMenu         %Declares the mainMenu procedure
    title         %Clears the screen and shows the title
    if gameStatus > 1 then         %If a game has started
	GUI.Hide (topLayerButton)         %Hides the button that goes to the top layer
	GUI.Hide (middleLayerButton)         %Hides the button that goes to the middle layer
	GUI.Hide (bottomLayerButton)         %Hides the button that goes to the bottom layer
    end if         %Ends the if statement
    GUI.Hide (mainMenuButton)         %Hides the main menu button
    newGameButton := GUI.CreateButton (300, 350, 0, "New Game", turnDecided)         %Creates button that allows you to start a new game and goes to procedure turnDecided
    continueGameButton := GUI.CreateButton (287, 300, 0, "Continue Game", gameMenu)         %Creates button that allows you to continue your game if you started one and goes to procedure gameMenu
    instructionsButton := GUI.CreateButton (297, 250, 0, "Instructions", instructions)         %Creates button that allows you to go see the instructions and goes to procedure instructions
    exitGameButton := GUI.CreateButtonFull (300, 200, 0, "Exit Game", GUI.Quit, 0, KEY_ESC, false)         %Creates button that exits the loop of the program and goes to procedure goodbye
end mainMenu         %Ends the mainMenu procedure

%Shows the animation and the introduction text
procedure introduction         %Declares the introduction procedure
    title         %Clears screen and shows the title
    %X and O going up
    for x : 0 .. 300         %How far they move
	%Draws an X
	Draw.ThickLine (15, -161 + x, 165, -11 + x, 25, 0)         %Erase for bottom left to top right line
	Draw.ThickLine (165, -161 + x, 15, -11 + x, 25, 0)         %Erase for bottom right to top left line
	Draw.ThickLine (15, -160 + x, 165, -10 + x, 25, 7)         %Bottom left to top right line
	Draw.ThickLine (165, -160 + x, 15, -10 + x, 25, 7)         %Bottom right to top left line
	View.Update     %Updates screen
	%Draws an O
	drawfilloval (609, -91 + x, 90, 90, 0)         %Erase for outer circle
	drawfilloval (609, -91 + x, 45, 45, 12)         %Erase for inner circle
	drawfilloval (609, -90 + x, 90, 90, 12)         %Outer circle
	drawfilloval (609, -90 + x, 45, 45, 0)         %Inner circle
	delay (20)         %How quickly it moves
	View.Update     %Updates screen
    end for         %Ends the for loop
    %X going to the right and O going to the left
    for x : 0 .. 170         %How far they move
	%Draws an X
	Draw.ThickLine (14 + x, 140, 164 + x, 290, 25, 0)         %Erase for bottom left to top right line
	Draw.ThickLine (164 + x, 140, 14 + x, 290, 25, 0)         %Erase for bottom right to top left line
	Draw.ThickLine (15 + x, 140, 165 + x, 290, 25, 7)         %Bottom left to top right line
	Draw.ThickLine (165 + x, 140, 15 + x, 290, 25, 7)     %Bottom right to top left line
	View.Update     %Updates screen
	%Draws an O
	drawfilloval (610 - x, 210, 90, 90, 0)         %Erase for outer circle
	drawfilloval (610 - x, 210, 45, 45, 12)         %Erase for inner circle
	drawfilloval (609 - x, 210, 90, 90, 12)         %Outer circle
	drawfilloval (609 - x, 210, 45, 45, 0)         %Inner circle
	delay (5)         %How quickly they move
	View.Update     %Updates screen
    end for         %Ends the for loop
    locate (3, 11)         %Where the introduction textis
    put "Play a classic game of Tic-Tac-Toe against a friend with a twist!"         %Shows the introduction text
    mainMenuButton := GUI.CreateButton (300, 50, 0, "Main Menu", mainMenu)         %Creates button that goes to main menu
end introduction         %Ends the introduction procedure

%Main Program
fork music  %Allows music to play in the background
introduction
loop
    exit when GUI.ProcessEvent  %Exits when GUI.Quit is called (When the "Exit Game" button is pressed
end loop
goodbye
%End of Main Program
