## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix_old <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve_old <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}



makeCacheMatrix <- function(x = matrix()) {
		## Write a short comment describing this function
        invx <- NULL
        set <- function(y) {
                x <<- y
                invx <<- NULL
        }
        get <- function() x
        setinv <- function(inv) invx <<- inv
        getinv <- function() invx
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}

cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
        invx <- x$getinv()
        if(!is.null(invx)) {
                message("getting cached data")
                return(invx)
        }
        data <- x$get()
        invx <- solve(data)
        x$setinv(invx)
        invx
}