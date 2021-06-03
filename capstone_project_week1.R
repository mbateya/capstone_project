temp <- tempfile()
download.file(
  "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip",
  temp,
  mode = "wb"
)
unzip(temp)
library(tidyverse)
twitter <- read_lines("./en_US/en_US.twitter.txt")
blogs <- read_lines("./en_US/en_US.blogs.txt")
news <-  read_lines("./en_US/en_US.news.txt")
twitter_df <- tibble(twitter)
blogs_df <- tibble(blogs)
news_df <- tibble(news)
# finding the longest string in each dataframe
twitter_max <- max(nchar(twitter_df$twitter))
blogs_max <- max(nchar(blogs_df$blogs))
news_max <- max(nchar(news_df$news))
twitter_love <- nrow(filter(twitter_df,grepl("love",twitter)))
twitter_hate <- nrow(filter(twitter_df,grepl("hate",twitter)))
love_hate_ratio <- twitter_love/twitter_hate
twitter_biostats <- filter(twitter_df,grepl("biostats",twitter))
twitter_biostats$twitter

twitter_exact <- nrow(filter(twitter_df,
                             twitter=="A computer once beat me at chess, but it was no match for me at kickboxing"))