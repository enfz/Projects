%Enfei Zhang
%Mr. Rosen
%March 28, 2018
%This program will tell the story of The Dinosaur Fight, which includes drama between dinosaurs and a sumo fight.

procedure background1
    %Ground
    for x : 0 .. 50
	drawline (0, x, 640, x, 21)
    end for
    %Sky
    for x : 0 .. 350
	drawline (0, x + 50, 640, x + 50, 75)
    end for
    %CN Tower
    %Bottom Pole
    for x : 0 .. 220
	drawarc (320, 270, x, x, 250, 290, 29)
	drawarc (321, 270, x, x, 250, 290, 29)
	drawarc (320, 271, x, x, 250, 290, 29)
    end for
    %Top Pole
    for x : 0 .. 30
	drawarc (320, 320, x, x, 250, 290, 7)
	drawarc (321, 320, x, x, 250, 290, 7)
	drawarc (320, 321, x, x, 250, 290, 7)
    end for
    %Main Area
    for x : 0 .. 30
	drawoval (320, 270, x + 18, x, 29)
	drawoval (321, 270, x + 18, x, 29)
	drawoval (320, 271, x + 18, x, 29)
    end for
    %Window
    for x : 0 .. 10
	drawline (272, x + 265, 368, x + 265, 54)
    end for
    %Buildings from Left to Right
    for x : 0 .. 230
	drawline (0, x + 50, 128, x + 50, 19)
    end for
    for x : 0 .. 165
	drawline (128, x + 50, 208, x + 50, 19)
    end for
    for x : 0 .. 180
	drawline (208, x + 50, 320, x + 50, 19)
    end for
    for x : 0 .. 140
	drawline (320, x + 50, 416, x + 50, 19)
    end for
    for x : 0 .. 220
	drawline (416, x + 50, 528, x + 50, 19)
    end for
    for x : 0 .. 240
	drawline (528, x + 50, 640, x + 50, 19)
    end for
    %Sun
    for x : 0 .. 40
	drawoval (592, 360, x, x, 14)
	drawoval (593, 360, x, x, 14)
	drawoval (592, 361, x, x, 14)
    end for
    %Clouds from Left to Right
    %Cloud 1
    %Center of Cloud
    for x : 0 .. 32
	drawoval (128, 360, x, x, 0)
	drawoval (129, 360, x, x, 0)
	drawoval (128, 361, x, x, 0)
    end for
    %Left and Right Parts of Cloud
    for x : 0 .. 20
	%Right Side
	drawoval (176, 360, x + 28, x, 0)
	drawoval (177, 360, x + 28, x, 0)
	drawoval (176, 361, x + 28, x, 0)
	%Left Side
	drawoval (80, 360, x + 28, x, 0)
	drawoval (81, 360, x + 28, x, 0)
	drawoval (80, 361, x + 28, x, 0)
    end for
    %Smaller Ovals in Cloud
    for x : 0 .. 16
	%Top Right
	drawoval (160, 376, x, x, 0)
	drawoval (161, 376, x, x, 0)
	drawoval (160, 377, x, x, 0)
	%Bottom Right
	drawoval (160, 344, x, x, 0)
	drawoval (161, 344, x, x, 0)
	drawoval (160, 345, x, x, 0)
	%Top Left
	drawoval (96, 376, x, x, 0)
	drawoval (97, 376, x, x, 0)
	drawoval (96, 377, x, x, 0)
	%Bottom Left
	drawoval (96, 344, x, x, 0)
	drawoval (97, 344, x, x, 0)
	drawoval (96, 345, x, x, 0)
    end for
    %Cloud 2
    %Center of Cloud
    for x : 0 .. 32
	drawoval (352, 360, x, x, 0)
	drawoval (353, 360, x, x, 0)
	drawoval (352, 361, x, x, 0)
    end for
    %Left and Right Parts of Cloud
    for x : 0 .. 20
	%Right Side
	drawoval (400, 360, x + 28, x, 0)
	drawoval (401, 360, x + 28, x, 0)
	drawoval (400, 361, x + 28, x, 0)
	%Left Side
	drawoval (304, 360, x + 28, x, 0)
	drawoval (305, 360, x + 28, x, 0)
	drawoval (304, 361, x + 28, x, 0)
    end for
    %Smaller Ovals in Cloud
    for x : 0 .. 16
	%Top Right
	drawoval (384, 376, x, x, 0)
	drawoval (385, 376, x, x, 0)
	drawoval (384, 377, x, x, 0)
	%Bottom Right
	drawoval (384, 344, x, x, 0)
	drawoval (385, 344, x, x, 0)
	drawoval (384, 345, x, x, 0)
	%Top Left
	drawoval (320, 376, x, x, 0)
	drawoval (321, 376, x, x, 0)
	drawoval (320, 377, x, x, 0)
	%Bottom Left
	drawoval (320, 344, x, x, 0)
	drawoval (321, 344, x, x, 0)
	drawoval (320, 345, x, x, 0)
    end for
    %Cloud 3
    %Center of Cloud
    for x : 0 .. 16
	drawoval (496, 344, x, x, 0)
	drawoval (497, 344, x, x, 0)
	drawoval (496, 345, x, x, 0)
    end for
    %Left and Right Parts of Cloud
    for x : 0 .. 8
	%Right Side
	drawoval (512, 344, x + 8, x, 0)
	drawoval (513, 344, x + 8, x, 0)
	drawoval (512, 345, x + 8, x, 0)
	%Left Side
	drawoval (480, 344, x + 8, x, 0)
	drawoval (481, 344, x + 8, x, 0)
	drawoval (480, 345, x + 8, x, 0)
    end for
    %Smaller Ovals in Cloud
    for x : 0 .. 8
	%Top Right
	drawoval (512, 352, x, x, 0)
	drawoval (513, 352, x, x, 0)
	drawoval (512, 353, x, x, 0)
	%Bottom Right
	drawoval (512, 336, x, x, 0)
	drawoval (513, 336, x, x, 0)
	drawoval (512, 337, x, x, 0)
	%Top Left
	drawoval (480, 352, x, x, 0)
	drawoval (481, 352, x, x, 0)
	drawoval (480, 353, x, x, 0)
	%Bottom Left
	drawoval (480, 336, x, x, 0)
	drawoval (481, 336, x, x, 0)
	drawoval (480, 337, x, x, 0)
    end for
    %Bus Stop
    for x : 0 .. 50
	drawline (312, x + 50, 328, x + 50, 22)
    end for
    for x : 0 .. 10
	drawline (304, x + 100, 336, x + 100, 1)
	drawline (304, x + 140, 336, x + 140, 1)
    end for
    for x : 0 .. 30
	drawline (304, x + 110, 336, x + 110, 12)
    end for
end background1

procedure intro
    %Title
    locate (10, 58)
    put "The Dinosaur Fight" ..
    %Name
    delay (400)
    locate (11, 60)
    put "By: Enfei Zhang" ..
    %How long it's on screen
    delay (3000)
    %Eraser
    for x : 0 .. 35
	drawline (450, x + 220, 600, x + 220, 19)
    end for
end intro

procedure triceratopsEnterScene1
    %How much it moves
    for x : 0 .. 310
	%Eraser
	drawfillbox (650 - x, 50, 741 - x, 110, 19)
	%Tail
	drawfillarc (720 - x, 70, 20, 10, 0, 90, 140)
	%Legs from Left to Right
	drawfillbox (685 - x, 50, 690 - x, 70, 190)
	drawfillbox (695 - x, 50, 700 - x, 70, 190)
	drawfillbox (705 - x, 50, 710 - x, 70, 190)
	drawfillbox (715 - x, 50, 720 - x, 70, 190)
	%Feet from Left to Right
	drawfillarc (687 - x, 50, 2, 5, 0, 180, 0)
	drawfillarc (697 - x, 50, 2, 5, 0, 180, 0)
	drawfillarc (707 - x, 50, 2, 5, 0, 180, 0)
	drawfillarc (717 - x, 50, 2, 5, 0, 180, 0)
	%Body
	drawfilloval (700 - x, 75, 20, 15, 140)
	%Frill
	drawfilloval (670 - x, 80, 20, 20, 190)
	%Head
	drawfilloval (670 - x, 80, 15, 13, 140)
	%Horns from Left to Right
	drawfillarc (680 - x, 105, 5, 15, 250, 290, 0)
	drawfillarc (670 - x, 110, 5, 15, 250, 290, 0)
	drawfillarc (660 - x, 105, 5, 15, 250, 290, 0)
	%Mouth
	drawline (662 - x, 75, 678 - x, 75, 7)
	%Right Eye
	drawfilloval (675 - x, 85, 2, 2, 0)
	%Left Eye
	drawfilloval (665 - x, 85, 2, 2, 0)
	%Right Pupil
	drawfilloval (675 - x, 85, 1, 1, 7)
	%Left Eye
	drawfilloval (665 - x, 85, 1, 1, 7)
	%Left Nostril
	drawfilloval (672 - x, 80, 1, 1, 7)
	%Right Nostril
	drawfilloval (668 - x, 80, 1, 1, 7)
	%How quickly it moves
	delay (20)
    end for
end triceratopsEnterScene1

procedure brachiosaurusEnterScene1
    %How much it moves
    for x : 0 .. 210
	%Eraser
	drawfillbox (640 - x, 50, 730 - x, 141, 19)
	%Legs from Right to Left
	drawfillbox (680 - x, 50, 685 - x, 80, 2)
	drawfillbox (670 - x, 50, 675 - x, 80, 2)
	drawfillbox (660 - x, 50, 665 - x, 80, 2)
	drawfillbox (650 - x, 50, 655 - x, 80, 2)
	%Feet from Right to Left
	drawfillarc (682 - x, 50, 2, 5, 0, 180, 0)
	drawfillarc (672 - x, 50, 2, 5, 0, 180, 0)
	drawfillarc (662 - x, 50, 2, 5, 0, 180, 0)
	drawfillarc (652 - x, 50, 2, 5, 0, 180, 0)
	%Tail
	drawfillarc (680 - x, 85, 50, 5, 0, 90, 190)
	%Body
	drawfilloval (667 - x, 85, 20, 15, 190)
	%Neck
	drawfillbox (650 - x, 90, 660 - x, 130, 190)
	%Bump on the Head
	drawfillarc (655 - x, 136, 5, 5, 270, 180, 139)
	%Stripes on the Bump from Left to Right
	drawline (653 - x, 136, 653 - x, 140, 76)
	drawline (655 - x, 136, 655 - x, 141, 76)
	drawline (657 - x, 136, 657 - x, 140, 76)
	%Head
	drawfilloval (650 - x, 130, 10, 7, 2)
	%Mouth
	drawline (642 - x, 126, 649 - x, 129, 7)
	%Eye
	drawfilloval (655 - x, 132, 2, 2, 0)
	%Pupil
	drawfilloval (655 - x, 132, 1, 1, 7)
	%Nostril
	drawfilloval (642 - x, 132, 1, 1, 7)
	%How quickly it moves
	delay (30)
    end for
end brachiosaurusEnterScene1

procedure diplodocusEnterScene1
    %How much it moves
    for x : 0 .. 120
	%Eraser
	drawfillbox (640 - x, 50, 741 - x, 150, 19)
	%Legs from Left to Right
	drawfillbox (673 - x, 50, 678 - x, 80, 90)
	drawfillbox (683 - x, 50, 688 - x, 80, 90)
	drawfillbox (693 - x, 50, 698 - x, 80, 90)
	drawfillbox (703 - x, 50, 708 - x, 80, 90)
	%Feet from Left to Right
	drawfillarc (675 - x, 50, 3, 3, 0, 180, 141)
	drawfillarc (685 - x, 50, 3, 3, 0, 180, 141)
	drawfillarc (695 - x, 50, 3, 3, 0, 180, 141)
	drawfillarc (705 - x, 50, 3, 3, 0, 180, 141)
	%Body
	drawfilloval (690 - x, 90, 30, 20, 93)
	%Tail
	drawfilloval (725 - x, 90, 15, 5, 93)
	drawfillarc (735 - x, 90, 5, 30, 270, 0, 93)
	%Neck
	drawfillbox (660 - x, 90, 670 - x, 130, 93)
	%Head
	drawfillbox (650 - x, 130, 670 - x, 150, 90)
	%Beak
	drawfillarc (650 - x, 135, 10, 5, 90, 270, 90)
	%Mouth
	drawline (640 - x, 135, 650 - x, 135, 7)
	%Eye
	drawfilloval (655 - x, 145, 3, 3, 0)
	%Pupil
	drawfilloval (655 - x, 145, 1, 1, 7)
	%How quickly it moves
	delay (40)
    end for
end diplodocusEnterScene1

