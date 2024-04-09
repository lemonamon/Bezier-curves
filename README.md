This project contains 2 objects: oRenderer and oPoint

- oPoint functions as a key point of the bezier curve. All it does on its own is get moved around with the mouse

- oRenderer is where the main code is stored:
  
  - The create event creates a struct holding 4 separate points, mark as P0 through P3. These are all instances of oPoint.

  - The curve itself is drawn in the DrawGUI event.
    - First, red lines are drawn between the points to showcase borders.

    - After that, 3 main variables are set up:
      - t : Ranges between 0 and 1. Used for interpolating
      - res : The resolution of the curve. Amount that t is incremented by on each iteration of the while loop. Must be less than 0.5 for code to function correctly.
      - prevPoint : Struct holding the x and y coordinates of the previously calculated point. Line is drawn from current point to this point.

    - Then, the main drawing code occurs in a while loop which loops until t is greater than 1:
      - The x and y coordinates are calculated using the following formula: B = ((1-t)^3)P0 + 3((1-t)^2)(t)P1 + 3(1-t)(t^2)P2 + (t^3)P3
      - If the previous point exists, a line is drawn from the newly found x and y to the previous point's x and y.
      - prevNode is set to hold the newly calculated x and y
      - t is incremented by res

pretty simple stuff for a pretty simple project ^^
