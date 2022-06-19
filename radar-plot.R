library(fmsb)

# Construct the data set
data <- data.frame(Focus = c(10, 0, 9, 10, 5, 3),
                   IQ = c(10, 0, 7, 10, 4, 10),
                   Submissions = c(10, 0, 10, 10, 5, 5),
                   Sociability = c(10, 0, 7, 8, 9, 10),
                   Attendance = c(10, 0, 10, 9, 3, 4),
                   #Durability = c(7, 0, 6, 6, 3, 3),
                   row.names = c("max", "min", "Top Student 1", "Top Student 2", "Last Student 1", "Last Student 2"))

# Define fill colors
colors_fill <- c(scales::alpha("purple", 0.1),
                 scales::alpha("gold", 0.1),
                 scales::alpha("tomato", 0.2),
                 scales::alpha("skyblue", 0.2))

# Define line colors
colors_line <- c(scales::alpha("purple", 0.9),
                 scales::alpha("gold", 0.9),
                 scales::alpha("red", 0.9),
                 scales::alpha("royalblue", 0.9))

# Create plot
radarchart(data, 
           seg = 7,  # Number of axis segments
           title = "Student Performance Indicator Radar Chart",
           pcol = colors_line,
           pfcol = colors_fill,
           plwd = 4)

# Add a legend
legend(x=0.6, y=1.35, legend = rownames(data[-c(1,2),]), bty = "n", pch=20 , col = colors_line, cex = 1.05, pt.cex = 3)
