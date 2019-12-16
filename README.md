# MultiDimensionalArrayProduct

The function %m% is a product of multidimensional arrays defined in Pinheiro et al (2018).
In words, the three-dimensional arrays are treated as an array of matrices. 
The length of such array is the length of the third dimension of the three-dimensional array.

If A is an r x c x d array and B is a c x e array (matrix) then C = A%m%B is the r x e x d array such
that C[; ; i] = A[; ; i] %*% B, where "% * %" is the usual matrix product. 

If A is an r x c x d array and B is a c x e x f array then C = A%m%B is the r x e x d x f array such 
that C[; ; i; j] = A[; ; i] %*% B[; ; j].

If A is an r x c array and B is a c x e x f array, then C = A%m%B is the r x e x f array such
that C[; ; j] = A %*% B[; ; j].

See the MultiDimensionalArrayProduct-example.R to compare to other multidimensional arrays products.


Pinheiro, E. C., Ferrari, S. L. P. and Medeiros, F. M. C. (2018). Higher-order approximate confidence intervals.
ArXiv 1811.11031
