# Load the chRoma package
library(chRoma)

# Create a new empty vector database
db <- create_collection()

# Sample word vectors (store them as numeric)
word_vectors <- data.frame(
  vector = list(as.numeric(c(0.2, 0.4, 0.6)), as.numeric(c(0.1, 0.3, 0.5)), as.numeric(c(0.4, 0.2, 0.8))),
  row.names = c("apple", "banana", "cherry")  # Use row names for word identifiers
)

# Sample metadata (three entries) with the 'word' column
metadata <- list(
  list(word = "apple", description = "Description of apple"),
  list(word = "banana", description = "Description of banana"),
  list(word = "cherry", description = "Description of cherry")
)

# Add word vectors and metadata to the database
db <- add_collection(db, word_vectors, metadata)

# Save the chRoma database to a file (e.g., using saveRDS)
saveRDS(db, file = "my_chroma_db.rds")

# Load the database
db <- readRDS("my_chroma_db.rds")

# Convert the 'vector' column to numeric
db$vectors$vector <- lapply(db$vectors$vector, as.numeric)

# Check the class of the first element of 'vector'
class(db$vectors$vector[[1]])










