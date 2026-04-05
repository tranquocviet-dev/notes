# Vectors, the directionful measurement method
Unlike every other kind of measurement forms, such as speed or length, Vectors combine both magnitude and direction. It is a deceptively powerful method, able to transform itself freely across different starting positions, due to not being bound to one by default.

There are two kinds of vectors, as well. The aforementioned free vectors, not bound to a start, and a positional vector, bound to one. In fact, this difference can be seen with how we reference the positioning of various moving objects across different mediums, such as for free vectors "go left 50m", while a positional vector description is something like "behind you by 2m". Another case worth noting is when chess players use Letters to describe moves, or coordinates for soldiers with a map.

# Math with vectors
Oh boy, this is where the hard part starts. Vectors are mathematical entities, after all. Of course there are ways people will use to try and calculate more vectors. The way one combines and subtract two vectors are simple enough, they just need to combine or subtract their individual vector properties.

The same could not be said, however, for multiplication. As far as I know, there is no instance of vector multiplication being mentioned, but instead, there exist a method of individual vector properties multiplication, called vector scaling. It simply involves multiplying individual properties with a number desired by the mathmatician.

Which, thank gods, I dont want to imagine what multiplying two vectors would look like.

# Matrix and complexity
Matrix can best be described as a two-dimensional array. Remember those array objects in python? This is a hyper extended version of that. There is not much else to them other than that, honestly, but just understanding the positioning and dimensions of a Matrix is bad enough.

Well, I have bad news.

# Matrix math
That said, most (2 of 3) of matrix math annotations are simple and easy, being addition and reduction. To combine or subtract two matrixes, you just have to remove or add the individual values of one to another. Which sounds easy, and it is really, but you have to make sure the two matrix have the same size first.

But well, the same can not be said for the Multiplication of Matrix. First you have to make sure the number of rows of the one on the left is the same as the number of columns of the one on the right. Something like this:
$$
mat(
1, 2, 3;
4, 5, 6
) times  mat(
1; 2; 3;
)
$$
And when you mutliply, you have to take a row on the left and multiply it by the individual numbers of a column from the right, making the result something like this:
$$
... = mat(
(1 times 1) plus (2 times 2) plus (3 times 3);
(4 times 1) plus (5 times 3) plus (6 times 3)
) = mat(14; 37)
$$
aaaand you have to repeat this for every column of the second variable. It goes without saying, but this is a daunting and difficult progress, very boring.

That is quoting the Writer directly, and to be honest, i dont blame him.