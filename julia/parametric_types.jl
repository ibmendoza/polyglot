@assert typeof(0x5 // 0x22) == Rational{Uint8}
@assert typeof(5 // 34) == Rational{Int64}
@assert typeof(8.75im) == Complex{Float64}
@assert typeof([5,3]) == Array{Int64,1}
@assert typeof([3, "abc"]) == Array{Any, 1}
@assert typeof([]) == Array{None, 1}
@assert typeof([1 0; 0 1]) == Array{Int64, 2}
