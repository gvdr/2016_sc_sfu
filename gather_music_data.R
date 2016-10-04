#' This is the function that gets the data from the web
gather_music_data <- function(web_link1,web_link2){
  if( ! is.character(web_link1)) stop("I want an URL!")
  if( ! is.character(web_link2)) stop("I want an URL!")
  
  if( ! url.exists(web_link1)) stop("Internet no good")
  if( ! url.exists(web_link2)) stop("Internet no good")
  
  #' Use url.exists() to check if a web link exists or not
  #' and if not, stop.
  
  msd_data <- read_csv(web_link1) #' this is the MSD data
  genre_data <- read_csv(web_link2) #' this is the genre and lyrics data
  
  music_data <- left_join(msd_data,genre_data, by = "tid") %>%
    select(-ends_with(".x")) %>%
    rename(artist_name = artist_name.y,
           title = title.y)
  
  return(music_data)
}