procedure herbivoreText
    %Triceratops Text
    locate (15, 40)
    put "Did you guys hear about those carnivores?" ..
    %Text Line
    drawline (380, 160, 360, 120, 0)
    %How long it's on screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (300, x + 160, 640, x + 160, 19)
    end for
    %Erases Line
    drawline (380, 160, 360, 120, 19)
    %Brachiosaurus Text
    locate (15, 31)
    put "Yeah, I heard that they knocked over that toilet." ..
    %Text Line
    drawline (380, 160, 420, 140, 0)
    %How long it's on screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (240, x + 160, 640, x + 160, 19)
    end for
    %Erases Line
    drawline (380, 160, 420, 140, 19)
    %Diplodocus Text
    locate (15, 40)
    put "What clumsy fools!" ..
    %Text Line
    drawline (380, 160, 510, 135, 0)
    %How long it's on screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (300, x + 160, 460, x + 160, 19)
    end for
    %Erases Line
    drawline (380, 160, 510, 135, 19)
end herbivoreText

procedure tRexEnterScene1
    %How much it moves
    for x : 0 .. 300
	%Eraser
	drawfillbox (-106 + x, 50, 0 + x, 150, 19)
	%Right Leg
	drawfillbox (-50 + x, 50, -40 + x, 90, 143)
	%Left Leg
	drawfillbox (-70 + x, 50, -60 + x, 80, 143)
	%Tail
	drawfillarc (-75 + x, 80, 30, 8, 180, 360, 141)
	%Body
	drawfillbox (-45 + x, 72, -30 + x, 125, 141)
	drawfillbox (-55 + x, 72, -45 + x, 115, 141)
	drawfillbox (-65 + x, 72, -30 + x, 105, 141)
	drawfillbox (-75 + x, 72, -30 + x, 95, 141)
	%Left Foot
	drawfillbox (-70 + x, 50, -40 + x, 55, 142)
	drawfillarc (-70 + x, 55, 30, 5, 0, 90, 142)
	%Right Foot
	drawfillbox (-50 + x, 50, -20 + x, 55, 142)
	drawfillarc (-50 + x, 55, 30, 5, 0, 90, 142)
	%Bottom Arm
	drawfillbox (-40 + x, 100, -20 + x, 105, 143)
	%Top Arm
	drawfillbox (-30 + x, 110, -20 + x, 115, 143)
	%Bottom Hand Claws
	%Left
	drawfillarc (-18 + x, 96, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (-14 + x, 96, 3, 4, 70, 110, 0)
	%Top Hand Claws
	%Left
	drawfillarc (-18 + x, 106, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (-14 + x, 106, 3, 4, 70, 110, 0)
	%Bottom Hand
	drawfillarc (-20 + x, 110, 10, 5, 0, 90, 143)
	%Top Hand
	drawfillarc (-20 + x, 100, 10, 5, 0, 90, 143)
	%Stripes on Body
	drawline (-45 + x, 125, -35 + x, 115, 12)
	drawline (-55 + x, 115, -45 + x, 105, 12)
	drawline (-65 + x, 105, -55 + x, 95, 12)
	drawline (-75 + x, 95, -65 + x, 85, 12)
	%Teeth
	drawfillarc (-16 + x, 130, 5, 5, 80, 100, 0)
	drawfillarc (-11 + x, 130, 5, 5, 80, 100, 0)
	drawfillarc (-6 + x, 130, 5, 5, 80, 100, 0)
	drawfillarc (-1 + x, 130, 5, 5, 80, 100, 0)
	drawfillarc (-8 + x, 130, 5, 5, 200, 260, 0)
	drawfillarc (-4 + x, 128, 5, 5, 200, 260, 0)
	%Head
	drawfillarc (-20 + x, 135, 20, 15, 0, 315, 140)
	%Eye
	drawfilloval (-24 + x, 144, 3, 3, 0)
	%Pupil
	drawfilloval (-24 + x, 144, 1, 1, 7)
	%How Quikly it Moves
	delay (70)
    end for
end tRexEnterScene1

procedure gigonotosaurusEnterScene1
    %How much it moves
    for x : 0 .. 193
	%Eraser
	drawfillbox (-121 + x, 50, -5 + x, 160, 19)
	%Tail
	drawfillarc (-70 + x, 85, 50, 10, 90, 180, 140)
	%Stripes on Tail from Left to Right
	drawline (-110 + x, 91, -110 + x, 86, 12)
	drawline (-100 + x, 93, -100 + x, 88, 12)
	drawline (-90 + x, 94, -90 + x, 89, 12)
	drawline (-80 + x, 94, -80 + x, 89, 12)
	%Left Leg
	drawfilloval (-70 + x, 70, 10, 20, 141)
	%Right Leg
	drawfilloval (-40 + x, 70, 10, 20, 141)
	%Left Foot
	drawfillarc (-70 + x, 50, 20, 10, 0, 90, 141)
	%Right Foot
	drawfillarc (-40 + x, 50, 20, 10, 0, 90, 141)
	%Top Arm
	drawfillbox (-40 + x, 105, -20 + x, 110, 141)
	%Bottom Arm
	drawfillbox (-40 + x, 95, -20 + x, 100, 141)
	%Top Claw
	drawfillarc (-20 + x, 105, 5, 5, 315, 90, 0)
	%Bottom Claw
	drawfillarc (-20 + x, 95, 5, 5, 315, 90, 0)
	%Body
	drawfilloval (-55 + x, 110, 25, 30, 140)
	%Teeth
	drawfillarc (-10 + x, 130, 7, 7, 50, 100, 0)
	drawfillarc (-16 + x, 131, 7, 7, 50, 100, 0)
	drawfillarc (-21 + x, 135, 7, 7, 50, 100, 0)
	drawfillarc (-13 + x, 131, 3, 3, 230, 280, 0)
	drawfillarc (-18 + x, 135, 3, 3, 240, 290, 0)
	drawfillarc (-24 + x, 139, 2, 2, 240, 290, 0)
	%Head
	drawfillarc (-30 + x, 140, 25, 20, 350, 315, 141)
	%Eye
	drawfilloval (-30 + x, 150, 4, 4, 0)
	%Pupil
	drawfilloval (-30 + x, 150, 1, 1, 7)
	%How Quickly it Moves
	delay (80)
    end for
end gigonotosaurusEnterScene1

procedure troodonEnterScene1
    %How much it moves
    for x : 0 .. 72
	%Eraser
	drawfillbox (-65 + x, 50, -12 + x, 114, 19)
	%Tail
	drawfillarc (-37 + x, 60, 27, 5, 90, 180, 43)
	%Claw on Left Foot
	drawfillarc (-29 + x, 52, 2, 2, 315, 180, 0)
	%Claw on Right Foot
	drawfillarc (-15 + x, 52, 2, 2, 315, 180, 0)
	%Left Leg
	drawfillbox (-37 + x, 50, -31 + x, 60, 44)
	%Right Leg
	drawfillbox (-23 + x, 50, -17 + x, 60, 44)
	%Waste
	drawfillbox (-37 + x, 60, -17 + x, 72, 43)
	%Neck
	drawfillbox (-30 + x, 90, -23 + x, 95, 43)
	%Top Arm/Claw
	drawfillarc (-16 + x, 80, 3, 3, 315, 180, 0)
	%Bottom Arm/Claw
	drawfillarc (-16 + x, 73, 3, 3, 315, 180, 0)
	%Body
	drawfilloval (-27 + x, 76, 10, 14, 43)
	%Head
	drawfillarc (-22 + x, 98, 10, 7, 0, 315, 44)
	%Eye
	drawfilloval (-26 + x, 100, 3, 3, 0)
	%Pupil
	drawfilloval (-26 + x, 100, 1, 1, 7)
	%Tail of the Feather
	drawline (-30 + x, 104, -33 + x, 108, 141)
	%Feather
	drawfillarc (-33 + x, 106, 8, 8, 100, 150, 12)
	%Stripe on the Feather
	Draw.ThickLine (-35 + x, 108, -37 + x, 110, 2, 7)
	%Top Arm/Claw
	drawfillarc (-16 + x, 80, 3, 3, 315, 180, 0)
	%How Quickly it Moves
	delay (40)
    end for
end troodonEnterScene1

procedure carnivoresText
    %Trex Text
    locate (15, 40)
    put "WHAT DID YOU JUST SAY?!" ..
    %Text Line
    drawline (360, 160, 300, 150, 0)
    %How long it's on screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (310, x + 160, 500, x + 160, 19)
    end for
    %Erases Line
    drawline (360, 160, 300, 150, 19)
    %Gigonotosaurus Text
    locate (15, 30)
    put "Why don't you back that up?" ..
    %Text Line
    drawline (240, 160, 200, 150, 0)
    %How long it's on screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (220, x + 160, 450, x + 160, 19)
    end for
    %Erases Line
    drawline (240, 160, 200, 150, 19)
    %Troodon Text
    locate (14, 10)
    put "Yeah, maybe with a SUMO FIGHT?" ..
    %Text Line
    drawline (100, 175, 70, 100, 0)
    %How long it's on screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (70, 175 + x, 315, 175 + x, 19)
    end for
    %Erases Line
    drawline (100, 175, 70, 100, 19)
end carnivoresText

procedure herbivoreResponse
    %Triceratops Response
    locate (15, 40)
    put "Alright, tomorrow we fight then!" ..
    %Text Line
    drawline (380, 160, 360, 120, 0)
    %How long it's on screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (300, x + 160, 570, x + 160, 19)
    end for
    %Erases Line
    drawline (380, 160, 360, 120, 19)
end herbivoreResponse

procedure carnivoresExit
    %How much it moves
    for x : 0 .. 300
	%Eraser
	drawfillbox (8 - x, 50, 301 - x, 160, 19)
	%Trex
	%Right Leg
	drawfillbox (250 - x, 50, 260 - x, 90, 143)
	%Left Leg
	drawfillbox (230 - x, 50, 240 - x, 80, 143)
	%Tail
	drawfillarc (225 - x, 80, 30, 8, 180, 360, 141)
	%Body
	drawfillbox (255 - x, 72, 270 - x, 125, 141)
	drawfillbox (245 - x, 72, 255 - x, 115, 141)
	drawfillbox (235 - x, 72, 270 - x, 105, 141)
	drawfillbox (225 - x, 72, 270 - x, 95, 141)
	%Left Foot
	drawfillbox (230 - x, 50, 260 - x, 55, 142)
	drawfillarc (230 - x, 55, 30, 5, 0, 90, 142)
	%Right Foot
	drawfillbox (250 - x, 50, 280 - x, 55, 142)
	drawfillarc (250 - x, 55, 30, 5, 0, 90, 142)
	%Bottom Arm
	drawfillbox (260 - x, 100, 280 - x, 105, 143)
	%Top Arm
	drawfillbox (270 - x, 110, 280 - x, 115, 143)
	%Bottom Hand Claws
	%Left
	drawfillarc (282 - x, 96, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (286 - x, 96, 3, 4, 70, 110, 0)
	%Top Hand Claws
	%Left
	drawfillarc (282 - x, 106, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (286 - x, 106, 3, 4, 70, 110, 0)
	%Bottom Hand
	drawfillarc (280 - x, 110, 10, 5, 0, 90, 143)
	%Top Hand
	drawfillarc (280 - x, 100, 10, 5, 0, 90, 143)
	%Stripes on Body
	drawline (255 - x, 125, 265 - x, 115, 12)
	drawline (245 - x, 115, 255 - x, 105, 12)
	drawline (235 - x, 105, 245 - x, 95, 12)
	drawline (225 - x, 95, 235 - x, 85, 12)
	%Teeth
	drawfillarc (284 - x, 130, 5, 5, 80, 100, 0)
	drawfillarc (289 - x, 130, 5, 5, 80, 100, 0)
	drawfillarc (294 - x, 130, 5, 5, 80, 100, 0)
	drawfillarc (299 - x, 130, 5, 5, 80, 100, 0)
	drawfillarc (292 - x, 130, 5, 5, 200, 260, 0)
	drawfillarc (296 - x, 128, 5, 5, 200, 260, 0)
	%Head
	drawfillarc (280 - x, 135, 20, 15, 0, 315, 140)
	%Eye
	drawfilloval (276 - x, 144, 3, 3, 0)
	%Pupil
	drawfilloval (276 - x, 144, 1, 1, 7)
	%Gigonotosaurus
	%Tail
	drawfillarc (123 - x, 85, 50, 10, 90, 180, 140)
	%Stripes on Tail from Left to Right
	drawline (83 - x, 91, 83 - x, 86, 12)
	drawline (93 - x, 93, 93 - x, 88, 12)
	drawline (103 - x, 94, 103 - x, 89, 12)
	drawline (113 - x, 94, 113 - x, 89, 12)
	%Left Leg
	drawfilloval (123 - x, 70, 10, 20, 141)
	%Right Leg
	drawfilloval (153 - x, 70, 10, 20, 141)
	%Left Foot
	drawfillarc (123 - x, 50, 20, 10, 0, 90, 141)
	%Right Foot
	drawfillarc (153 - x, 50, 20, 10, 0, 90, 141)
	%Top Arm
	drawfillbox (153 - x, 105, 173 - x, 110, 141)
	%Bottom Arm
	drawfillbox (153 - x, 95, 173 - x, 100, 141)
	%Top Claw
	drawfillarc (173 - x, 105, 5, 5, 315, 90, 0)
	%Bottom Claw
	drawfillarc (173 - x, 95, 5, 5, 315, 90, 0)
	%Body
	drawfilloval (138 - x, 110, 25, 30, 140)
	%Teeth
	drawfillarc (183 - x, 130, 7, 7, 50, 100, 0)
	drawfillarc (177 - x, 131, 7, 7, 50, 100, 0)
	drawfillarc (172 - x, 135, 7, 7, 50, 100, 0)
	drawfillarc (180 - x, 131, 3, 3, 230, 280, 0)
	drawfillarc (175 - x, 135, 3, 3, 240, 290, 0)
	drawfillarc (169 - x, 139, 2, 2, 240, 290, 0)
	%Head
	drawfillarc (163 - x, 140, 25, 20, 350, 315, 141)
	%Eye
	drawfilloval (163 - x, 150, 4, 4, 0)
	%Pupil
	drawfilloval (163 - x, 150, 1, 1, 7)
	%Troodon
	%Tail
	drawfillarc (35 - x, 60, 27, 5, 90, 180, 43)
	%Claw on Left Foot
	drawfillarc (43 - x, 52, 2, 2, 315, 180, 0)
	%Claw on Right Foot
	drawfillarc (57 - x, 52, 2, 2, 315, 180, 0)
	%Left Leg
	drawfillbox (35 - x, 50, 41 - x, 60, 44)
	%Right Leg
	drawfillbox (49 - x, 50, 55 - x, 60, 44)
	%Waste
	drawfillbox (35 - x, 60, 55 - x, 72, 43)
	%Neck
	drawfillbox (42 - x, 90, 49 - x, 95, 43)
	%Top Arm/Claw
	drawfillarc (56 - x, 80, 3, 3, 315, 180, 0)
	%Bottom Arm/Claw
	drawfillarc (56 - x, 73, 3, 3, 315, 180, 0)
	%Body
	drawfilloval (45 - x, 76, 10, 14, 43)
	%Head
	drawfillarc (50 - x, 98, 10, 7, 0, 315, 44)
	%Eye
	drawfilloval (46 - x, 100, 3, 3, 0)
	%Pupil
	drawfilloval (46 - x, 100, 1, 1, 7)
	%Tail of the Feather
	drawline (42 - x, 104, 39 - x, 108, 141)
	%Feather
	drawfillarc (39 - x, 106, 8, 8, 100, 150, 12)
	%Stripe on the Feather
	Draw.ThickLine (37 - x, 108, 35 - x, 110, 2, 7)
	%Top Arm/Claw
	drawfillarc (56 - x, 80, 3, 3, 315, 180, 0)
	%How Quickly they Exit
	delay (50)
    end for
end carnivoresExit

procedure herbivoresExit
    %How much it moves
    for x : 0 .. 300
	%Erase
	drawfillbox (339 + x, 50, 740 + x, 150, 19)
	%Triceratops
	%Tail
	drawfillarc (410 + x, 70, 20, 10, 0, 90, 140)
	%Legs from Left to Right
	drawfillbox (375 + x, 50, 380 + x, 70, 190)
	drawfillbox (385 + x, 50, 390 + x, 70, 190)
	drawfillbox (395 + x, 50, 400 + x, 70, 190)
	drawfillbox (405 + x, 50, 410 + x, 70, 190)
	%Feet from Left to Right
	drawfillarc (377 + x, 50, 2, 5, 0, 180, 0)
	drawfillarc (387 + x, 50, 2, 5, 0, 180, 0)
	drawfillarc (397 + x, 50, 2, 5, 0, 180, 0)
	drawfillarc (407 + x, 50, 2, 5, 0, 180, 0)
	%Body
	drawfilloval (390 + x, 75, 20, 15, 140)
	%Frill
	drawfilloval (360 + x, 80, 20, 20, 190)
	%Head
	drawfilloval (360 + x, 80, 15, 13, 140)
	%Horns from Left to Right
	drawfillarc (370 + x, 105, 5, 15, 250, 290, 0)
	drawfillarc (360 + x, 110, 5, 15, 250, 290, 0)
	drawfillarc (350 + x, 105, 5, 15, 250, 290, 0)
	%Mouth
	drawline (352 + x, 75, 368 + x, 75, 7)
	%Right Eye
	drawfilloval (365 + x, 85, 2, 2, 0)
	%Left Eye
	drawfilloval (355 + x, 85, 2, 2, 0)
	%Right Pupil
	drawfilloval (365 + x, 85, 1, 1, 7)
	%Left Eye
	drawfilloval (355 + x, 85, 1, 1, 7)
	%Left Nostril
	drawfilloval (362 + x, 80, 1, 1, 7)
	%Right Nostril
	drawfilloval (358 + x, 80, 1, 1, 7)
	%Brachiosaurus
	%Legs from Right to Left
	drawfillbox (470 + x, 50, 475 + x, 80, 2)
	drawfillbox (460 + x, 50, 465 + x, 80, 2)
	drawfillbox (450 + x, 50, 455 + x, 80, 2)
	drawfillbox (440 + x, 50, 445 + x, 80, 2)
	%Feet from Right to Left
	drawfillarc (472 + x, 50, 2, 5, 0, 180, 0)
	drawfillarc (462 + x, 50, 2, 5, 0, 180, 0)
	drawfillarc (452 + x, 50, 2, 5, 0, 180, 0)
	drawfillarc (442 + x, 50, 2, 5, 0, 180, 0)
	%Tail
	drawfillarc (470 + x, 85, 50, 5, 0, 90, 190)
	%Body
	drawfilloval (457 + x, 85, 20, 15, 190)
	%Neck
	drawfillbox (440 + x, 90, 450 + x, 130, 190)
	%Bump on the Head
	drawfillarc (445 + x, 136, 5, 5, 270, 180, 139)
	%Stripes on the Bump from Left to Right
	drawline (443 + x, 136, 443 + x, 140, 76)
	drawline (445 + x, 136, 445 + x, 141, 76)
	drawline (447 + x, 136, 447 + x, 140, 76)
	%Head
	drawfilloval (440 + x, 130, 10, 7, 2)
	%Mouth
	drawline (432 + x, 126, 439 + x, 129, 7)
	%Eye
	drawfilloval (445 + x, 132, 2, 2, 0)
	%Pupil
	drawfilloval (445 + x, 132, 1, 1, 7)
	%Nostril
	drawfilloval (432 + x, 132, 1, 1, 7)
	%Diplodocus
	%Legs from Left to Right
	drawfillbox (553 + x, 50, 558 + x, 80, 90)
	drawfillbox (563 + x, 50, 568 + x, 80, 90)
	drawfillbox (573 + x, 50, 578 + x, 80, 90)
	drawfillbox (583 + x, 50, 588 + x, 80, 90)
	%Feet from Left to Right
	drawfillarc (555 + x, 50, 3, 3, 0, 180, 141)
	drawfillarc (565 + x, 50, 3, 3, 0, 180, 141)
	drawfillarc (575 + x, 50, 3, 3, 0, 180, 141)
	drawfillarc (585 + x, 50, 3, 3, 0, 180, 141)
	%Body
	drawfilloval (570 + x, 90, 30, 20, 93)
	%Tail
	drawfilloval (605 + x, 90, 15, 5, 93)
	drawfillarc (615 + x, 90, 5, 30, 270, 0, 93)
	%Neck
	drawfillbox (540 + x, 90, 550 + x, 130, 93)
	%Head
	drawfillbox (530 + x, 130, 550 + x, 150, 90)
	%Beak
	drawfillarc (530 + x, 135, 10, 5, 90, 270, 90)
	%Mouth
	drawline (520 + x, 135, 530 + x, 135, 7)
	%Eye
	drawfilloval (535 + x, 145, 3, 3, 0)
	%Pupil
	drawfilloval (535 + x, 145, 1, 1, 7)
	%How Quickly they Exit
	delay (50)
    end for
end herbivoresExit

procedure background2
    %Wall
    for x : 0 .. 180
	drawline (0, x + 50, 640, x + 50, 186)
    end for
    %Floor
    for x : 0 .. 50
	drawline (0, x, 640, x, 185)
    end for
    %Sumo Ring
    for x : 0 .. 20
	drawoval (320, 30, x + 188, x, 0)
    end for
    for x : 0 .. 25
	drawline (0, x + 230, 640, x + 230, 184)
	drawline (0, x + 295, 640, x + 295, 184)
	drawline (0, x + 360, 640, x + 360, 184)
    end for
    for x : 0 .. 15
	drawline (16, x + 235, 624, x + 235, 15)
	drawline (16, x + 300, 624, x + 300, 15)
	drawline (16, x + 365, 624, x + 365, 15)
    end for
    for x : 0 .. 40
	%First Row of Tiling from Left to Right
	drawline (0, x + 255, 48, x + 255, 248)
	drawline (48, x + 255, 96, x + 255, 101)
	drawline (96, x + 255, 144, x + 255, 248)
	drawline (144, x + 255, 192, x + 255, 101)
	drawline (192, x + 255, 240, x + 255, 248)
	drawline (240, x + 255, 288, x + 255, 101)
	drawline (288, x + 255, 336, x + 255, 248)
	drawline (336, x + 255, 384, x + 255, 101)
	drawline (384, x + 255, 432, x + 255, 248)
	drawline (432, x + 255, 480, x + 255, 101)
	drawline (480, x + 255, 528, x + 255, 248)
	drawline (528, x + 255, 576, x + 255, 101)
	drawline (576, x + 255, 624, x + 255, 248)
	drawline (624, x + 255, 640, x + 255, 101)
	%Second Row of Tiling from Left to Right
	drawline (0, x + 320, 48, x + 320, 248)
	drawline (48, x + 320, 96, x + 320, 101)
	drawline (96, x + 320, 144, x + 320, 248)
	drawline (144, x + 320, 192, x + 320, 101)
	drawline (192, x + 320, 240, x + 320, 248)
	drawline (240, x + 320, 288, x + 320, 101)
	drawline (288, x + 320, 336, x + 320, 248)
	drawline (336, x + 320, 384, x + 320, 101)
	drawline (384, x + 320, 432, x + 320, 248)
	drawline (432, x + 320, 480, x + 320, 101)
	drawline (480, x + 320, 528, x + 320, 248)
	drawline (528, x + 320, 576, x + 320, 101)
	drawline (576, x + 320, 624, x + 320, 248)
	drawline (624, x + 320, 640, x + 320, 101)
    end for
    for x : 0 .. 15
	%Third Row of Tiling from Left to Right
	drawline (0, x + 385, 48, x + 385, 248)
	drawline (48, x + 385, 96, x + 385, 101)
	drawline (96, x + 385, 144, x + 385, 248)
	drawline (144, x + 385, 192, x + 385, 101)
	drawline (192, x + 385, 240, x + 385, 248)
	drawline (240, x + 385, 288, x + 385, 101)
	drawline (288, x + 385, 336, x + 385, 248)
	drawline (336, x + 385, 384, x + 385, 101)
	drawline (384, x + 385, 432, x + 385, 248)
	drawline (432, x + 385, 480, x + 385, 101)
	drawline (480, x + 385, 528, x + 385, 248)
	drawline (528, x + 385, 576, x + 385, 101)
	drawline (576, x + 385, 624, x + 385, 248)
	drawline (624, x + 385, 640, x + 385, 101)
    end for
end background2

procedure intro2
    %Music (Pokemon Red and Blue Intro Song)
    play ("8<d-8d-4>a-8<d-8d-4>a8<d-8d-4>a-8<d-8d-4>c-8<d-8d4>a-8<d-8>d4>c2d2<d2>2b2<b8<d-8d-4>a-8<d-8d-4>a8<d-8d-4>b8<d-8d-4>c1d-1>d")
    %Fight Text
    locate (12, 37)
    put "Fight" ..
    %Text Eraser
    delay (3000)
    for x : 0 .. 20
	drawline (280, x + 205, 340, x + 205, 186)
    end for
end intro2

procedure troodonEnterScene2
    %How much it moves
    for x : 0 .. 250
	%Eraser
	drawfillbox (-65 + x, 51, -12 + x, 115, 186)
	%Tail
	drawfillarc (-37 + x, 61, 27, 5, 90, 180, 43)
	%Claw on Left Foot
	drawfillarc (-29 + x, 53, 2, 2, 315, 180, 0)
	%Claw on Right Foot
	drawfillarc (-15 + x, 53, 2, 2, 315, 180, 0)
	%Left Leg
	drawfillbox (-37 + x, 51, -31 + x, 61, 44)
	%Right Leg
	drawfillbox (-23 + x, 51, -17 + x, 61, 44)
	%Waste
	drawfillbox (-37 + x, 61, -17 + x, 73, 43)
	%Neck
	drawfillbox (-30 + x, 91, -23 + x, 96, 43)
	%Top Arm/Claw
	drawfillarc (-16 + x, 81, 3, 3, 315, 180, 0)
	%Bottom Arm/Claw
	drawfillarc (-16 + x, 74, 3, 3, 315, 180, 0)
	%Body
	drawfilloval (-27 + x, 77, 10, 14, 43)
	%Head
	drawfillarc (-22 + x, 99, 10, 7, 0, 315, 44)
	%Eye
	drawfilloval (-26 + x, 101, 3, 3, 0)
	%Pupil
	drawfilloval (-26 + x, 101, 1, 1, 7)
	%Tail of the Feather
	drawline (-30 + x, 105, -33 + x, 109, 141)
	%Feather
	drawfillarc (-33 + x, 107, 8, 8, 100, 150, 12)
	%Stripe on the Feather
	Draw.ThickLine (-35 + x, 109, -37 + x, 111, 2, 7)
	%Top Arm/Claw
	drawfillarc (-16 + x, 81, 3, 3, 315, 180, 0)
	%How Quickly it Moves
	delay (40)
    end for
end troodonEnterScene2

procedure brachiosaurusEnterScene2
    %Troodon Attacks the Brachiosaurus
    %How much it moves
    for x : 0 .. 250
	%Eraser
	drawfillbox (640 - x, 51, 730 - x, 142, 186)
	%Legs from Right to Left
	drawfillbox (680 - x, 51, 685 - x, 81, 2)
	drawfillbox (670 - x, 51, 675 - x, 81, 2)
	drawfillbox (660 - x, 51, 665 - x, 81, 2)
	drawfillbox (650 - x, 51, 655 - x, 81, 2)
	%Feet from Right to Left
	drawfillarc (682 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (672 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (662 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (652 - x, 51, 2, 5, 0, 180, 0)
	%Tail
	drawfillarc (680 - x, 86, 50, 5, 0, 90, 190)
	%Body
	drawfilloval (667 - x, 86, 20, 15, 190)
	%Neck
	drawfillbox (650 - x, 91, 660 - x, 131, 190)
	%Bump on the Head
	drawfillarc (655 - x, 137, 5, 5, 270, 180, 139)
	%Stripes on the Bump from Left to Right
	drawline (653 - x, 137, 653 - x, 141, 76)
	drawline (655 - x, 137, 655 - x, 142, 76)
	drawline (657 - x, 137, 657 - x, 141, 76)
	%Head
	drawfilloval (650 - x, 131, 10, 7, 2)
	%Mouth
	drawline (642 - x, 127, 649 - x, 130, 7)
	%Eye
	drawfilloval (655 - x, 133, 2, 2, 0)
	%Pupil
	drawfilloval (655 - x, 133, 1, 1, 7)
	%Nostril
	drawfilloval (642 - x, 133, 1, 1, 7)
	delay (40)
    end for
end brachiosaurusEnterScene2

procedure troodonAttacks
    delay (5000)
    %How much it moves
    for x : 0 .. 160
	%Eraser
	drawfillbox (185 + x, 51, 238 + x, 115, 186)
	%Tail
	drawfillarc (213 + x, 61, 27, 5, 90, 180, 43)
	%Claw on Left Foot
	drawfillarc (221 + x, 53, 2, 2, 315, 180, 0)
	%Claw on Right Foot
	drawfillarc (235 + x, 53, 2, 2, 315, 180, 0)
	%Left Leg
	drawfillbox (213 + x, 51, 219 + x, 61, 44)
	%Right Leg
	drawfillbox (227 + x, 51, 233 + x, 61, 44)
	%Waste
	drawfillbox (213 + x, 61, 233 + x, 73, 43)
	%Neck
	drawfillbox (220 + x, 91, 227 + x, 96, 43)
	%Top Arm/Claw
	drawfillarc (234 + x, 81, 3, 3, 315, 180, 0)
	%Bottom Arm/Claw
	drawfillarc (234 + x, 74, 3, 3, 315, 180, 0)
	%Body
	drawfilloval (223 + x, 77, 10, 14, 43)
	%Head
	drawfillarc (228 + x, 99, 10, 7, 0, 315, 44)
	%Eye
	drawfilloval (224 + x, 101, 3, 3, 0)
	%Pupil
	drawfilloval (224 + x, 101, 1, 1, 7)
	%Tail of the Feather
	drawline (220 + x, 105, 217 + x, 109, 141)
	%Feather
	drawfillarc (217 + x, 107, 8, 8, 100, 150, 12)
	%Stripe on the Feather
	Draw.ThickLine (215 + x, 109, 213 + x, 111, 2, 7)
	%Top Arm/Claw
	drawfillarc (234 + x, 81, 3, 3, 315, 180, 0)
	%How Quickly it Moves
	delay (20)
    end for
end troodonAttacks

procedure brachiosaurusFightsBack
    delay (100)
    %How much it moves
    for x : 0 .. 200
	%Eraser
	drawfillbox (343 - x, 51, 480 - x, 142, 186)
	%Brachiosaurus
	%Legs from Right to Left
	drawfillbox (430 - x, 51, 435 - x, 81, 2)
	drawfillbox (420 - x, 51, 425 - x, 81, 2)
	drawfillbox (410 - x, 51, 415 - x, 81, 2)
	drawfillbox (400 - x, 51, 405 - x, 81, 2)
	%Feet from Right to Left
	drawfillarc (432 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (422 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (412 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (402 - x, 51, 2, 5, 0, 180, 0)
	%Tail
	drawfillarc (430 - x, 86, 50, 5, 0, 90, 190)
	%Body
	drawfilloval (417 - x, 86, 20, 15, 190)
	%Neck
	drawfillbox (400 - x, 91, 410 - x, 131, 190)
	%Bump on the Head
	drawfillarc (405 - x, 137, 5, 5, 270, 180, 139)
	%Stripes on the Bump from Left to Right
	drawline (403 - x, 137, 403 - x, 141, 76)
	drawline (405 - x, 137, 405 - x, 142, 76)
	drawline (407 - x, 137, 407 - x, 141, 76)
	%Head
	drawfilloval (400 - x, 131, 10, 7, 2)
	%Mouth
	drawline (392 - x, 127, 399 - x, 130, 7)
	%Eye
	drawfilloval (405 - x, 133, 2, 2, 0)
	%Pupil
	drawfilloval (405 - x, 133, 1, 1, 7)
	%Nostril
	drawfilloval (392 - x, 133, 1, 1, 7)
	%Troodon
	%Tail
	drawfillarc (373 - x, 61, 27, 5, 90, 180, 43)
	%Claw on Left Foot
	drawfillarc (381 - x, 53, 2, 2, 315, 180, 0)
	%Claw on Right Foot
	drawfillarc (395 - x, 53, 2, 2, 315, 180, 0)
	%Left Leg
	drawfillbox (373 - x, 51, 379 - x, 61, 44)
	%Right Leg
	drawfillbox (387 - x, 51, 393 - x, 61, 44)
	%Waste
	drawfillbox (373 - x, 61, 393 - x, 73, 43)
	%Neck
	drawfillbox (380 - x, 91, 387 - x, 96, 43)
	%Top Arm/Claw
	drawfillarc (394 - x, 81, 3, 3, 315, 180, 0)
	%Bottom Arm/Claw
	drawfillarc (394 - x, 74, 3, 3, 315, 180, 0)
	%Body
	drawfilloval (383 - x, 77, 10, 14, 43)
	%Head
	drawfillarc (389 - x, 99, 10, 7, 0, 315, 44)
	%Eye
	drawfilloval (384 - x, 101, 3, 3, 0)
	%Pupil
	drawfilloval (384 - x, 101, 1, 1, 7)
	%Tail of the Feather
	drawline (380 - x, 105, 377 - x, 109, 141)
	%Feather
	drawfillarc (377 - x, 107, 8, 8, 100, 150, 12)
	%Stripe on the Feather
	Draw.ThickLine (375 - x, 109, 373 - x, 111, 2, 7)
	%Top Arm/Claw
	drawfillarc (394 - x, 81, 3, 3, 315, 180, 0)
	%How Quickly they Move
	delay (80)
    end for
    %How much it moves
    for x : 0 .. 200
	%Troodon being knoecked out of the ring
	%Erase
	drawfillbox (145 - x, 51, 199 - x, 115, 186)
	%Tail
	drawfillarc (173 - x, 61, 27, 5, 90, 180, 43)
	%Claw on Left Foot
	drawfillarc (181 - x, 53, 2, 2, 315, 180, 0)
	%Claw on Right Foot
	drawfillarc (195 - x, 53, 2, 2, 315, 180, 0)
	%Left Leg
	drawfillbox (173 - x, 51, 179 - x, 61, 44)
	%Right Leg
	drawfillbox (187 - x, 51, 193 - x, 61, 44)
	%Waste
	drawfillbox (173 - x, 61, 193 - x, 73, 43)
	%Neck
	drawfillbox (180 - x, 91, 187 - x, 96, 43)
	%Top Arm/Claw
	drawfillarc (194 - x, 81, 3, 3, 315, 180, 0)
	%Bottom Arm/Claw
	drawfillarc (194 - x, 74, 3, 3, 315, 180, 0)
	%Body
	drawfilloval (183 - x, 77, 10, 14, 43)
	%Head
	drawfillarc (188 - x, 99, 10, 7, 0, 315, 44)
	%Eye
	drawfilloval (184 - x, 101, 3, 3, 0)
	%Pupil
	drawfilloval (184 - x, 101, 1, 1, 7)
	%Tail of the Feather
	drawline (180 - x, 105, 177 - x, 109, 141)
	%Feather
	drawfillarc (177 - x, 107, 8, 8, 100, 150, 12)
	%Stripe on the Feather
	Draw.ThickLine (175 - x, 109, 173 - x, 111, 2, 7)
	%Top Arm/Claw
	drawfillarc (194 - x, 81, 3, 3, 115, 180, 0)
	delay (5)
    end for
end brachiosaurusFightsBack

procedure brachiosaurusText
    %Diplodocus Text
    locate (15, 10)
    put "That was the easiest thing ever!" ..
    %Text Line
    drawline (100, 160, 180, 130, 0)
    %How long the Text is on Screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (70, x + 160, 330, x + 160, 186)
    end for
    %Erases Line
    drawline (100, 160, 180, 130, 186)
end brachiosaurusText

procedure brachiosaurusExitScene2
    %How much it moves
    for x : 0 .. 280
	%Brachiosaurus
	%Erase
	drawfillbox (190 - x, 51, 280 - x, 142, 186)
	%Legs from Right to Left
	drawfillbox (230 - x, 51, 235 - x, 81, 2)
	drawfillbox (220 - x, 51, 225 - x, 81, 2)
	drawfillbox (210 - x, 51, 215 - x, 81, 2)
	drawfillbox (200 - x, 51, 205 - x, 81, 2)
	%Feet from Right to Left
	drawfillarc (232 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (222 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (212 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (202 - x, 51, 2, 5, 0, 180, 0)
	%Tail
	drawfillarc (230 - x, 86, 50, 5, 0, 90, 190)
	%Body
	drawfilloval (217 - x, 86, 20, 15, 190)
	%Neck
	drawfillbox (200 - x, 91, 210 - x, 131, 190)
	%Bump on the Head
	drawfillarc (205 - x, 137, 5, 5, 270, 180, 139)
	%Stripes on the Bump from Left to Right
	drawline (203 - x, 137, 203 - x, 141, 76)
	drawline (205 - x, 137, 205 - x, 142, 76)
	drawline (207 - x, 137, 207 - x, 141, 76)
	%Head
	drawfilloval (200 - x, 131, 10, 7, 2)
	%Mouth
	drawline (192 - x, 127, 199 - x, 130, 7)
	%Eye
	drawfilloval (205 - x, 133, 2, 2, 0)
	%Pupil
	drawfilloval (205 - x, 133, 1, 1, 7)
	%Nostril
	drawfilloval (192 - x, 133, 1, 1, 7)
	%How quickly it moves
	delay (50)
    end for
    %Time before the next procedure starts
    delay (3000)
end brachiosaurusExitScene2

procedure diplodocusEnterScene2
    %How much it moves
    for x : 0 .. 250
	%Eraser
	drawfillbox (640 - x, 51, 741 - x, 151, 186)
	%Legs from Left to Right
	drawfillbox (673 - x, 51, 678 - x, 81, 90)
	drawfillbox (683 - x, 51, 688 - x, 81, 90)
	drawfillbox (693 - x, 51, 698 - x, 81, 90)
	drawfillbox (703 - x, 51, 708 - x, 81, 90)
	%Feet from Left to Right
	drawfillarc (675 - x, 51, 3, 3, 0, 180, 141)
	drawfillarc (685 - x, 51, 3, 3, 0, 180, 141)
	drawfillarc (695 - x, 51, 3, 3, 0, 180, 141)
	drawfillarc (705 - x, 51, 3, 3, 0, 180, 141)
	%Body
	drawfilloval (690 - x, 91, 30, 20, 93)
	%Tail
	drawfilloval (725 - x, 91, 15, 5, 93)
	drawfillarc (735 - x, 91, 5, 30, 270, 0, 93)
	%Neck
	drawfillbox (660 - x, 91, 670 - x, 131, 93)
	%Head
	drawfillbox (650 - x, 131, 670 - x, 151, 90)
	%Beak
	drawfillarc (650 - x, 136, 10, 5, 90, 270, 90)
	%Mouth
	drawline (640 - x, 136, 650 - x, 136, 7)
	%Eye
	drawfilloval (655 - x, 146, 3, 3, 0)
	%Pupil
	drawfilloval (655 - x, 146, 1, 1, 7)
	delay (30)
    end for
end diplodocusEnterScene2

procedure gigonotosaurusEnterScene2
    %How much it moves
    for x : 0 .. 250
	%Eraser
	drawfillbox (-121 + x, 51, 0 + x, 161, 186)
	%Tail
	drawfillarc (-70 + x, 86, 50, 10, 90, 180, 140)
	%Stripes on Tail from Left to Right
	drawline (-110 + x, 92, -110 + x, 87, 12)
	drawline (-100 + x, 94, -100 + x, 89, 12)
	drawline (-90 + x, 95, -90 + x, 90, 12)
	drawline (-80 + x, 95, -80 + x, 90, 12)
	%Left Leg
	drawfilloval (-70 + x, 71, 10, 20, 141)
	%Right Leg
	drawfilloval (-40 + x, 71, 10, 20, 141)
	%Left Foot
	drawfillarc (-70 + x, 51, 20, 10, 0, 90, 141)
	%Right Foot
	drawfillarc (-40 + x, 51, 20, 10, 0, 90, 141)
	%Top Arm
	drawfillbox (-40 + x, 106, -20 + x, 111, 141)
	%Bottom Arm
	drawfillbox (-40 + x, 96, -20 + x, 101, 141)
	%Top Claw
	drawfillarc (-20 + x, 106, 5, 5, 315, 90, 0)
	%Bottom Claw
	drawfillarc (-20 + x, 96, 5, 5, 315, 90, 0)
	%Body
	drawfilloval (-55 + x, 111, 25, 30, 140)
	%Teeth
	drawfillarc (-10 + x, 131, 7, 7, 50, 100, 0)
	drawfillarc (-16 + x, 132, 7, 7, 50, 100, 0)
	drawfillarc (-21 + x, 136, 7, 7, 50, 100, 0)
	drawfillarc (-13 + x, 132, 3, 3, 230, 280, 0)
	drawfillarc (-18 + x, 136, 3, 3, 240, 290, 0)
	drawfillarc (-24 + x, 140, 2, 2, 240, 290, 0)
	%Head
	drawfillarc (-30 + x, 141, 25, 20, 350, 315, 141)
	%Eye
	drawfilloval (-30 + x, 151, 4, 4, 0)
	%Pupil
	drawfilloval (-30 + x, 151, 1, 1, 7)
	%How quickly it moves
	delay (30)
    end for
    %How long it lasts
    delay (3000)
end gigonotosaurusEnterScene2

procedure diplodocusAttacks
    %How much it moves
    for x : 0 .. 143
	%Eraser
	drawfillbox (390 - x, 51, 491 - x, 151, 186)
	%Legs from Left to Right
	drawfillbox (423 - x, 51, 428 - x, 81, 90)
	drawfillbox (433 - x, 51, 438 - x, 81, 90)
	drawfillbox (443 - x, 51, 448 - x, 81, 90)
	drawfillbox (453 - x, 51, 458 - x, 81, 90)
	%Feet from Left to Right
	drawfillarc (425 - x, 51, 3, 3, 0, 180, 141)
	drawfillarc (435 - x, 51, 3, 3, 0, 180, 141)
	drawfillarc (445 - x, 51, 3, 3, 0, 180, 141)
	drawfillarc (455 - x, 51, 3, 3, 0, 180, 141)
	%Body
	drawfilloval (440 - x, 91, 30, 20, 93)
	%Tail
	drawfilloval (475 - x, 91, 15, 5, 93)
	drawfillarc (485 - x, 91, 5, 30, 270, 0, 93)
	%Neck
	drawfillbox (410 - x, 91, 420 - x, 131, 93)
	%Head
	drawfillbox (400 - x, 131, 420 - x, 151, 90)
	%Beak
	drawfillarc (400 - x, 136, 10, 5, 90, 270, 90)
	%Mouth
	drawline (390 - x, 136, 400 - x, 136, 7)
	%Eye
	drawfilloval (405 - x, 146, 3, 3, 0)
	%Pupil
	drawfilloval (405 - x, 146, 1, 1, 7)
	%How quickly it moves
	delay (10)
    end for
    %How long this lasts
    delay (1000)
end diplodocusAttacks

procedure diplodocusFails
    %How much it moves
    for x : 0 .. 500
	%Eraser
	drawfillbox (246 + x, 51, 347 + x, 151, 186)
	%Legs from Left to Right
	drawfillbox (279 + x, 51, 284 + x, 81, 90)
	drawfillbox (289 + x, 51, 294 + x, 81, 90)
	drawfillbox (299 + x, 51, 304 + x, 81, 90)
	drawfillbox (309 + x, 51, 314 + x, 81, 90)
	%Feet from Left to Right
	drawfillarc (281 + x, 51, 3, 3, 0, 180, 141)
	drawfillarc (291 + x, 51, 3, 3, 0, 180, 141)
	drawfillarc (301 + x, 51, 3, 3, 0, 180, 141)
	drawfillarc (311 + x, 51, 3, 3, 0, 180, 141)
	%Body
	drawfilloval (296 + x, 91, 30, 20, 93)
	%Tail
	drawfilloval (331 + x, 91, 15, 5, 93)
	drawfillarc (341 + x, 91, 5, 30, 270, 0, 93)
	%Neck
	drawfillbox (266 + x, 91, 276 + x, 131, 93)
	%Head
	drawfillbox (256 + x, 131, 276 + x, 151, 90)
	%Beak
	drawfillarc (256 + x, 136, 9, 5, 90, 270, 90)
	%Mouth
	drawline (247 + x, 136, 257 + x, 136, 7)
	%Eye
	drawfilloval (261 + x, 146, 3, 3, 0)
	%Pupil
	drawfilloval (261 + x, 146, 1, 1, 7)
	%How quickly it moves
	delay (5)
    end for
end diplodocusFails

procedure gigonotosaurusText
    %The amount of time before starting
    delay (2000)
    %Gigonotosaurus Text
    locate (15, 35)
    put "Wait what happened?" ..
    %Text Line
    drawline (300, 160, 250, 150, 0)
    %How long the Text is on Screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (270, x + 160, 430, x + 160, 186)
    end for
    %Erases Line
    drawline (300, 160, 250, 150, 186)
end gigonotosaurusText

procedure gigonotosaurusExitScene2
    %Delay until it moves
    delay (1000)
    %How much it moves
    for x : 0 .. 250
	%Eraser
	drawfillbox (129 - x, 51, 250 - x, 161, 186)
	%Tail
	drawfillarc (180 - x, 86, 50, 10, 90, 180, 140)
	%Stripes on Tail from Left to Right
	drawline (140 - x, 92, 140 - x, 87, 12)
	drawline (150 - x, 94, 150 - x, 89, 12)
	drawline (160 - x, 95, 160 - x, 90, 12)
	drawline (170 - x, 95, 170 - x, 90, 12)
	%Left Leg
	drawfilloval (180 - x, 71, 10, 20, 141)
	%Right Leg
	drawfilloval (210 - x, 71, 10, 20, 141)
	%Left Foot
	drawfillarc (180 - x, 51, 20, 10, 0, 90, 141)
	%Right Foot
	drawfillarc (210 - x, 51, 20, 10, 0, 90, 141)
	%Top Arm
	drawfillbox (210 - x, 106, 230 - x, 111, 141)
	%Bottom Arm
	drawfillbox (210 - x, 96, 230 - x, 101, 141)
	%Top Claw
	drawfillarc (230 - x, 106, 5, 5, 315, 90, 0)
	%Bottom Claw
	drawfillarc (230 - x, 96, 5, 5, 315, 90, 0)
	%Body
	drawfilloval (195 - x, 111, 25, 30, 140)
	%Teeth
	drawfillarc (240 - x, 131, 7, 7, 50, 100, 0)
	drawfillarc (234 - x, 132, 7, 7, 50, 100, 0)
	drawfillarc (229 - x, 136, 7, 7, 50, 100, 0)
	drawfillarc (237 - x, 132, 3, 3, 230, 280, 0)
	drawfillarc (232 - x, 136, 3, 3, 240, 290, 0)
	drawfillarc (226 - x, 140, 2, 2, 240, 290, 0)
	%Head
	drawfillarc (220 - x, 141, 25, 20, 350, 315, 141)
	%Eye
	drawfilloval (220 - x, 151, 4, 4, 0)
	%Pupil
	drawfilloval (220 - x, 151, 1, 1, 7)
	%How quickly it moves
	delay (30)
    end for
end gigonotosaurusExitScene2

procedure tRexEnterScene2
    %How much it moves
    for x : 0 .. 250
	%Eraser
	drawfillbox (-106 + x, 51, 0 + x, 151, 186)
	%Right Leg
	drawfillbox (-50 + x, 51, -40 + x, 91, 143)
	%Left Leg
	drawfillbox (-70 + x, 51, -60 + x, 81, 143)
	%Tail
	drawfillarc (-75 + x, 81, 30, 8, 180, 360, 141)
	%Body
	drawfillbox (-45 + x, 73, -30 + x, 126, 141)
	drawfillbox (-55 + x, 73, -45 + x, 116, 141)
	drawfillbox (-65 + x, 73, -30 + x, 106, 141)
	drawfillbox (-75 + x, 73, -30 + x, 96, 141)
	%Left Foot
	drawfillbox (-70 + x, 51, -40 + x, 56, 142)
	drawfillarc (-70 + x, 56, 30, 5, 0, 90, 142)
	%Right Foot
	drawfillbox (-50 + x, 51, -20 + x, 56, 142)
	drawfillarc (-50 + x, 56, 30, 5, 0, 90, 142)
	%Bottom Arm
	drawfillbox (-40 + x, 101, -20 + x, 106, 143)
	%Top Arm
	drawfillbox (-30 + x, 111, -20 + x, 116, 143)
	%Bottom Hand Claws
	%Left
	drawfillarc (-18 + x, 97, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (-14 + x, 97, 3, 4, 70, 110, 0)
	%Top Hand Claws
	%Left
	drawfillarc (-18 + x, 107, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (-14 + x, 107, 3, 4, 70, 110, 0)
	%Bottom Hand
	drawfillarc (-20 + x, 111, 10, 5, 0, 90, 143)
	%Top Hand
	drawfillarc (-20 + x, 101, 10, 5, 0, 90, 143)
	%Stripes on Body
	drawline (-45 + x, 126, -35 + x, 116, 12)
	drawline (-55 + x, 116, -45 + x, 106, 12)
	drawline (-65 + x, 106, -55 + x, 96, 12)
	drawline (-75 + x, 96, -65 + x, 86, 12)
	%Teeth
	drawfillarc (-16 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (-11 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (-6 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (-1 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (-8 + x, 131, 5, 5, 200, 260, 0)
	drawfillarc (-4 + x, 129, 5, 5, 200, 260, 0)
	%Head
	drawfillarc (-20 + x, 136, 20, 15, 0, 315, 140)
	%Eye
	drawfilloval (-24 + x, 145, 3, 3, 0)
	%Pupil
	drawfilloval (-24 + x, 145, 1, 1, 7)
	%How Quikly it Moves
	delay (30)
    end for
end tRexEnterScene2

procedure triceratopsEnterScene2
    %How much it moves
    for x : 0 .. 250
	%Eraser
	drawfillbox (650 - x, 51, 741 - x, 111, 186)
	%Tail
	drawfillarc (720 - x, 71, 20, 10, 0, 90, 140)
	%Legs from Left to Right
	drawfillbox (685 - x, 51, 690 - x, 71, 190)
	drawfillbox (695 - x, 51, 700 - x, 71, 190)
	drawfillbox (705 - x, 51, 710 - x, 71, 190)
	drawfillbox (715 - x, 51, 720 - x, 71, 190)
	%Feet from Left to Right
	drawfillarc (687 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (697 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (707 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (717 - x, 51, 2, 5, 0, 180, 0)
	%Body
	drawfilloval (700 - x, 76, 20, 15, 140)
	%Frill
	drawfilloval (670 - x, 81, 20, 20, 190)
	%Head
	drawfilloval (670 - x, 81, 15, 13, 140)
	%Horns from Left to Right
	drawfillarc (680 - x, 106, 5, 15, 250, 290, 0)
	drawfillarc (670 - x, 111, 5, 15, 250, 290, 0)
	drawfillarc (660 - x, 106, 5, 15, 250, 290, 0)
	%Mouth
	drawline (662 - x, 76, 678 - x, 76, 7)
	%Right Eye
	drawfilloval (675 - x, 86, 2, 2, 0)
	%Left Eye
	drawfilloval (665 - x, 86, 2, 2, 0)
	%Right Pupil
	drawfilloval (675 - x, 86, 1, 1, 7)
	%Left Eye
	drawfilloval (665 - x, 86, 1, 1, 7)
	%Left Nostril
	drawfilloval (672 - x, 81, 1, 1, 7)
	%Right Nostril
	drawfilloval (668 - x, 81, 1, 1, 7)
	%How quickly it moves
	delay (30)
    end for
end triceratopsEnterScene2

procedure triceratopsAttacks
    %How long before it starts
    delay (3000)
    %How much it moves
    for x : 0 .. 159
	%Eraser
	drawfillbox (400 - x, 51, 491 - x, 111, 186)
	%Tail
	drawfillarc (470 - x, 71, 20, 10, 0, 90, 140)
	%Legs from Left to Right
	drawfillbox (435 - x, 51, 440 - x, 71, 190)
	drawfillbox (445 - x, 51, 450 - x, 71, 190)
	drawfillbox (455 - x, 51, 460 - x, 71, 190)
	drawfillbox (465 - x, 51, 470 - x, 71, 190)
	%Feet from Left to Right
	drawfillarc (437 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (447 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (457 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (467 - x, 51, 2, 5, 0, 180, 0)
	%Body
	drawfilloval (450 - x, 76, 20, 15, 140)
	%Frill
	drawfilloval (420 - x, 81, 20, 20, 190)
	%Head
	drawfilloval (420 - x, 81, 15, 13, 140)
	%Horns from Left to Right
	drawfillarc (430 - x, 106, 5, 15, 250, 290, 0)
	drawfillarc (420 - x, 111, 5, 15, 250, 290, 0)
	drawfillarc (410 - x, 106, 5, 15, 250, 290, 0)
	%Mouth
	drawline (412 - x, 76, 428 - x, 76, 7)
	%Right Eye
	drawfilloval (425 - x, 86, 2, 2, 0)
	%Left Eye
	drawfilloval (415 - x, 86, 2, 2, 0)
	%Right Pupil
	drawfilloval (425 - x, 86, 1, 1, 7)
	%Left Eye
	drawfilloval (415 - x, 86, 1, 1, 7)
	%Left Nostril
	drawfilloval (422 - x, 81, 1, 1, 7)
	%Right Nostril
	drawfilloval (418 - x, 81, 1, 1, 7)
	%How quickly it moves
	delay (10)
    end for
end triceratopsAttacks

procedure tRexFightsBack
    %How long until the procedure starts
    delay (1000)
    %How much it moves
    for x : 0 .. 160
	%Erase
	drawfillbox (144 + x, 51, 332 + x, 151, 186)
	%Trex
	%Right Leg
	drawfillbox (200 + x, 51, 210 + x, 91, 143)
	%Left Leg
	drawfillbox (180 + x, 51, 190 + x, 81, 143)
	%Tail
	drawfillarc (175 + x, 81, 30, 8, 180, 360, 141)
	%Body
	drawfillbox (205 + x, 73, 220 + x, 126, 141)
	drawfillbox (195 + x, 73, 205 + x, 116, 141)
	drawfillbox (185 + x, 73, 220 + x, 106, 141)
	drawfillbox (175 + x, 73, 220 + x, 96, 141)
	%Left Foot
	drawfillbox (180 + x, 51, 210 + x, 56, 142)
	drawfillarc (180 + x, 56, 30, 5, 0, 90, 142)
	%Right Foot
	drawfillbox (200 + x, 51, 230 + x, 56, 142)
	drawfillarc (200 + x, 56, 30, 5, 0, 90, 142)
	%Bottom Arm
	drawfillbox (210 + x, 101, 230 + x, 106, 143)
	%Top Arm
	drawfillbox (220 + x, 111, 230 + x, 116, 143)
	%Bottom Hand Claws
	%Left
	drawfillarc (232 + x, 97, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (236 + x, 97, 3, 4, 70, 110, 0)
	%Top Hand Claws
	%Left
	drawfillarc (232 + x, 107, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (236 + x, 107, 3, 4, 70, 110, 0)
	%Bottom Hand
	drawfillarc (230 + x, 111, 10, 5, 0, 90, 143)
	%Top Hand
	drawfillarc (230 + x, 101, 10, 5, 0, 90, 143)
	%Stripes on Body
	drawline (205 + x, 126, 215 + x, 116, 12)
	drawline (195 + x, 116, 205 + x, 106, 12)
	drawline (185 + x, 106, 195 + x, 96, 12)
	drawline (175 + x, 96, 185 + x, 86, 12)
	%Teeth
	drawfillarc (234 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (239 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (244 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (249 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (242 + x, 131, 5, 5, 200, 260, 0)
	drawfillarc (246 + x, 129, 5, 5, 200, 260, 0)
	%Head
	drawfillarc (230 + x, 136, 20, 15, 0, 315, 140)
	%Eye
	drawfilloval (226 + x, 145, 3, 3, 0)
	%Pupil
	drawfilloval (226 + x, 145, 1, 1, 7)
	%Triceratops
	%Tail
	drawfillarc (311 + x, 71, 20, 10, 0, 90, 140)
	%Legs from Left to Right
	drawfillbox (276 + x, 51, 281 + x, 71, 190)
	drawfillbox (286 + x, 51, 291 + x, 71, 190)
	drawfillbox (296 + x, 51, 301 + x, 71, 190)
	drawfillbox (306 + x, 51, 311 + x, 71, 190)
	%Feet from Left to Right
	drawfillarc (278 + x, 51, 2, 5, 0, 180, 0)
	drawfillarc (288 + x, 51, 2, 5, 0, 180, 0)
	drawfillarc (298 + x, 51, 2, 5, 0, 180, 0)
	drawfillarc (308 + x, 51, 2, 5, 0, 180, 0)
	%Body
	drawfilloval (291 + x, 76, 20, 15, 140)
	%Frill
	drawfilloval (261 + x, 81, 20, 20, 190)
	%Head
	drawfilloval (261 + x, 81, 15, 13, 140)
	%Horns from Left to Right
	drawfillarc (271 + x, 106, 5, 15, 250, 290, 0)
	drawfillarc (261 + x, 111, 5, 15, 250, 290, 0)
	drawfillarc (251 + x, 106, 5, 15, 250, 290, 0)
	%Mouth
	drawline (253 + x, 76, 269 + x, 76, 7)
	%Right Eye
	drawfilloval (266 + x, 86, 2, 2, 0)
	%Left Eye
	drawfilloval (256 + x, 86, 2, 2, 0)
	%Right Pupil
	drawfilloval (266 + x, 86, 1, 1, 7)
	%Left Eye
	drawfilloval (256 + x, 86, 1, 1, 7)
	%Left Nostril
	drawfilloval (263 + x, 81, 1, 1, 7)
	%Right Nostril
	drawfilloval (259 + x, 81, 1, 1, 7)
	%How quickly it moves
	delay (80)
    end for
end tRexFightsBack

procedure evenFight
    %Moving to the Left
    %How much it moves
    for x : 0 .. 160
	%Erase
	drawfillbox (300 - x, 51, 492 - x, 151, 186)
	%Trex
	%Right Leg
	drawfillbox (360 - x, 51, 370 - x, 91, 143)
	%Left Leg
	drawfillbox (340 - x, 51, 350 - x, 81, 143)
	%Tail
	drawfillarc (335 - x, 81, 30, 8, 180, 360, 141)
	%Body
	drawfillbox (365 - x, 73, 380 - x, 126, 141)
	drawfillbox (355 - x, 73, 365 - x, 116, 141)
	drawfillbox (345 - x, 73, 380 - x, 106, 141)
	drawfillbox (335 - x, 73, 380 - x, 96, 141)
	%Left Foot
	drawfillbox (340 - x, 51, 370 - x, 56, 142)
	drawfillarc (340 - x, 56, 30, 5, 0, 90, 142)
	%Right Foot
	drawfillbox (360 - x, 51, 390 - x, 56, 142)
	drawfillarc (360 - x, 56, 30, 5, 0, 90, 142)
	%Bottom Arm
	drawfillbox (370 - x, 101, 390 - x, 106, 143)
	%Top Arm
	drawfillbox (380 - x, 111, 390 - x, 116, 143)
	%Bottom Hand Claws
	%Left
	drawfillarc (392 - x, 97, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (396 - x, 97, 3, 4, 70, 110, 0)
	%Top Hand Claws
	%Left
	drawfillarc (392 - x, 107, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (396 - x, 107, 3, 4, 70, 110, 0)
	%Bottom Hand
	drawfillarc (390 - x, 111, 10, 5, 0, 90, 143)
	%Top Hand
	drawfillarc (390 - x, 101, 10, 5, 0, 90, 143)
	%Stripes on Body
	drawline (365 - x, 126, 375 - x, 116, 12)
	drawline (355 - x, 116, 365 - x, 106, 12)
	drawline (345 - x, 106, 355 - x, 96, 12)
	drawline (335 - x, 96, 345 - x, 86, 12)
	%Teeth
	drawfillarc (394 - x, 131, 5, 5, 80, 100, 0)
	drawfillarc (399 - x, 131, 5, 5, 80, 100, 0)
	drawfillarc (404 - x, 131, 5, 5, 80, 100, 0)
	drawfillarc (409 - x, 131, 5, 5, 80, 100, 0)
	drawfillarc (402 - x, 131, 5, 5, 200, 260, 0)
	drawfillarc (406 - x, 129, 5, 5, 200, 260, 0)
	%Head
	drawfillarc (390 - x, 136, 20, 15, 0, 315, 140)
	%Eye
	drawfilloval (386 - x, 145, 3, 3, 0)
	%Pupil
	drawfilloval (386 - x, 145, 1, 1, 7)
	%Triceratops
	%Tail
	drawfillarc (471 - x, 71, 20, 10, 0, 90, 140)
	%Legs from Left to Right
	drawfillbox (436 - x, 51, 441 - x, 71, 190)
	drawfillbox (446 - x, 51, 451 - x, 71, 190)
	drawfillbox (456 - x, 51, 461 - x, 71, 190)
	drawfillbox (466 - x, 51, 471 - x, 71, 190)
	%Feet from Left to Right
	drawfillarc (438 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (448 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (458 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (468 - x, 51, 2, 5, 0, 180, 0)
	%Body
	drawfilloval (451 - x, 76, 20, 15, 140)
	%Frill
	drawfilloval (421 - x, 81, 20, 20, 190)
	%Head
	drawfilloval (421 - x, 81, 15, 13, 140)
	%Horns from Left to Right
	drawfillarc (431 - x, 106, 5, 15, 250, 290, 0)
	drawfillarc (421 - x, 111, 5, 15, 250, 290, 0)
	drawfillarc (411 - x, 106, 5, 15, 250, 290, 0)
	%Mouth
	drawline (413 - x, 76, 429 - x, 76, 7)
	%Right Eye
	drawfilloval (426 - x, 86, 2, 2, 0)
	%Left Eye
	drawfilloval (416 - x, 86, 2, 2, 0)
	%Right Pupil
	drawfilloval (426 - x, 86, 1, 1, 7)
	%Left Eye
	drawfilloval (416 - x, 86, 1, 1, 7)
	%Left Nostril
	drawfilloval (423 - x, 81, 1, 1, 7)
	%Right Nostril
	drawfilloval (419 - x, 81, 1, 1, 7)
	%How quickly it moves
	delay (80)
    end for
    %Moving to the right
    %How much it moves
    for x : 0 .. 160
	%Erase
	drawfillbox (144 + x, 51, 332 + x, 151, 186)
	%Trex
	%Right Leg
	drawfillbox (200 + x, 51, 210 + x, 91, 143)
	%Left Leg
	drawfillbox (180 + x, 51, 190 + x, 81, 143)
	%Tail
	drawfillarc (175 + x, 81, 30, 8, 180, 360, 141)
	%Body
	drawfillbox (205 + x, 73, 220 + x, 126, 141)
	drawfillbox (195 + x, 73, 205 + x, 116, 141)
	drawfillbox (185 + x, 73, 220 + x, 106, 141)
	drawfillbox (175 + x, 73, 220 + x, 96, 141)
	%Left Foot
	drawfillbox (180 + x, 51, 210 + x, 56, 142)
	drawfillarc (180 + x, 56, 30, 5, 0, 90, 142)
	%Right Foot
	drawfillbox (200 + x, 51, 230 + x, 56, 142)
	drawfillarc (200 + x, 56, 30, 5, 0, 90, 142)
	%Bottom Arm
	drawfillbox (210 + x, 101, 230 + x, 106, 143)
	%Top Arm
	drawfillbox (220 + x, 111, 230 + x, 116, 143)
	%Bottom Hand Claws
	%Left
	drawfillarc (232 + x, 97, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (236 + x, 97, 3, 4, 70, 110, 0)
	%Top Hand Claws
	%Left
	drawfillarc (232 + x, 107, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (236 + x, 107, 3, 4, 70, 110, 0)
	%Bottom Hand
	drawfillarc (230 + x, 111, 10, 5, 0, 90, 143)
	%Top Hand
	drawfillarc (230 + x, 101, 10, 5, 0, 90, 143)
	%Stripes on Body
	drawline (205 + x, 126, 215 + x, 116, 12)
	drawline (195 + x, 116, 205 + x, 106, 12)
	drawline (185 + x, 106, 195 + x, 96, 12)
	drawline (175 + x, 96, 185 + x, 86, 12)
	%Teeth
	drawfillarc (234 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (239 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (244 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (249 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (242 + x, 131, 5, 5, 200, 260, 0)
	drawfillarc (246 + x, 129, 5, 5, 200, 260, 0)
	%Head
	drawfillarc (230 + x, 136, 20, 15, 0, 315, 140)
	%Eye
	drawfilloval (226 + x, 145, 3, 3, 0)
	%Pupil
	drawfilloval (226 + x, 145, 1, 1, 7)
	%Triceratops
	%Tail
	drawfillarc (311 + x, 71, 20, 10, 0, 90, 140)
	%Legs from Left to Right
	drawfillbox (276 + x, 51, 281 + x, 71, 190)
	drawfillbox (286 + x, 51, 291 + x, 71, 190)
	drawfillbox (296 + x, 51, 301 + x, 71, 190)
	drawfillbox (306 + x, 51, 311 + x, 71, 190)
	%Feet from Left to Right
	drawfillarc (278 + x, 51, 2, 5, 0, 180, 0)
	drawfillarc (288 + x, 51, 2, 5, 0, 180, 0)
	drawfillarc (298 + x, 51, 2, 5, 0, 180, 0)
	drawfillarc (308 + x, 51, 2, 5, 0, 180, 0)
	%Body
	drawfilloval (291 + x, 76, 20, 15, 140)
	%Frill
	drawfilloval (261 + x, 81, 20, 20, 190)
	%Head
	drawfilloval (261 + x, 81, 15, 13, 140)
	%Horns from Left to Right
	drawfillarc (271 + x, 106, 5, 15, 250, 290, 0)
	drawfillarc (261 + x, 111, 5, 15, 250, 290, 0)
	drawfillarc (251 + x, 106, 5, 15, 250, 290, 0)
	%Mouth
	drawline (253 + x, 76, 269 + x, 76, 7)
	%Right Eye
	drawfilloval (266 + x, 86, 2, 2, 0)
	%Left Eye
	drawfilloval (256 + x, 86, 2, 2, 0)
	%Right Pupil
	drawfilloval (266 + x, 86, 1, 1, 7)
	%Left Eye
	drawfilloval (256 + x, 86, 1, 1, 7)
	%Left Nostril
	drawfilloval (263 + x, 81, 1, 1, 7)
	%Right Nostril
	drawfilloval (259 + x, 81, 1, 1, 7)
	%How quickly it moves
	delay (80)
    end for
end evenFight

procedure triceratopsFallsOut
    %Time before the procedure starts
    delay (1000)
    %How much it moves
    for x : 0 .. 100
	%Erase
	drawfillbox (400 + x, 51, 491 + x, 111, 186)
	%Tail
	drawfillarc (471 + x, 71, 20, 10, 0, 90, 140)
	%Legs from Left to Right
	drawfillbox (436 + x, 51, 441 + x, 71, 190)
	drawfillbox (446 + x, 51, 451 + x, 71, 190)
	drawfillbox (456 + x, 51, 461 + x, 71, 190)
	drawfillbox (466 + x, 51, 471 + x, 71, 190)
	%Feet from Left to Right
	drawfillarc (438 + x, 51, 2, 5, 0, 180, 0)
	drawfillarc (448 + x, 51, 2, 5, 0, 180, 0)
	drawfillarc (458 + x, 51, 2, 5, 0, 180, 0)
	drawfillarc (468 + x, 51, 2, 5, 0, 180, 0)
	%Body
	drawfilloval (451 + x, 76, 20, 15, 140)
	%Frill
	drawfilloval (421 + x, 81, 20, 20, 190)
	%Head
	drawfilloval (421 + x, 81, 15, 13, 140)
	%Horns from Left to Right
	drawfillarc (431 + x, 106, 5, 15, 250, 290, 0)
	drawfillarc (421 + x, 111, 5, 15, 250, 290, 0)
	drawfillarc (411 + x, 106, 5, 15, 250, 290, 0)
	%Mouth
	drawline (413 + x, 76, 429 + x, 76, 7)
	%Right Eye
	drawfilloval (426 + x, 86, 2, 2, 0)
	%Left Eye
	drawfilloval (416 + x, 86, 2, 2, 0)
	%Right Pupil
	drawfilloval (426 + x, 86, 1, 1, 7)
	%Left Eye
	drawfilloval (416 + x, 86, 1, 1, 7)
	%Left Nostril
	drawfilloval (423 + x, 81, 1, 1, 7)
	%Right Nostril
	drawfilloval (419 + x, 81, 1, 1, 7)
	%How quickly it moves
	delay (20)
    end for
end triceratopsFallsOut

procedure triceratopsText
    %Text
    locate (15, 50)
    put "How could I lose..." ..
    %Text Line
    drawline (460, 160, 490, 100, 0)
    %How long the text is there
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (390, x + 160, 550, x + 160, 186)
    end for
    %Erases Line
    drawline (460, 160, 490, 100, 186)
end triceratopsText

procedure triceratopsExitScene2
    %How much it moves
    for x : 0 .. 140
	%Erase
	drawfillbox (500 + x, 51, 551 + x, 111, 186)
	%Tail
	drawfillarc (571 + x, 71, 20, 10, 0, 90, 140)
	%Legs from Left to Right
	drawfillbox (536 + x, 51, 541 + x, 71, 190)
	drawfillbox (546 + x, 51, 551 + x, 71, 190)
	drawfillbox (556 + x, 51, 561 + x, 71, 190)
	drawfillbox (566 + x, 51, 571 + x, 71, 190)
	%Feet from Left to Right
	drawfillarc (538 + x, 51, 2, 5, 0, 180, 0)
	drawfillarc (548 + x, 51, 2, 5, 0, 180, 0)
	drawfillarc (558 + x, 51, 2, 5, 0, 180, 0)
	drawfillarc (568 + x, 51, 2, 5, 0, 180, 0)
	%Body
	drawfilloval (551 + x, 76, 20, 15, 140)
	%Frill
	drawfilloval (521 + x, 81, 20, 20, 190)
	%Head
	drawfilloval (521 + x, 81, 15, 13, 140)
	%Horns from Left to Right
	drawfillarc (531 + x, 106, 5, 15, 250, 290, 0)
	drawfillarc (521 + x, 111, 5, 15, 250, 290, 0)
	drawfillarc (511 + x, 106, 5, 15, 250, 290, 0)
	%Mouth
	drawline (513 + x, 76, 529 + x, 76, 7)
	%Right Eye
	drawfilloval (526 + x, 86, 2, 2, 0)
	%Left Eye
	drawfilloval (516 + x, 86, 2, 2, 0)
	%Right Pupil
	drawfilloval (526 + x, 86, 1, 1, 7)
	%Left Eye
	drawfilloval (516 + x, 86, 1, 1, 7)
	%Left Nostril
	drawfilloval (523 + x, 81, 1, 1, 7)
	%Right Nostril
	drawfilloval (519 + x, 81, 1, 1, 7)
	%How quickly it moves
	delay (20)
    end for
end triceratopsExitScene2

procedure tRexExitScene2
    %How much it moves
    for x : 0 .. 340
	%Erase
	drawfillbox (304 + x, 51, 410 + x, 151, 186)
	%Right Leg
	drawfillbox (360 + x, 51, 370 + x, 91, 143)
	%Left Leg
	drawfillbox (340 + x, 51, 350 + x, 81, 143)
	%Tail
	drawfillarc (335 + x, 81, 30, 8, 180, 360, 141)
	%Body
	drawfillbox (365 + x, 73, 380 + x, 126, 141)
	drawfillbox (355 + x, 73, 365 + x, 116, 141)
	drawfillbox (345 + x, 73, 380 + x, 106, 141)
	drawfillbox (335 + x, 73, 380 + x, 96, 141)
	%Left Foot
	drawfillbox (340 + x, 51, 370 + x, 56, 142)
	drawfillarc (340 + x, 56, 30, 5, 0, 90, 142)
	%Right Foot
	drawfillbox (360 + x, 51, 390 + x, 56, 142)
	drawfillarc (360 + x, 56, 30, 5, 0, 90, 142)
	%Bottom Arm
	drawfillbox (370 + x, 101, 390 + x, 106, 143)
	%Top Arm
	drawfillbox (380 + x, 111, 390 + x, 116, 143)
	%Bottom Hand Claws
	%Left
	drawfillarc (392 + x, 97, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (396 + x, 97, 3, 4, 70, 110, 0)
	%Top Hand Claws
	%Left
	drawfillarc (392 + x, 107, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (396 + x, 107, 3, 4, 70, 110, 0)
	%Bottom Hand
	drawfillarc (390 + x, 111, 10, 5, 0, 90, 143)
	%Top Hand
	drawfillarc (390 + x, 101, 10, 5, 0, 90, 143)
	%Stripes on Body
	drawline (365 + x, 126, 375 + x, 116, 12)
	drawline (355 + x, 116, 365 + x, 106, 12)
	drawline (345 + x, 106, 355 + x, 96, 12)
	drawline (335 + x, 96, 345 + x, 86, 12)
	%Teeth
	drawfillarc (394 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (399 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (404 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (409 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (402 + x, 131, 5, 5, 200, 260, 0)
	drawfillarc (406 + x, 129, 5, 5, 200, 260, 0)
	%Head
	drawfillarc (390 + x, 136, 20, 15, 0, 315, 140)
	%Eye
	drawfilloval (386 + x, 145, 3, 3, 0)
	%Pupil
	drawfilloval (386 + x, 145, 1, 1, 7)
	%How quickly it moves
	delay (30)
    end for
end tRexExitScene2

procedure carnivoresEnterScene2
    %How long before the procedure begins
    delay (3000)
    %How much it moves
    for x : 0 .. 300
	%Eraser
	drawfillbox (-292 + x, 51, 1 + x, 161, 186)
	%Trex
	%Right Leg
	drawfillbox (-50 + x, 51, -40 + x, 91, 143)
	%Left Leg
	drawfillbox (-70 + x, 51, -60 + x, 81, 143)
	%Tail
	drawfillarc (-75 + x, 81, 30, 8, 180, 360, 141)
	%Body
	drawfillbox (-45 + x, 73, -30 + x, 126, 141)
	drawfillbox (-55 + x, 73, -45 + x, 116, 141)
	drawfillbox (-65 + x, 73, -30 + x, 106, 141)
	drawfillbox (-75 + x, 73, -30 + x, 96, 141)
	%Left Foot
	drawfillbox (-70 + x, 51, -40 + x, 56, 142)
	drawfillarc (-70 + x, 56, 30, 5, 0, 90, 142)
	%Right Foot
	drawfillbox (-50 + x, 51, -20 + x, 56, 142)
	drawfillarc (-50 + x, 56, 30, 5, 0, 90, 142)
	%Bottom Arm
	drawfillbox (-40 + x, 101, -20 + x, 106, 143)
	%Top Arm
	drawfillbox (-30 + x, 111, -20 + x, 116, 143)
	%Bottom Hand Claws
	%Left
	drawfillarc (-18 + x, 97, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (-14 + x, 97, 3, 4, 70, 110, 0)
	%Top Hand Claws
	%Left
	drawfillarc (-18 + x, 107, 3, 4, 70, 110, 0)
	%Right
	drawfillarc (-14 + x, 107, 3, 4, 70, 110, 0)
	%Bottom Hand
	drawfillarc (-20 + x, 111, 10, 5, 0, 90, 143)
	%Top Hand
	drawfillarc (-20 + x, 101, 10, 5, 0, 90, 143)
	%Stripes on Body
	drawline (-45 + x, 126, -35 + x, 116, 12)
	drawline (-55 + x, 116, -45 + x, 106, 12)
	drawline (-65 + x, 106, -55 + x, 96, 12)
	drawline (-75 + x, 96, -65 + x, 86, 12)
	%Teeth
	drawfillarc (-16 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (-11 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (-6 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (-1 + x, 131, 5, 5, 80, 100, 0)
	drawfillarc (-8 + x, 131, 5, 5, 200, 260, 0)
	drawfillarc (-4 + x, 129, 5, 5, 200, 260, 0)
	%Head
	drawfillarc (-20 + x, 136, 20, 15, 0, 315, 140)
	%Eye
	drawfilloval (-24 + x, 145, 3, 3, 0)
	%Pupil
	drawfilloval (-24 + x, 145, 1, 1, 7)
	%Gigonotosaurus
	%Tail
	drawfillarc (-177 + x, 86, 50, 10, 90, 180, 140)
	%Stripes on Tail from Left to Right
	drawline (-217 + x, 92, -217 + x, 87, 12)
	drawline (-207 + x, 94, -207 + x, 89, 12)
	drawline (-197 + x, 95, -197 + x, 90, 12)
	drawline (-187 + x, 95, -187 + x, 90, 12)
	%Left Leg
	drawfilloval (-177 + x, 71, 10, 20, 141)
	%Right Leg
	drawfilloval (-147 + x, 71, 10, 20, 141)
	%Left Foot
	drawfillarc (-177 + x, 51, 20, 10, 0, 90, 141)
	%Right Foot
	drawfillarc (-147 + x, 51, 20, 10, 0, 90, 141)
	%Top Arm
	drawfillbox (-147 + x, 106, -127 + x, 111, 141)
	%Bottom Arm
	drawfillbox (-147 + x, 96, -127 + x, 101, 141)
	%Top Claw
	drawfillarc (-127 + x, 106, 5, 5, 315, 90, 0)
	%Bottom Claw
	drawfillarc (-127 + x, 96, 5, 5, 315, 90, 0)
	%Body
	drawfilloval (-162 + x, 111, 25, 30, 140)
	%Teeth
	drawfillarc (-117 + x, 131, 7, 7, 50, 100, 0)
	drawfillarc (-123 + x, 132, 7, 7, 50, 100, 0)
	drawfillarc (-128 + x, 136, 7, 7, 50, 100, 0)
	drawfillarc (-120 + x, 132, 3, 3, 230, 280, 0)
	drawfillarc (-125 + x, 136, 3, 3, 240, 290, 0)
	drawfillarc (-131 + x, 140, 2, 2, 240, 290, 0)
	%Head
	drawfillarc (-137 + x, 141, 25, 20, 350, 315, 141)
	%Eye
	drawfilloval (-137 + x, 151, 4, 4, 0)
	%Pupil
	drawfilloval (-137 + x, 151, 1, 1, 7)
	%Troodon
	%Tail
	drawfillarc (-265 + x, 61, 27, 5, 90, 180, 43)
	%Claw on Left Foot
	drawfillarc (-257 + x, 53, 2, 2, 315, 180, 0)
	%Claw on Right Foot
	drawfillarc (-243 + x, 53, 2, 2, 315, 180, 0)
	%Left Leg
	drawfillbox (-265 + x, 51, -259 + x, 61, 44)
	%Right Leg
	drawfillbox (-251 + x, 51, -245 + x, 61, 44)
	%Waste
	drawfillbox (-265 + x, 61, -245 + x, 73, 43)
	%Neck
	drawfillbox (-258 + x, 91, -251 + x, 96, 43)
	%Top Arm/Claw
	drawfillarc (-244 + x, 81, 3, 3, 315, 180, 0)
	%Bottom Arm/Claw
	drawfillarc (-244 + x, 74, 3, 3, 315, 180, 0)
	%Body
	drawfilloval (-255 + x, 77, 10, 14, 43)
	%Head
	drawfillarc (-250 + x, 99, 10, 7, 0, 315, 44)
	%Eye
	drawfilloval (-254 + x, 101, 3, 3, 0)
	%Pupil
	drawfilloval (-254 + x, 101, 1, 1, 7)
	%Tail of the Feather
	drawline (-258 + x, 105, -261 + x, 109, 141)
	%Feather
	drawfillarc (-261 + x, 107, 8, 8, 100, 150, 12)
	%Stripe on the Feather
	Draw.ThickLine (-263 + x, 109, -265 + x, 111, 2, 7)
	%How Fast they Exit
	delay (50)
    end for
end carnivoresEnterScene2

procedure herbivoresEnterScene2
    %How much it moves
    for x : 0 .. 300
	%Erase
	drawfillbox (639 - x, 51, 921 - x, 151, 186)
	%Triceratops
	%Tail
	drawfillarc (710 - x, 71, 20, 10, 0, 91, 140)
	%Legs from Left to Right
	drawfillbox (675 - x, 51, 680 - x, 71, 190)
	drawfillbox (685 - x, 51, 690 - x, 71, 190)
	drawfillbox (695 - x, 51, 700 - x, 71, 190)
	drawfillbox (705 - x, 51, 710 - x, 71, 190)
	%Feet from Left to Right
	drawfillarc (677 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (687 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (697 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (707 - x, 51, 2, 5, 0, 180, 0)
	%Body
	drawfilloval (690 - x, 76, 20, 15, 140)
	%Frill
	drawfilloval (660 - x, 81, 20, 20, 190)
	%Head
	drawfilloval (660 - x, 81, 15, 13, 140)
	%Horns from Left to Right
	drawfillarc (670 - x, 106, 5, 15, 250, 290, 0)
	drawfillarc (660 - x, 111, 5, 15, 250, 290, 0)
	drawfillarc (650 - x, 106, 5, 15, 250, 290, 0)
	%Mouth
	drawline (652 - x, 76, 668 - x, 76, 7)
	%Right Eye
	drawfilloval (665 - x, 86, 2, 2, 0)
	%Left Eye
	drawfilloval (655 - x, 86, 2, 2, 0)
	%Right Pupil
	drawfilloval (665 - x, 86, 1, 1, 7)
	%Left Eye
	drawfilloval (655 - x, 86, 1, 1, 7)
	%Left Nostril
	drawfilloval (662 - x, 81, 1, 1, 7)
	%Right Nostril
	drawfilloval (658 - x, 81, 1, 1, 7)
	%Brachiosaurus
	%Legs from Right to Left
	drawfillbox (770 - x, 51, 775 - x, 81, 2)
	drawfillbox (760 - x, 51, 765 - x, 81, 2)
	drawfillbox (750 - x, 51, 755 - x, 81, 2)
	drawfillbox (740 - x, 51, 745 - x, 81, 2)
	%Feet from Right to Left
	drawfillarc (772 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (762 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (752 - x, 51, 2, 5, 0, 180, 0)
	drawfillarc (742 - x, 51, 2, 5, 0, 180, 0)
	%Tail
	drawfillarc (770 - x, 86, 50, 5, 0, 90, 190)
	%Body
	drawfilloval (757 - x, 86, 20, 15, 190)
	%Neck
	drawfillbox (740 - x, 91, 750 - x, 131, 190)
	%Bump on the Head
	drawfillarc (745 - x, 137, 5, 5, 270, 180, 139)
	%Stripes on the Bump from Left to Right
	drawline (743 - x, 137, 743 - x, 141, 76)
	drawline (745 - x, 137, 745 - x, 142, 76)
	drawline (747 - x, 137, 747 - x, 141, 76)
	%Head
	drawfilloval (740 - x, 131, 10, 7, 2)
	%Mouth
	drawline (732 - x, 127, 739 - x, 130, 7)
	%Eye
	drawfilloval (745 - x, 133, 2, 2, 0)
	%Pupil
	drawfilloval (745 - x, 133, 1, 1, 7)
	%Nostril
	drawfilloval (732 - x, 133, 1, 1, 7)
	%Diplodocus
	%Legs from Left to Right
	drawfillbox (853 - x, 51, 858 - x, 81, 90)
	drawfillbox (863 - x, 51, 868 - x, 81, 90)
	drawfillbox (873 - x, 51, 878 - x, 81, 90)
	drawfillbox (883 - x, 51, 888 - x, 81, 90)
	%Feet from Left to Right
	drawfillarc (855 - x, 51, 3, 3, 0, 180, 141)
	drawfillarc (865 - x, 51, 3, 3, 0, 180, 141)
	drawfillarc (875 - x, 51, 3, 3, 0, 180, 141)
	drawfillarc (885 - x, 51, 3, 3, 0, 180, 141)
	%Body
	drawfilloval (870 - x, 91, 30, 20, 93)
	%Tail
	drawfilloval (905 - x, 91, 15, 5, 93)
	drawfillarc (915 - x, 91, 5, 30, 270, 0, 93)
	%Neck
	drawfillbox (840 - x, 91, 850 - x, 131, 93)
	%Head
	drawfillbox (830 - x, 131, 850 - x, 151, 90)
	%Beak
	drawfillarc (830 - x, 136, 10, 5, 90, 270, 90)
	%Mouth
	drawline (820 - x, 136, 830 - x, 136, 7)
	%Eye
	drawfilloval (835 - x, 146, 3, 3, 0)
	%Pupil
	drawfilloval (835 - x, 146, 1, 1, 7)
	%How Quickly they Move
	delay (50)
    end for
end herbivoresEnterScene2

procedure congratulations
    %Triceratops Text
    locate (14, 35)
    put "Congratulations on the win..." ..
    %TextLine
    drawline (320, 180, 340, 100, 0)
    %Time it's on screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (270, x + 175, 510, x + 175, 186)
    end for
    %Erases Line
    drawline (320, 180, 340, 100, 186)
    %Trex Text
    locate (14, 15)
    put "If you can't walk the walk!" ..
    %Text Line
    drawline (320, 180, 300, 150, 0)
    %How long it's on screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (110, x + 175, 330, x + 175, 186)
    end for
    %Erases Line
    drawline (320, 180, 300, 150, 186)
    %Gigonotosaurus Text
    locate (14, 10)
    put "You shouldn't talk the talk!" ..
    %Text Line
    drawline (220, 180, 200, 140, 0)
    %How long it's on screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (70, x + 175, 300, x + 175, 186)
    end for
    %Erases Line
    drawline (220, 180, 200, 140, 186)
    %Troodon Text
    locate (14, 10)
    put "Yeah!!!" ..
    %Text Line
    drawline (100, 180, 80, 130, 0)
    %How lone it's on screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (70, x + 175, 130, x + 175, 186)
    end for
    %Erases Line
    drawline (100, 180, 80, 130, 186)
    %Brachiosaurus Text
    locate (14, 30)
    put "You shouldn't be talking BUD!" ..
    %Text Line
    drawline (340, 180, 420, 130, 0)
    %How long it's on screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (230, x + 175, 470, x + 175, 186)
    end for
    %Erases Line
    drawline (340, 180, 420, 130, 186)
    %Diplodocus Text
    locate (14, 55)
    put "Yeah Troodon!" ..
    %Text Line
    drawline (500, 180, 520, 150, 0)
    %How long it's on screen
    delay (3000)
    %Erases Text
    for x : 0 .. 17
	drawline (430, x + 175, 540, x + 175, 186)
    end for
    %Erases Line
    drawline (500, 180, 520, 150, 186)
end congratulations

procedure theEnd
    locate (12, 37)
    put "The End" ..
end theEnd

%Main Program
background1
intro
triceratopsEnterScene1
brachiosaurusEnterScene1
diplodocusEnterScene1
herbivoreText
tRexEnterScene1
gigonotosaurusEnterScene1
troodonEnterScene1
carnivoresText
herbivoreResponse
carnivoresExit
herbivoresExit
background2
intro2
troodonEnterScene2
brachiosaurusEnterScene2
troodonAttacks
brachiosaurusFightsBack
brachiosaurusText
brachiosaurusExitScene2
diplodocusEnterScene2
gigonotosaurusEnterScene2
diplodocusAttacks
diplodocusFails
gigonotosaurusText
gigonotosaurusExitScene2
tRexEnterScene2
triceratopsEnterScene2
triceratopsAttacks
tRexFightsBack
evenFight
triceratopsFallsOut
triceratopsText
triceratopsExitScene2
tRexExitScene2
carnivoresEnterScene2
herbivoresEnterScene2
congratulations
theEnd
%End of Main Program
