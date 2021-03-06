makeCacheMatrix<-function(x=matrix()){
        s<-NULL
        set<-function(y) {
                x<<-y
                s<<-NULL
        }
        get<-function() x
        setsolve<-function(solve) s <<-solve
        getsolve<-function() s
        list(set=set,get=get,setsolve=setsolve,getsolve=getsolve)
}
cacheSolve<-function(x,...){
        s<-x$getsolve()
        if(!is.null(s)){
                message("getting cached data")
                return(s)
        }
        matrix<-x$get()
        s<-solve(matrix,...)
        x$setsolve(s)
        s
}
testmatrix<-matrix(1:4,2,2)
testmatrix
makeCacheMatrix(testmatrix)
solve(testmatrix)