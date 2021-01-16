# Double-vortex-leapfrog simulation for Dr. Ning's intro to research 
# project.
# date 7-sept-2020
# Name: Tanner Oldham
import LinearAlgebra
LA = LinearAlgebra

println("let's go")

# time vector
#t = range(0,stop=10,length=100)
t = collect(0:0.1:5)

v1 = [1,2,3]
v2 = [4,5,6]

# cp = a new variable we are initializing and naming "cp" for cross product
cp = LA.cross(v1,v2)    #"LA." means inside of "LinearAlgebra" package 
                        # "cross(x,y)" is the function inside LA package for the cross product


