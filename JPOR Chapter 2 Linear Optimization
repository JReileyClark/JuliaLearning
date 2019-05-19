using JuMP, GLPK

# Preparing an optimization model
m = Model(with_optimizer(GLPK.Optimizer))

# Declaring variables
@variable(m, 0<= x1 <=10)
@variable(m, x2 >=0)
@variable(m, x3 >=0)

# Setting the objective
@objective(m, Max, x1 + 2x2 + 5x3)

# Adding constraints
@constraint(m, constraint1, -x1 +  x2 + 3x3 <= -5)
@constraint(m, constraint2,  x1 + 3x2 - 7x3 <= 10)

# Printing the prepared optimization model
print(m)

# Solving the optimization problem
JuMP.optimize!(m)

# Printing the optimal solutions obtained
println("Optimal Solutions:")
println("x1 = ", JuMP.value(x1))
println("x2 = ", JuMP.value(x2))
println("x3 = ", JuMP.value(x3))

# Printing the optimal dual variables
println("Dual Variables:")
println("dual1 = ", JuMP.shadow_price(constraint1))
println("dual2 = ", JuMP.shadow_price(constraint2))

## MILP examples
# Preparing an optimization model
m = Model(with_optimizer(GLPK.Optimizer))

# Declaring variables
@variable(m, 0<= x1 <=10)
@variable(m, x2 >=0, Int)
@variable(m, x3, Bin)

# Setting the objective
@objective(m, Max, x1 + 2x2 + 5x3)

# Adding constraints
@constraint(m, constraint1, -x1 +  x2 + 3x3 <= -5)
@constraint(m, constraint2,  x1 + 3x2 - 7x3 <= 10)

# Printing the prepared optimization model
print(m)

# Solving the optimization problem
JuMP.optimize!(m)

# Printing the optimal solutions obtained
println("Optimal Solutions:")
println("x1 = ", JuMP.value(x1))
println("x2 = ", JuMP.value(x2))
println("x3 = ", JuMP.value(x3))

using PyPlot
pygui(true)

fig = figure()

# Data
x = range(0, stop=2*pi, length=1000)
y = sin.(3*x)
# Preparing a figure object

# Plotting with linewidth and linestyle specified
plot(x, y, color="blue", linewidth=2.0, linestyle="--")

# Labeling the axes
xlabel(L"value of $x$")
ylabel(L"\sin(3x)")

# Title
title("Test plotting")
show()
# Save the figure as PNG and PDF


# Close the figure object
close(fig)
