This is a short documentation on how to use the strumline

Okay, I opened a song. Why are the strums appearing? I want them to disappear!

There are two ways to solve this issue:

If you want the strum not to be visible only in the selected song, you will have to get into a song folder
and add a new text file "strumData.txt" (CASE SENSITIVE)

Or, if you want it to not show anywhere in the game, and only want it to show up in a specific song, you will have to
place "strumData.txt" into yourmod/data folder.

THE MOST IMPORTANT THING FOR THE STRUM TO WORK IS, to add the following text in strumData.txt:

alreadyVisible:false

(Since I'm not the best at explaining things, I'll include an additional "strumline_examples" folder in the zip file to try and clear up
misunderstandings)

You can also set this to true. When it's true, you can make an additional option called "animationType", it's three
key arguments are "middle", "left" and "right" (which determines on which side is the strum visible on)

However, if you've set this value to false, you can use a chart editor event called "Show Strums"
(instructions in the event)

Now, to add 3rd strum notes, you will have to select a new notetype called "Third Player Strum"
(which converts the note to go into the third player strum)

Another new addition is, strum scripts (i just came up with the name lmao)

In order to use them, add a new script (it can be in the scripts folder or in your song folder)
but the important this is to name it as "strumline.lua" (CASE SENSITIVE)

In the lua file, you can add a function called "strumNoteHit".
It works similarly to opponentNoteHit, but it's parameters are "id", "direction" and "isSustainNote"

Thats all you need to know until I make a video tutorial.

Have Fun using it!
- BombasticTom