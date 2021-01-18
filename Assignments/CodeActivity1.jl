import Plots # import package called "Plots". This is for graphing
plt = Plots # takes imported package and assigns it a variable that we've named "plt"

m = 0.10
x = LinRange(0, 1, 11)
t = zeros(size(x))

for i in 1:11
    t[i] = 10*m * (0.2969*sqrt(x[i]) - 0.1260*x[i] - 0.3537*x[i]^2 + 0.2843*x[i]^3 - 0.1015x[i]^4)
    println("$(x[i]) | $(t[i])")
end

#plt.plot(t,x)
#plt.plot(t,x,color=:blue)

a = plt.plot(x,t,
    #seriestype = :steppre,
    #linestyle = :dot,
    #arrow = :arrow,
    #linealpha = 0.5,
    #linewidth = 4,
    linecolor = :blue
)

# to add another line to the same plot, use the same plt.plot, but add an explimation point "!" at the end like this
a = plt.plot!(a,x,x,
    linecolor = :red
)

# to save plot
plt.savefig("myplot.png")