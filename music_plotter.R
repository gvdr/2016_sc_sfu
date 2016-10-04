music_plotter <- function(music_data,
                          xvariable,
                          yvariable,
                          colorvariable,
                          do_smooth) {
  music_plotted <- music_data %>%
    filter(year > 1000) %>%
    ggplot(aes_string(y = yvariable, x = xvariable, color = colorvariable)) +
    geom_point()
  
  if(do_smooth){
    music_plotted <- music_plotted +
      geom_smooth(method = "lm")
  } else {
    music_plotted <- music_plotted
  }
  
  return(music_plotted)
}