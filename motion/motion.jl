using GLMakie

# 1. Generate some 2D motion data (e.g., a spiral or circular motion over time)
t = range(0, 10, length = 200)
x = t .* cos.(t)
y = t .* sin.(t)

# 2. Create the figure and axis
fig = Figure(size = (600, 600))
ax = Axis(fig[1, 1], title = "Interactive 2D Motion Analysis", xlabel = "X Position", ylabel = "Y Position")

# 3. Setup an Observable point for real-time tracking
# An Observable tells Makie to update the chart whenever its value changes
current_index = Observable(1)
particle_pos = @lift(Point2f(x[$current_index], y[$current_index]))

# Plot the full path (static background) and the moving particle (dynamic)
lines!(ax, x, y, color = :dodgerblue, linewidth = 2, label = "Trajectory")
scatter!(ax, particle_pos, color = :crimson, markersize = 20, label = "Moving Object")
axislegend(ax)

# 4. Display the interactive window
display(fig)

# 5. Run a loop to animate the motion dynamically
println("Starting animation...")
sleep(1) # Brief pause before starting

while true
    for i in 1:length(t)
        current_index[] = i   # Update the observable index
        sleep(0.03)           # Control frame rate / animation speed
    end
    # Loop back to start to keep the animation going
    sleep(1)
end