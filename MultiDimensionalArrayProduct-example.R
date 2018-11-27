A<-array(1:8,dim=c(2,2,2))
A
B<-array(rep(2,4),dim=c(2,2))
B

# I want to multiply matrices A[,,i]%*%B for each level i of the third dimension of 
# the multidiemnsional array A 
# and obtain an multidimensional array C such that C[,,i]=A[,,i]%*%B
A1<-A[,,1]%*%B
A1
A2<-A[,,2]%*%B
A2

#install.packages("abind")
require(abind)
C<-abind(A1,A2,along=3) 
C


A%o%B # outer is not what I want 
A%x%B # kronecker is not what I want 
sweep(A, 3, B, FUN = "*") # is not what I want 
sweep(A, 3, B, FUN="%*%") # is not what I want 

#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# Defining the function %m% to do what I want

"%m%"<-function(x,y){
  R<-NULL
  virgx<-paste(rep(",",length(dim(x))-1),collapse="")
  virgy<-paste(rep(",",length(dim(y))-1),collapse="")
  if(length(dim(x))==length(dim(y))){
    for(j in 1:dim(y)[length(dim(y))]){
      for(i in 1:dim(x)[length(dim(x))] ){
        R<-c(R, as.vector( eval(parse(text=paste("x[", "i]",sep=virgx)))  %*% eval(parse(text=paste("y[", "j]",sep=virgy)))  )  )
      }
    }
    R<-array(R,dim=c(dim(x)[1],dim(y)[2],dim(x)[3:length(dim(x))],dim(y)[3:length(dim(y))]))
    # print(R)
  }
  else{#length(dim(x)) !== length(dim(y))
    if(length(dim(x))>length(dim(y))){
      
      if(length(dim(x))==3){
        for(i in 1:dim(x)[length(dim(x))] ){
          R<-c(R, as.vector(eval(parse(text=paste("x[", "i]",sep=virgx)))  %*% y))
        } 
      }
      if(length(dim(x))==4){
        virgx<-paste(rep(",",length(dim(x))-2),collapse="")
        for(j in 1:dim(x)[length(dim(x))] ){
          for(i in 1:dim(x)[length(dim(x))-1] ){
            R<-c(R, as.vector(eval(parse(text=paste("x[", "i,j]",sep=virgx)))  %*% y))
          } 
        }
      }
      R<-array(R,dim=c(dim(x)[1],dim(y)[2],dim(x)[3:length(dim(x))] ))
      # print(R)
      
    }
    else{#length(dim(x)) < length(dim(y))
      
      if(length(dim(y))==3){
        for(i in 1:dim(y)[length(dim(y))] ){
          R<-c(R, as.vector(x %*% eval(parse(text=paste("y[", "i]",sep=virgy))) ))
        } 
      }
      if(length(dim(y))==4){
        virgy<-paste(rep(",",length(dim(y))-2),collapse="")
        for(j in 1:dim(y)[length(dim(y))] ){
          for(i in 1:dim(y)[length(dim(y))-1] ){
            R<-c(R, as.vector(x %*% eval(parse(text=paste("y[", "i,j]",sep=virgy))) ))
          } 
        }
      }
      
      R<-array(R,dim=c(dim(x)[1],dim(y)[2],dim(y)[3:length(dim(y))] ))
      # print(R)
    }
  }
  R
}
A%m%B

