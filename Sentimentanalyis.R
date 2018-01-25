# Create WordCloud #

library(twitteR)
library(tm)
library(wordcloud)
library(RCurl)

# get the below information from Twitter API

consumer_key <- "........................."
consumer_secret <-"..............................................."
access_token <- ".................................................."
access_secret <- "................................................"

# Provide all the above four information and type 1 and commit to continue

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
1
twt <- twitteR::searchTwitter('#Healthcare', n=500)
twtdf <- twitteR::twListToDF(twt)
str(twtdf)
class(twtdf)

write.csv(twtdf, "C:/Users/~/Documents/~/twtdata.csv")
read.csv("C:/Users/~/Documents/~/twtdata.csv")

# Below codes are self explainatory


twt_txt <- sapply(twt, function(x) x$getText())
str(twt_txt)
twt_corpus <- Corpus(VectorSource(twt_txt))
inspect(twt_corpus)
twt_clean <- tm_map(twt_corpus, removePunctuation)
twt_clean <- tm_map(twt_clean, content_transformer(tolower))
twt_clean <- tm_map(twt_clean, removeWords, stopwords("english"))
twt_clean <- tm_map(twt_clean, removeWords, stopwords("english"))
twt_clean <- tm_map(twt_clean, removeNumbers)
twt_clean <- tm_map(twt_clean, stripWhitespace)

# Create wordcloud with different combinations

wordcloud(twt_clean)
wordcloud(twt_corpus)
wordcloud(twt_clean, random.order = F, random.color = T)
warnings()
wordcloud(twt_clean, random.order = F)
warnings()
wordcloud(twt_clean, max.words = 100, random.order = F)
wordcloud(twt_clean, max.words = 100, random.order = F, min.freq = 5)

#end
