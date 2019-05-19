# Data Science With Julia
# Code by: Justin Clark

# Chapter 2: Core Julia

z = 100
y = 10.0
s = "Data Science"
ν = 5.0
μ = 1.2
datascience = true
data_science = true

## These are incorrect and will return an error
#if = true
#else = 1.5

## Operators
x = 2
y = 3
z = 4

## Arithmetic Operators
println(x+y)
println(x^y)

## Updating Operators
println(x+=2)
println(y-=2)
println(z *= 2)

## Numeric Comparison
println(x==y)
println(x != y)
println(x <= z)

## Operator Precedence
println(x*y+z^2)
println(x*(y+(z^2)))
println((x*y)+(z^2))

## TYPES - Numeric
Sys.WORD_SIZE
typemax(Int)
typemax(Int64)

# Integers
literal_int = 1
println("typeof(literal_int): ", typeof(literal_int))

# Boolean Values
x = Bool(0)
y = Bool(1)


## Integer Overflow error
x = typemax(Int64)
x +=1
x == typemax(Int64)

## Integer Underflow error
x = typemin(Int64)
x -= 1
x == typemin(Int64)


## Floats
x1 = 1.0
x64 = 15e-5
x32 = 2.5f-4

typeof(x32)

# Digit separatino use an _
9.2_4 == 9.24

isnan(0/0)

isinf(1/0)

isinf(-11/0)

y1 = 2*3
isnan(y1)
isinf(y1)


y2 = 2/0
isnan(y2)

isinf(y2)

## Some examples of machine epsilon
eps()

## spacing between a floating point number x and adjacent number
## is at most eps * abs(x)

n1 = [1e-25, 1e-5, 1., 1e5, 1e25]
for i in n1
    println(*(i, eps()))
end

## STRINGS!
s1 = "Hi"
s2 = """ I have a "quote" character"""

str = "Data science is fun, and Justin is a Goofball!"
str[1]
str[end]
str[end - 1]
str[4:7]
str[1:2]
# Concatenation
string(str, " Yes, He really is!")
println( str * " Yes, he really is!")

#Interpolation
println("1 + 2 = $(1+2)")
 word1 = "Julia"
 word2 = "data"
 word3 = "science"
 println("$word1 is great for $word2 $word3")

# lexicographical Comparison
s1 = "abcd"
s2 = "abce"

println(s1==s2)
println(s1 < s2)

println(s1 > s2)
str = "Justin is learning Julia, one line at a time!"
println(findfirst("Julia",str))
println(occursin("line",str))
println(replace(str,"Justin" => "Senor Buttface"))
println(str)

## Regular Expressions!
## Match alpha-numeric characters iat the start of the string
occursin(r"^[a-zA-Z0-9]",str)
occursin(r"[a-zA-Z0-9]$",str)
# find a comma followed by a space
match(r"\,\s",str)
#Match all the non-alphanumeric characters in the string
println(collect(eachmatch(r"[^a-zA-Z0-9]",str)))

## Tuples
tup1 = (3.0,9.1,0.8,1.9)
typeof(tup1)
tup2 = ("Data",2.5,"Science",8.8)
typeof(tup2)
a, b, c = ("Justin",2.3,9.9)
println(a,b,c)

## Arrays!!
a1 = Array{Int64}(undef,5)

a2 = Array{Int64}(undef,(2,2))
println(a2)

a3 = Array{Any}(undef,(2,2))
println(a3)

a4 = [1,2,3]
println(a4)
a5 = [1 2 3]
println(a5)
a6 = [80 81 82 ; 90 91 92]
println(a6)

## Arrays containing elements of a common type can be created like this:
a7 = Float64[3.0 5.0; 1.1 3.5]
## Arrays can be explicitly created like this :
Vector(undef,3)
Matrix(undef,2,2)

# A 3-element Float Array
a3 = collect(Float64, 3:-1:1)
println(a3)

