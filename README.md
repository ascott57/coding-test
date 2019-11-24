# coding-test
ClearScore coding test

Assumptions:
============

1. JSON elements to be rendered: score / MaxScoreValue (not specified);
   used Int? to cpture "<null>" values when decoding

2. Progress Bar: shows score relative to max value (which is not really
   'progress' but seems accurate from the values depicted

3. Avoid frameworks better when possible; used URLSession instead of a 
   3d-party framework such as AlamoFire

4. Did not get arround to gradient progress bar due to time restrictions

5. Please see comments in file headers for additional remarks

6. Other TODO items include:

   - animate the text display in the label in sync with the progress bar
   - surface more explanatory comms errors via Alerts
   
