install.packages("readr")
library(readr)

msd_data <- read_csv("http://kris.shaffermusic.com/media/MSDSubset-extracted-data.csv")
genre_data <- read_csv("http://kris.shaffermusic.com/media/MSDSubset-topics.csv")

str(msd_data)

install.packages("tidyverse")
library("tidyverse")

msd_data
genre_data

all.equal(msd_data$tid,genre_data$tid)

all_data <- left_join(msd_data,genre_data, by = "tid") %>%
  select(-ends_with(".x")) %>%
  rename(artist_name = artist_name.y,
         title = title.y)

View(all_data)

link1 <- "http://kris.shaffermusic.com/media/MSDSubset-extracted-data.csv"
link2 <- "http://kris.shaffermusic.com/media/MSDSubset-topics.csv"

link1_broken <- "http://kris.shaffermusic/media/MSDSubset-extracted-data.csv"
link2 <- "http://kris.shaffermusic.com/media/MSDSubset-topics.csv"

is.character(link1)

gather_music_data(link1,link2)

gather_music_data(link1,link2)


gather_music_data(1,2)

install.packages("RCurl")
library(RCurl)

all_data <- gather_music_data(link1,link2)

names(all_data)

all_data %>%
  filter(year > 1000) %>%
  ggplot(aes(x = year, y = song_hotttnesss, color = genre)) +
  geom_point() +
  coord_cartesian(xlim = c(1960,2010))

#' do another plot but with loudness (or anything you want)
#' on the y axis
#' change the shape of the points

all_data %>%
filter(year > 1000) %>%
  ggplot(aes(y = song_hotttnesss, x = loudness, color = genre)) +
  geom_point() +
  geom_smooth(method = "lm")

music_plotter(all_data,do_smooth = FALSE)


our_plot <- music_plotter(all_data,"year","loudness","mode",do_smooth = TRUE)

all_data %>%
  filter(genre %in% c("Rock","Pop")) %>%
music_plotter("year","loudness","genre",do_smooth = TRUE) +
  theme_classic()
