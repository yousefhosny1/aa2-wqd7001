library(plotly)

fig <- plot_ly(
  domain = list(x = c(0, 1), y = c(0, 1)),
  value = 65,
  title = list(text = "Percentage of 'A' students"),
  type = "indicator",
  mode = "gauge+number+delta",
  delta = list(reference = 54),
  
  gauge = list(
    axis =list(range = list(NULL, 100)),
    bar = list(color = "purple"),
    #steps = list(
     # list(range = c(0, 250), color = "lightgray"),
      #list(range = c(250, 400), color = "gray")),
    threshold = list(
      line = list(color = "green", width = 4),
      thickness = 0.75,
      value = 80))) 

fig <- fig %>%
  layout(margin = list(l=20,r=30))

fig