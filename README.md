# state_management

A manual state management sample

## Explanation

I created this project during a lecture to demonstrate manual state management, why it's difficult, things that need to happen and how one could do them. 

This is meant to be a motivator for using a state management solution and reminds you things that such a solution is supposed to accomplish.

Note that we could use `AnimatedBuilder` instead of `.addListener()`/`.removeListener()` pairs but the end result would be the same. 

One thing that we did not solve was that `RecordPage` does not update after you edit a record and go back. 
