using GLMakie

fig = Figure()

ax = Axis(fig[1, 1], title = "Interactive Bar Chart & Buttons")
buttongrid = fig[2, 1] = GridLayout(tellwidth = false)

counts = Observable([1, 4, 3, 7, 2])

# Create dynamic labels that update when counts change
buttonlabels = [lift(x -> "Count: $(x[i])", counts) for i in 1:5]

# Create the buttons in a grid
buttons = buttongrid[1, 1:5] = [Button(fig, label = l) for l in buttonlabels]

# Add click behavior to each button
for i in 1:5
    on(buttons[i].clicks) do n
        counts[][i] += 1
        notify(counts) # Tell Makie the data changed so it updates the chart
    end
end

# Plot the initial bar chart
barplot!(ax, counts, color = cgrad(:Spectral)[LinRange(0, 1, 5)])
ylims!(ax, 0, 20)

# This opens the window AND pauses the script until you close the window
wait(display(fig))