#' Calculate Word Similarity within a chRoma Database
#'
#' Calculate the similarity between two words based on their word vectors within a chRoma database.
#'
#' @param chRoma_db The chRoma database where word vectors are stored.
#' @param word1 The first word.
#' @param word2 The second word.
#'
#' @return The similarity score between the two words.
#'
#' @importFrom chRoma query_collection
#'
#' @examples
#' db <- create_collection()
#' word_vectors <- data.frame(word = c("apple", "banana", "cherry"),
#'                            vector = list(c(0.2, 0.4, 0.6), c(0.1, 0.3, 0.5), c(0.4, 0.2, 0.8)))
#' add_collection(db, word_vectors)
#' word1 <- "apple"
#' word2 <- "banana"
#' calculate_word_similarity(db, word1, word2)
#'
#' @export
calculate_word_similarity <- function(chRoma_db, word1, word2) {
  # Query the chRoma database to retrieve word vectors
  word_info1 <- query_collection(chRoma_db, filter = paste0("word == '", word1, "'"))
  word_info2 <- query_collection(chRoma_db, filter = paste0("word == '", word2, "'"))

  # Check if both words are in the vocabulary
  if (nrow(word_info1$vectors) == 0 || nrow(word_info2$vectors) == 0) {
    stop("One or both words not found in the vocabulary.")
  }

  # Extract the word vectors and convert them to numeric
  word_vector1 <- as.numeric(word_info1$vectors[[1]])
  word_vector2 <- as.numeric(word_info2$vectors[[1]])

  # Check if the conversion was successful
  if (any(is.na(word_vector1)) || any(is.na(word_vector2))) {
    stop("Unable to convert word vectors to numeric.")
  }

  # Calculate cosine similarity
  similarity <- sum(word_vector1 * word_vector2) / (sqrt(sum(word_vector1^2)) * sqrt(sum(word_vector2^2)))

  return(similarity)
}
