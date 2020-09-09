# Numerical Differentiation
diff_forward(f, x; h=sqrt(eps(Float64))) = (f(x+h) - f(x))/h
diff_backward(f, x; h=sqrt(eps(Float64))) = (f(x) - f(x-h))/h
diff_central(f, x; h=sqrt(eps(Float64))) = (f(x+ h/2) - f(x - h/2))/h
diff_complex(f, x; h=1e-20) = imag(f(x + h*im))/h

 test_diff_complex(x) = 2*x + x^3 - 14
 print(diff_complex(test_diff_complex,0))

struct Dual
    v
    ∂
end

Base.:+(a::Dual, b::Dual) = Dual(a.v + b.v, a.∂ + b.∂)
Base.:*(a::Dual, b::Dual) = Dual(a.v * b.v, a.v*b.∂ + b.v*a.∂)
function Base.max(A::Dual, b::Dual)
    v = max(a.v,b.v)
    ∂ = a.v > b.v ? a.∂ : a.v < b.v ? b.∂ : NaN
    return Dual(v, ∂)
end
function Base.max(a::Dual, b::Int)
    v = max(a.v, b)
    ∂ = a.v > b ? a.∂ : a.v < b ? 0 : NaN
    return Dual(v,∂)
end



a = Dual(8,12)
b = Dual(1,4)
print(a+b)
print(a*b)

import Zygote: gradient
test_grad(a, b) = log(a*b + max(a,2))
print(gradient(test_grad, 3.0,2.0))


function bracket_minimum(f, x=0; s=1e-5, k=2.0)
    a, ya = x, f(x)
    b, yb = a + s, f(a+s)
    if yb > ya
        a, b = b, a
        ya, yb = yb, ya
        s = -s
    end
    while true
        c, yc = b + s, f(b + s)
        if yc > yb
            return a < c ? (a, c) : (c, a)
        end
        a, ya, b, yb = b, yb, c, yc
    end
end

test_quadratic(x) = x*x + 12*x

bracket_minimum(quadratic)
