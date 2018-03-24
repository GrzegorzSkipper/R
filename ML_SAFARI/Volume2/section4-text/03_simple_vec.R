library(tm)

text = c('Happy Birthday to you',
         'Happy Birthday dear happy viewer',
         'Happy Birthday to you',
         'And many more')

corp <- VCorpus(VectorSource(text))
corp <- tm_map(corp, stripWhitespace)
corp <- tm_map(corp, content_transformer(tolower))

lapply(corp[1:4], as.character)

dtm <- DocumentTermMatrix(corp)

as.matrix(dtm)
inspect(dtm)

print(findFreqTerms(dtm, 2))
print(findFreqTerms(dtm, 3))

as.matrix(dtm)
corp_nostop <- tm_map(corp, removeWords, stopwords('english'))
dtm2 <- DocumentTermMatrix(corp_nostop, 
                           control = list(
                             weighting = weightTfIdf))
as.matrix(dtm2)
setdiff(colnames(dtm), colnames(dtm2))
