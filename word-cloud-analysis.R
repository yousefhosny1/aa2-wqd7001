library(readxl)
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)

df <- read_excel('student-review.xlsx')
corpus <- Corpus(VectorSource((df$coursecontent)))

corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords, c("get", "told", "gave", "took", "get", "can", "the"))

tdm <- TermDocumentMatrix(corpus)
m <- as.matrix(tdm)
v <- sort(rowSums(m), decreasing = TRUE)
d <- data.frame(word = names(v), freq = v)

wordcloud(d$word, d$freq, random.order = FALSE, rot.per=0.3, scale=c(4,.5), max.words = 101, colors = brewer.pal(8, "Dark2"))
title(main= "Word Cloud - Student Reviews", font.main = 1, cex.main = 1.5)
