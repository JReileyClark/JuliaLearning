## Bracketing methods for univariate functions

function bracket_minimum(f, x=0; s=1e-2, k=2.0)
    # Establish the left-most point from the x
    a, ya = x, f(x)
    # Set the right-most point from x + s
    b, yb = a + s, f(a + s)

    # If yb > ya then we swap the values of a and b and ya and yb, and reverse
    # our step direction from left-> right to right -> left
    if yb > ya
        a, b = b, a
        ya, yb = yb, ya
        s = -s
    end

    # we set an infinite while loop that exits only when the condition yc > yb is met
    while true
        c, yc = b + s, f(b + s)
        # Beacuse we are stepping in the direction of descent, we stop once our
        # new location is greater than our previous location. Meaning we've stepped
        # beyond the minimum and we return the interval containing the minimum.
        if yc > yb
            return a < c ?  (a, c) : (c, a)
        end
        # if yc <= yb, then we reassign our new interval
        a, ya, b, yb = b, yb, c, yc
        # we adjust our step size by the adjustment factor k
        s *= k
    end
end

function fibonacci_search(f, a, b, n; ϵ=0.01)
    ϕ = (1 + √5)/2
    s = (1- √5)/(1+√5)
    ρ = 1/ (ϕ*(1 - s^(n+1))/(1-s^n))
    d = ρ*b + (1 - ρ)*a
    yd = f(d)
    for i in 1:n-1
        if i == n-1
            c = ϵ*a + (1-ϵ)*d
        else
            c = ρ*a + (1-ρ)*b
        end
        yc = f(c)
        if yc < yd
            b, d, yd = d, c, yc
        else
            a, b = b, c
        end
        ρ = 1 / (ϕ*(1-s^(n-i+1))/(1-s^(n-i)))
    end
    return a < b ? (a, b) : (b, a)
end

function golden_section_search(f, a, b, n)
    ϕ = (1 + √5)/2
    ρ = ϕ-1
    d = ρ * b + (1 - ρ)*a
    yd = f(d)
    for i = 1 : n-1
        c = ρ*a + (1 - ρ)*b
        yc = f(c)
        if yc < yd
        b, d, yd = d, c, yc
        else
        a, b = b, c
        end
    end
    return a < b ? (a, b) : (b, a)
end

function quadratic_fit_search(f, a, b, c, n)
    ya, yb, yc, = f(a), f(b), f(c)
    for i in 1:n-3
        x = 0.5*(ya*(b^2 - c^2) + yb*(c^2 - a^2) + yc*(a^2 - b^2)) / (ya*(b-c) + yb*(c-a) + yc*(a-b))
        yx = f(x)
        if x > b
            if yx > yb
                c, yc, = x , yx
            else
                a, ya, b, yb = b, yb, x, yx
            end
        elseif x < b
            if yx > yb
                a, ya = x, yx
            else
                c, yc, b, yb = b, yb, x, yx
            end
        end
    end
    return (a, b, c)
end


test_func(x) = x^2 + 16*x + 1
quadratic_fit_search(test_func,-10.0,24.0,96.0,100)







function dist2func((fx, fy, fz), (gx, gy, gz),t1,t2)
    return sqrt.((fx(t1) .- gx(t2)).^2 .+ (fy(t1).- gy(t2)).^2 .+ (fz(t1) .- gz(t2)).^2)
end

fx(t) = 0.5 .*t
fy(t) = (0.4) .* t.^(0.3)
fz(t) = sqrt.(t)
gx(t)= .95 .*t .- 700
gy(t) = .37 .*t .- 400
gz(t) = .44*t

fg_dist = dist2func((fx,fy,fz),(gx,gy,gz),700,1000)

using Plots

md = collect(1:2:3000)

plot(fx(md),md)
plot(fy(md) ,md)
plot(fz(md),md)
data =[[i,j,dist2func((fx,fy,fz),(gx,gy,gz),i,j)] for i in 1:300, j in 1:300]
data[:][:]
scatter(data[1])

println([sin(row) for row in md])