# Using the LinearAlgebra package
using LinearAlgebra
imat = Matrix{Int8}(I,(2,2))
rand(2)
println(imat)
println(rand(2))

B = [80 81 82 ; 90 91 92]
rand(B,2)
println(B)
println(rand(B,2))
println(length(B))
println(size(B))
println(ndims(B))
print(reshape(B,(3,2)))
println(transpose(B))

B2 = deepcopy(B)
println(B[1:2, ])
B[1,:]

# Building arrays using comprehensions
A1 = [sqrt(i) for i in [2,4,6]]

A2 = [i^2 for i in [1,2,3]]

## Dictionaries
D0 = Dict()
D1 = Dict(1 => "red", 2 => "white")
D2 = Dict{Integer,String}(1 => "red", 2 => "white")

## Create a dictionary using a loop
food = ["turkey","hotdogs","pudding"]
food_dict = Dict{Int, String}()

for (n, fd) in enumerate(food)
    food_dict[n] = fd
end

println(food_dict)

# Using a comprehension
wine = ["red","white","rose"]
wine_dict = Dict{Int,String}(i => wine[i] for i in 1:length(wine))

println(food_dict[1])
println(wine_dict[3])

get(food_dict,1,"Key is not found within the dictionary")
get(food_dict, 12,"Key is not found within the dictionary")

haskey(food_dict,12)
haskey(food_dict,2)

getkey(food_dict,1,999)

# renaming dict contents
println(food_dict)
food_dict[1] = "lobster"
println(food_dict)

#Adding new entries - two common ways
# referencing a new key and assigning it a value
food_dict[4] = "bannock"
get!(food_dict, 4, "bannock")
println(food_dict)
# Deleting entries
delete!(food_dict, 4)
println(food_dict)

#Deleting by key and returning the value associated with the key, and
# returning a value if the key is not present
deleted_fd_value = pop!(food_dict, 3, 999)
println(food_dict)
# Coercing keys into arrays
collect(keys(food_dict))
# Coercing values into arrays
collect(values(food_dict))

# Iterating over keys and arrays
for (k,v) in food_dict
    println("food_dict - key: ", k, " value: ", v)
end

for k in keys(food_dict)
    println("food_dict - key: ",k)
end

for v in values(food_dict)
    println("food_dict - value: ",v)
end

## 2.5 Control Flow
# Compound expressions with the begin block

b1 = begin
    c = 20
    d = 5
    c * d
end
println("b1: ",b1)

# A chain
b2 = (c = 20 ; d = 5; c * d)
println("b2: ",b2)

# Conditional Evaluation
k = 1
if k == 0
    "zero"
else
    "not zero"
end

# an if-elseif-else construct
k = 111
if k % 3 == 0
    0
elseif k %3 == 1
    1
else
    2
end

# Short Circuit Evaluation
b = 10; c = 20
println("SCE: b < c: ", b < c ? "less than" : "not less than")

# A short circuit evaluation with nesting
d = 10; f = 10;
println("SCE: chained d vs e: ",
    d < f ? "less than " :
    d > f ? "greater than" : "equal")

#the letter "e" is a literal in Julia so we skipped over it when assigning variables above.
using Base.MathConstants
e

## Loops
# Basics
str = "Julia"
# A for loop for a string iterating by index
for i = 1:length(str)
    println(str[i])
end

# A for loop for a string, iterating by container element
for s in str
    println(s)
end

# A nested for loop
odd = [1,3,5]
even = [2,4,6]
for i in odd, j in even
    println("$i*$j = $(i*j)")
end

# A while loop to estimate the median using an MM algorithm
using Distributions, Random
Random.seed!(1234)

