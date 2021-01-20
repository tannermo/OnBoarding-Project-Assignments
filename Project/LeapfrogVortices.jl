# Double-vortex-leapfrog simulation for Dr. Ning's intro to research 
# project.
# date 18 Jan 2021
# Name: Tanner Oldham
import LinearAlgebra
LA = LinearAlgebra
import Plots
plt = Plots

# initial parameters and variables
T1 = [0,0,-1] # circulation
T2 = [0,0,1]
T3 = T2
T4 = T1
d = 1       # initial distance
dt = 0.01   # time step
t = collect(1:dt:40)

# create position matrices
p1 = zeros(size(t)[1],3) 
p2 = zeros(size(t)[1],3) 
p3 = zeros(size(t)[1],3) 
p4 = zeros(size(t)[1],3) 

# initial position
p1[1,:] = [0,-0.5,0]
p2[1,:] = [0,0.5,0]
p3[1,:] = [1,0.5,0]
p4[1,:] = [1,-0.5,0]

# p = [p1;p2;p3;p4]

# create velocity matrices
v1 = zeros(size(t)[1],3) 
v2 = zeros(size(t)[1],3) 
v3 = zeros(size(t)[1],3) 
v4 = zeros(size(t)[1],3) 

for i = 1:((size(t)[1])-1)
    # r vectors
        # r1 vectors
        r12 = p2[i,:] - p1[i,:]
        r13 = p3[i,:] - p1[i,:]
        r14 = p4[i,:] - p1[i,:]

        # r2 vectors
        r21 = p1[i,:] - p2[i,:]
        r23 = p3[i,:] - p2[i,:]
        r24 = p4[i,:] - p2[i,:]

        # r3 vectors
        r31 = p1[i,:] - p3[i,:]
        r32 = p2[i,:] - p3[i,:]
        r34 = p4[i,:] - p3[i,:]

        # r4 vectors
        r41 = p1[i,:] - p4[i,:]
        r42 = p2[i,:] - p4[i,:]
        r43 = p3[i,:] - p4[i,:]

    # velocity vectors (V)    
        # v1 calculation
        v12 = (LA.cross(T2,r21)) / (2*pi*((LA.norm(r21))^2))  # velocity induced on p1 by T2
        v13 = (LA.cross(T3,r31)) / (2*pi*((LA.norm(r31))^2))  # velocity induced on p1 by T3
        v14 = (LA.cross(T4,r41)) / (2*pi*((LA.norm(r41))^2))  # velocity induced on p1 by T4
        v1[i+1,:] = v12 + v13 + v14

        # v2 calculation
       v21 = (LA.cross(T1,r12)) / (2*pi*((LA.norm(r12))^2))  # velocity induced on p2 by T1
       v23 = (LA.cross(T3,r32)) / (2*pi*((LA.norm(r32))^2))  # velocity induced on p2 by T3
       v24 = (LA.cross(T4,r42)) / (2*pi*((LA.norm(r42))^2))  # velocity induced on p2 by T4
       v2[i+1,:] = v21 + v23 + v24

       # v3 calculation
       v31 = (LA.cross(T1,r13)) / (2*pi*((LA.norm(r13))^2))  # velocity induced on p3 by T1
       v32 = (LA.cross(T2,r23)) / (2*pi*((LA.norm(r23))^2))  # velocity induced on p3 by T2
       v34 = (LA.cross(T4,r43)) / (2*pi*((LA.norm(r43))^2))  # velocity induced on p3 by T4
       v3[i+1,:] = v31 + v32 + v34

       # v4 calculation
       v41 = (LA.cross(T1,r14)) / (2*pi*((LA.norm(r14))^2))  # velocity induced on p4 by T1
       v42 = (LA.cross(T2,r24)) / (2*pi*((LA.norm(r24))^2))  # velocity induced on p4 by T2
       v43 = (LA.cross(T3,r34)) / (2*pi*((LA.norm(r34))^2))  # velocity induced on p4 by T3
       v4[i+1,:] = v42 + v43 + v41
    
    # calculate new position
    p1[i+1,:] = p1[i,:] + v1[i+1,:]*dt # new p1 value
    p2[i+1,:] = p2[i,:] + v2[i+1,:]*dt # new p2 value
    p3[i+1,:] = p3[i,:] + v3[i+1,:]*dt # new p3 value
    p4[i+1,:] = p4[i,:] + v4[i+1,:]*dt # new p4 value

end

plt.plot(p1[:,1], p1[:,2], linecolor = :blue, label = "Left Vortex", arrow = :arrow)
plt.plot!(p2[:,1], p2[:,2], linecolor = :blue, label = false, arrow = :arrow)
plt.plot!(p3[:,1], p3[:,2], linecolor = :red, label = "Right Vortex", arrow = :arrow)
plt.plot!(p4[:,1], p4[:,2], linecolor = :red, label = false, arrow = :arrow)

plt.savefig("LeapfrogVortices.png")
