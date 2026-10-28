using Symbolics

# Declare symbolic variables
@variables x y

# Define an expression
expr = x^3 + 2*x^2*y + sin(x)

# Take the symbolic derivative with respect to x
d_expr = Symbolics.derivative(expr, x)
println("Derivative: ", d_expr)
