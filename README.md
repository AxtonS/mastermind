# mastermind
mastermind game built in ruby  

## plan  

-create a random code of 4 positions with one of six possible colors in each position, hidden from the player  
-player gets 12 turns to guess the secret code  
-player inputs a code, compares the code and returns how many color and positions are correct, and how many colors but not positions are correct  
-compare the players code and position using each with index storing both codes as arrays  

## progress  

-built the random code method using a times loop to sample from array of 6 colors
-moved both empty array and colors variable assignment into module separate module   
-Built the input functionality for submitting a code, checks for valid inputs and pushes each color to array one at a time