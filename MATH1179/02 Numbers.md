[[MATH1179|Stop reading?]]
# Numbers, a primitive data storing method
Well, remember when I told you that [[man set|set]] were the smallest? Scratch that, we are going even smaller now. Not like I care, anyways.

Oh, and I am not going to bother you with the nonsense of explaining what Intergers are, its difference to Natural numbers, Real numbers, and all that. We are here for the cool stuff. 
# Estimation for the simple soul
Estimation is used when one wants to simplify the data received after doing some calculating. Simple, right? Instead of calculating the small stuff, you just round out the answer and skip most of the work.

...Naturally this means this method is not used at all unless prompted. But oh well, convenience is truly a desirable thing, after all.
# One last thing before we get to the "cool stuff": Significant Figures
This one is actually quite complicated, so strap in, we are going to have to do some actual math. According to the Writer, it goes something like this:
- If the number does not have any ".", the number of significant figures is the number of non-0 numbers before the string of 0s. Take 6740000 for example, the number of significant figures is 3, instead of 7, because you could write it as 674 $times$ 10 ^ 4 instead
- If the number has a ".", things get more complicated. If the number starts with 0, any number of 0s before the actual non-0s can be ignored. For example: 0,004 has 1 sf (ill use abbreviation from now sorry readers) while 0,705 has 3 sf. If the number starts with things not 0 though... the number after must be respected, for instance 6,8000 still has 5sf despite everyone reading knowing full well the line of 0s can be deleted to save space
Phew, that was a load of bullshit that I don't want to remember, ever.

Not like I have a choice though.
# The cool stuff: base-n boards
Have you ever heard of the term base-n? Base-2, Base-16, Base-8? Now heres the kicker, you can just look at one table of mine (totally didnt stole from the internet) to know all you need to know about it:

| 2^8 | 2^7 | 2^6 | 2^5 | 2^4 | 2^3 | 2^2 | 2^1 | 2^0 | Result |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ------ |
| 0   | 0   | 0   | 0   | 0   | 0   | 1   | 0   | 1   | 5      |
| 0   | 0   | 1   | 1   | 0   | 0   | 1   | 1   | 0   | 100    |
A base-n table functions like that. No matter what others say, the fact that the numbers turn from a curious string of 0s and 1s such as 001100110 to something readable like 100 gives a great feeling. Just, maybe remember to bring a calculator to calculate this behemoth easier.