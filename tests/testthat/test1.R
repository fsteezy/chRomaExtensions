
test_that("test the word sim function", {
  library(data.table)
  word_vectors <- data.table(word = c("apple", "banana", "cherry"))
  metadata <-  add_collection(vectors = list(c(0.2, 0.4, 0.6), c(0.1, 0.3, 0.5), c(0.4, 0.2, 0.8)), metadata = word_vectors)
  word1 <- "cherry"
  word2 <- "banana"
  similarity <- calculate_word_similarity(metadata, word1, word2)
  expect_identical(round(similarity, 3), round(0.9221389, 3))
})
