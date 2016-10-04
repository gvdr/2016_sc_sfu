readFile <- function(filename, header=TRUE) {
  data <- read.table(file=filename, header=header, sep=',')
  print(dim(data))
}

args <- commandArgs(trailingOnly = TRUE)
if (length(args) > 0) {   # reading from files listed as arguments
  for (filename in args) {
    cat('reading from',filename,'\n')
    readFile(filename, header=TRUE)
  }
} else {   # reading from standard input
  readFile(file("stdin"), header=FALSE)
}
