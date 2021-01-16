m = 0.10
x = LinRange(0, 1, 11)
t = zeros(size(x))

for i in 1:11
    t[i] = 10*m * (0.2969*sqrt(x[i]) - 0.1260*x[i] - 0.3537*x[i]^2 + 0.2843*x[i]^3 - 0.1015x[i]^4)
    println("$(x[i]) | $(t[i])")
end