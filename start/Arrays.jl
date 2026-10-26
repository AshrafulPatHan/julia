# Julia Arrays — how to make them
# Run with: julia Arrays.jl

# ---------------------------------------------------------------
# 1. Simple arrays (1-D) using square-bracket literal syntax
# ---------------------------------------------------------------
arr = [1, 2, 3]            # 3-element Array{Int64, 1}
println(arr)
println("type: ", typeof(arr))

b = ["apple", "banana", "cherry"]   # 3-element Array{String, 1}
mixed = [1, "two", 3.0]            # 3-element Array{Any, 1}

# ---------------------------------------------------------------
# 2. Two-dimensional arrays (matrices) — rows separated by ';'
# ---------------------------------------------------------------
m = [1 2 3;
     4 5 6;
     7 8 9]                   # 3x3 Matrix{Int64}

println(m)
println("size: ", size(m))   # (3, 3)

# ---------------------------------------------------------------
# 3. Empty arrays
# ---------------------------------------------------------------
empty_int = Int[]            # empty Array{Int64, 1}
empty_mixed = []            # empty Array{Any, 1}

# ---------------------------------------------------------------
# 4. Pre-allocate and fill
# ---------------------------------------------------------------
zeros_arr = zeros(3, 3)     # 3x3 matrix of 0.0
ones_arr = ones(4)          # 4-element vector of 1.0
filled = fill(42, 3, 3)     # 3x3 matrix filled with 42

println(zeros_arr)
println(ones_arr)
println(filled)

# ---------------------------------------------------------------
# 5. From ranges
# ---------------------------------------------------------------
r1 = 1:10                  # 1,2,3,...,10 (lazy range, not a real array)
r2 = collect(1:10)         # materialize into an actual array

println(r2)

# ---------------------------------------------------------------
# 6. Indexing and slicing
# ---------------------------------------------------------------
x = [10, 20, 30, 40, 50]

println("first: ", x[1])    # Julia is 1-indexed
println("last:  ", x[end])
println("slice:  ", x[2:4])
println("step:   ", x[2:2:end])

# ---------------------------------------------------------------
# 7. Modifying arrays (in-place functions end with !)
# ---------------------------------------------------------------
y = [1, 2, 3]
push!(y, 4)                # append at end
pop!(y)                    # remove last
pushfirst!(y, 0)          # insert at front          # insert at front
deleteat!(y, 1)           # remove element at position 1
println(y)

# ---------------------------------------------------------------
# 8. Useful built-in functions
# ---------------------------------------------------------------
v = [3, 1, 4, 1, 5, 9, 2, 6]
println("sum:    ", sum(v))
println("max:    ", maximum(v), " min: ", minimum(v))
println("length: ", length(v))
println("sorted: ", sort(v))
println("reverse:", reverse(v))
