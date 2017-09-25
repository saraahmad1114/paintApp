# paintApp
Simple Paint App 


This is a simple Paint App, that allows the user to select from eight colors and draw on the imageview. 

The default color will be set to black and when the user taps the color buttons the color will change, allowing them to draw with that color. 

The clear button on the top allows the imageview to become clear. 

There are three essential functions that allows this app to operate. The "touchesBegan" function informs the view that touches happened. By using the first element in the touches array we are able to compare and see what happened on the screen, and where to begin. 

The second important function is the "touchesMoved" function, this function will inform the view if more than one touch has occurred, thereby allowing for a line to be drawn on the view. 

The third vital function is the "touchesEnded" function which will allow the view to know that "touches" have stopped, therefore the drawing line will end. 

The "drawOnDrawingPad" function will define the point that you are using to draw. 
