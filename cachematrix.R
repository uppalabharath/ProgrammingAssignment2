## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to
## set the value of the matrix. It uses set Method
## get the value of the matrix It uses get Method
## set the value of the inverse of matrix. It uses setInverse Method
## get the value of the iverse of matrix. It uses getInverse Method
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(pMatrix) {
    x <<- pMatrix
    i <<- NULL
  }
  get <- function() {
    x
  }
  setInverse <- function(pInverse) { i <<- pInverse }
  getInverse <- function() { i }
  list(set = set, get = get, getInverse = getInverse, setInverse = setInverse)
}


## The following function calculates the mean of the special "matrix" created with the above function. 
## It first checks to see if the invesre has already been calculated. If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the invesre of the matrix and sets the value of the invesre in the cache via the setInvesre function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  pInverse <- x$getInverse()
  if(!is.null(pInverse)) {
    message("getting cached data")
    return (pInverse)
  }
  origMatrix <- x$get()
  pInverse <- solve(origMatrix)
  x$setInverse(pInverse)
  pInverse
}
