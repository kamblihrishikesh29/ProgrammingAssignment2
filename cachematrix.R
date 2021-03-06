## These functions will creates a calculate and store the inverse of a matrix.
## Once inverse is calculated, the result is cached so that when we need it
## again, the cached value can be used  rather than recomputing the iverse.



## This function creates a special "matrix" object that can cache its inverse.
## The "set" function sets the value of the matrix.
## The "get" function returns the value of the matrix.
## The "setInverse" function sets the inverse value of the matrix.
## The "getInverse" function returns the inverse value of the matrix.

makeCacheMatrix <- function(x = matrix()){
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() {x}
  setInverse <- function(inverse) {inv <<- inverse}
  getInverse <- function() {inv}
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned
## by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve retrieves 
## the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}