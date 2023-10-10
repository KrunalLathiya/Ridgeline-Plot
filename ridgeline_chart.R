# Load necessary libraries
library(ggplot2)
library(ggridges)

# Load the dataset
weather_data <- read.csv("./DataSets/weather.csv",
    header = TRUE,
    stringsAsFactors = FALSE
)

# Extract the year from the datetime_utc column
weather_data$year <- substr(weather_data$datetime_utc, 1, 4)

# Remove rows with NA values in the X_tempm column
weather_data <- weather_data[!is.na(weather_data$X_tempm), ]

# Create the ridgeline plot
ggplot(weather_data, aes(x = X_tempm, y = as.factor(year), fill = ..density..)) +
    geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
    labs(title = "Temperature Distribution Over Years", x = "Temperature (°C)", y = "Year") +
    theme_ridges(font_size = 13, grid = TRUE)
