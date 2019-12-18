# MultiDimensionalArrayProduct

A product of multidimensional arrays is defined, denoted here by $\diamond$, as follows.

If $A$ is an $r \times c \times d$ array and $B$ is a $c \times e$ array (matrix) then $C = A \diamond B$ is the $r \times e \times d$ array such that $C[i,j,k]=\sum_{m=1}^c A[i,m,k] B[m,j]$, where $\times$ is the usual scalar product. 

In words, the multidimensional array $A$ works like a sequence of $d$ matrices $r \times c$ and each one is multiplied by the matrix $B$ to form the third dimension of $C$.

If $A$ is an $r \times c$  array and $B$ is a $c \times e \times f$  multidimensional array, then $C = A \diamond B$ is the $r \times e \times f$ array such that $C[i,j,k]=\sum_{m=1}^c A[i,m] B[m,j,k]$. 

If $A$ is an $r \times c \times d$ array and $B$ is a $c \times e \times f$ array then $C = A \diamond B$ is the $r \times e \times d \times f$ array such that $C[i,j,k,l]=\sum_{m=1}^c A[i,m,k] B[m,j,l]$.

In words, the multidimensional array $A$ works like a sequence of $d$ $r \times c$ matrices  and each one is multiplied by a sequence of $f$ matrices $c \times e$ to form the third and fourth dimensions of $C$.

Notice that when the multidimensional array is a matrix, the $\diaamond$ product is the usual matrix product. 

An {\tt R} language \citep{R} implementation of the proposed multidimensional arrays product $\diamond$ is given in function {\tt \%m\%}. 

See the MultiDimensionalArrayProduct-example.R to compare to other multidimensional arrays products.

\begin{thebibliography}{9}
\bibitem[R Core Team(2018)]{R}
{R Core Team}~(2018). 
R: A Language and Environment for Statistical Computing. 
R Foundation for Statistical Computing, Vienna, Austria.
\url{https://www.R-project.org/}
\end{thebibliography}
