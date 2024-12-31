library(dplyr)
library(readr)
library(lubridate)
library(ggplot2)
library(plotly)
library(DT)
library(tidyverse)
library(scales)
---
#To start, we read and merge all the csv files into a data frame
df <- list.files("/Users/britneykon/Downloads/DivvyDB2024", 
                       full.names = TRUE, pattern = ".*csv") |>
  lapply(read_csv) |>
  bind_rows()

# cleaning df, create ride_length, day_of_week columns for contextual data
df <- df |>
  mutate(ride_minute = interval(started_at, ended_at) /dminutes(1), 
         day_of_week = wday(started_at, week_start = 1))


#create function to obtain mode (most frequent)
get_mode <- function(x) {
  uniq_x <- unique(x)
  uniq_x[which.max(tabulate(match(x, uniq_x)))]
}

#finding average time for casual/member
df |>
  group_by(member_casual) |>
  summarise(avg_ride_minute = mean(ride_minute))

---
#df to see the overall stats for casual/member cyclists
overview <- df |>
  group_by(member_casual, rideable_type, start_station_name) |>
  summarize(count = n(), avg_ride_minute = mean(ride_minute), 
            max_ride_minute = max(ride_minute), 
            mode_day = get_mode(day_of_week))

#visual DT Table for looking at the overview
datatable(overview, options = list(pageLength = 12))

---
  
#df for each day of casual/member comparison
ride_by_day <- df |>
  group_by(member_casual, day_of_week) |>
  summarise(avg_ride_minute = mean(ride_minute), count = n())

# visual relationship between days and count by member/casual in plot
day_distribution <- ggplot(ride_by_day, aes(x = day_of_week, y = avg_ride_minute)) +
  geom_point(aes(shape = member_casual, color = member_casual, 
                 size = count)) +
  geom_smooth(method = "loess", se = FALSE, aes(color = member_casual)) +
  geom_hline(yintercept = 25.3, linetype = "dashed", color = "pink") +
  geom_hline(yintercept = 12.8, linetype = "dashed", color = "deepskyblue1") +
  geom_text(aes(label = count), position = position_jitter()) +
  labs(title = "Ride Distribution 2024", x = "Day (Mon - Sun)", 
       y = "Average minutes per ride") +
  theme_minimal() +
  scale_y_continuous(labels = comma)

ggplotly(day_distribution)

---
  
#alternate table for heat map

heat_df <- df |>
  select(rideable_type, start_station_name, start_lat, start_lng, 
         member_casual, ride_minute) |>
  group_by(rideable_type, start_station_name, start_lat, start_lng) |>
  summarise(count = n(), avg_ride_minute = mean(ride_minute)) |>
  filter(count > 10000) |>
  arrange(desc(count))

#color palette for count
pal <- colorNumeric(palette = "Reds", domain = heat_df$count)


#visual heat map - dark shade indicate higher usage

library(leaflet)

heat_map <- leaflet() |>
  addTiles() |>
  addCircleMarkers(data = heat_df, lat = heat_df$start_lat, 
                   lng = heat_df$start_lng,
                   color = ~pal(heat_df$count), stroke = TRUE, 
                   radius = 10, weight = 3) |>
  setView(lat = 41.9, lng = -87.6, zoom = 12)