iter = 0
N = 100
x = rand(Normal(2,1),N)
psi = fill!(Vector{Float64}(undef,2),1e9)
while(true)
    global iter, x, psi
    iter += 1
    if iter == 25
        println("Max iteration reach at iter=$iter")
        break
    end
    num, den = (0,0)
    # elementwise operations in wgt
    wgt = (abs.(x .- psi[2])).^-1
    num = sum(wgt .* x)
    den = sum(wgt)
    psi = circshift(psi,1)
    psi[2] = num / den
    dif = abs(psi[2] - psi[1])
    if dif < 0.001
        print("Converged at iteration $iter")
        break
    end
end
median(x)
psi[2]

# control flow with break and continue keywords
#break keyword
i = 0
while true
    global i
    sq = i^2
    println("i: $i --- sq: = $sq")
    if sq > 16
        break
    end
    i+=1
end

for i = 1:10
    sq = i^2
    println("i: $i --- sq: $sq")
    if sq > 16
        break
    end
end

# Continue keyword
for i in 1:5
    if i %2 == 0
        continue
    end
    sq = i^2
    println("i: $i --- sq: $sq")
end

# exception handling
# explicitly throw exception using the throw() function

for i in [1, 2, -1, 3]
    if i < 0
        throw(DomainError())
    else
        println("i: $(log(i))")
    end
end

# use error function
for i in [1, 2, -1, 3]
    if i < 0
        error("i is a negative number")
    else
        println("i: $(log(i))")
    end
end

#try/catch
for i in [1, 2, -1, "A"]
    try log(i)
    catch ex
        if isa(ex, DomainError)
            println("I: $i --- Domain Error")
            log(abs(i))
        else
            println("i: $i")
            println(ex)
            error("Not a DomainError")
        end
    end
end


## Functions
function add(x,y)
    return(x+y)
end

addnew = add
addnew(3,5)

add2(x, y) = x + y

function f1!(x)
    x[1] = 9999
    return(x)
end

ia = Int64[0,1,2]
f1!(ia)
println("Argument passing by reference: ", ia)


function gt(g1, g2)
    if(g1 > g2)
        return("$g1 is largest")
    elseif(g1<g2)
        return("$g2 is largest")
    else
        return("$g1 and $g2 are equal")
    end
end

gt(10,13)
gt(10,10)

function fibonacci(n=20)
    if n<=1
        return 1
    else
        return fibonacci(n-1) + fibonacci(n-2)
    end
end

fibonacci(9)


# a function with keyword arguements estimating the median of a 1D array using the MM algorithm

function mm_median(x, eps = 0.001; maxit = 25, iter::Int64=Int(floor(eps)))

    #initialization
    psi = fill!(Vector{Float64}(undef,2), 1e2)

    while(true)
        iter += 1
        if iter == maxit
            println("Max iteration reached at iter=$iter")
            break
        end
        num, den = (0,0)
        #using map() to do elementwise operations in wgt
        wgt = map(d -> (abs(d - psi[2]))^(-1),x)
        num = sum(map(*, wgt,x))
        den = sum(wgt)
        psi = circshift(psi,1)
        psi[2] = num/den

        dif = abs(psi[2] - psi[1])
        if dif < eps
            print("Convereged at iteration $iter")
            break
        end
    end

    return(Dict("psi_vec"=> psi, "median" => psi[2]))
end

using Distributions, Random
Random.seed!(1234)

N = Int(1e3)
dat = rand(Normal(0,6), N)

median(dat)
mm_median(dat)["psi_vec"]

mm_median(dat, maxit=50)["psi_vec"]
mm_median(dat, 1e-9, maxit=100)["psi_vec"]



# tip - Do not wrap abs() in anonymous functions like this
A = [1, 123,-123,-342,34]
map(x -> abs(x),A)
# Do this instead
map(abs,A)

# Type Promotion
times1a(y) = *(y,1)
times1b(y) = *(y,1.0)
println("times1a(1/2): ",times1a(1/2))
println("times1a(2): ",times1a(2))
println("times1a(2.0): ",times1a(2.0))
println("times1b(1/2): ",times1b(1/2))
println("times1b(2): ",times1b(2))
println("times1b(2.0): ",times1b(2.0))
