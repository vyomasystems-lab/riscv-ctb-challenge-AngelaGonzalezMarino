**Error:** The test is stuck and never finishes 

The problem is that the loop does not have any control over how many iterations need to be done, so it keeps looping over unwanted data.

The solution is to track the number of iterations (3) and get out of the loop if all iterations have successfully completed.

![alt text](ch1-loop.png)