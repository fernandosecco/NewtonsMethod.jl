module NewtonsMethod

greet() = print("Hello World!")

using LinearAlgebra, ForwardDiff, Statistics

function newtonroot(f, f_prime; x0, tol = 1E-7, maxiter = 1000)
    x_old = x0
    iter = 1
    while normdiff > tol && iter <= maxiter
        x_new = x_old - (f(x_old)/f_prime(x_old)) 
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end
    if normdiff > tol
        return nothing
    else
        return x_old
    end

end


function newtonroot(f; x0, tol = 1E-7, maxiter = 1000)
    f_prime(x) = ForwardDiff.derivative(f,x)
    x_old = x0
    normdiff = Inf
    iter = 1
    while normdiff > tol && iter <= maxiter
        x_new = x_old - (f(x_old)/f_prime(x_old)) 
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end
    if normdiff > tol
        return nothing
    else
        return x_old
    end
end

export newtonroot
end # module
