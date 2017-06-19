## 2 functions that allow to compute the inverse of a matrix, and cache the that computation so that it only has to be done once: once the inverse of a matrix has been cached, attempting to inverse the same matrix will pull its result from the cache.

# makeCacheMatrix creates a special "vector", which is really a list containing a function to
# 1. set the matrix [set]
# 2. get the matrix [get]
# 3. set the inverse of the matrix [setinv]
# 4. get the inverse of the matrix [getinv]

makeCacheMatrix <- function(x = matrix()) {
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

# cacheSolve checks if the inverse of the matrix already exists in cache, if so it prints a message in the console to say so and then returns the inverted matrix from the cache
# if the inverse of the matrix does not already exist in cache, it a)computes the inverse, b)stores it in the cache, and then c) returns the inverted matrix

cacheSolve <- function(x, ...) {
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