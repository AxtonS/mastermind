# mastermind
mastermind game built in ruby  

## finished  
-was tricky to figure out a way to have two different array comparison techniques that don't interfere with each other but work with same information  
-going to update the game so the computer player has intelligence to it's guesses as opposed to random or cheater guesses  

## plan  

-create a random code of 4 positions with one of six possible colors in each position, hidden from the player  
-player gets 12 turns to guess the secret code  
-player inputs a code, compares the code and returns how many color and positions are correct, and how many colors but not positions are correct  
-compare the players code and position using each with index storing both codes as arrays  
-let player decide if they want to enter a code to guess  

## progress  

-built the random code method using a times loop to sample from array of 6 colors
-moved both empty array and colors variable assignment into module separate module   
-built the input functionality for submitting a code, checks for valid inputs and pushes each color to array one at a time  
-built the compare method used to determine how many colors match and how many are in right position  
-built the game logic with victory and 12 round loss conditions  
-changed the game flow to allow for player to enter their own secret code or let computer pick  
-added computer player method that simply guesses randomly against the players code  
-added computer player difficulty options, worst option uses the random guess method, best option cheats and guesses immediately  
