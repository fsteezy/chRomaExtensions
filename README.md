# chRomaExtensions
Provides functions for extending the functionality of the chRoma package, including word vector similarity calculations. 

# Installation
You can install the package from GitHub with:
```
install.packages("devtools")
devtools::install_github("fsteezy/chRomaExtensions")
```

# Usage
Here is a basic example:
#Load the package
```
library(chRomaExtensions)
```
#Create a chRoma database
```
db <- create_collection()
```

#Add word vectors and metadata to the database (you can provide your own data)
```word_vectors <- data.frame(
  word = c("apple", "banana", "cherry"),
  vector = list(c(0.2, 0.4, 0.6), c(0.1, 0.3, 0.5), c(0.4, 0.2, 0.8)))
metadata <- list(
  list(word = "apple", description = "Description of apple"),
  list(word = "banana", description = "Description of banana"),
  list(word = "cherry", description = "Description of cherry"))

db <- add_collection(db, word_vectors, metadata)
```

#Calculate word similarity
```word1 <- "apple"
word2 <- "banana"
similarity <- calculate_word_similarity(db, word1, word2)
print(paste("Similarity between", word1, "and", word2, "is", similarity))
```
# Testing
You can run the package tests with:
```
devtools::test()
```
# Acknowledgments
This package relies on the `chRoma` package for managing word vectors and performing various operations on them. We would like to extend our gratitude to the authors and contributors of the `chRoma` package for their hard work and open-source contributions. Without their efforts, this package would not have been possible. You can find more information about the `chRoma` package https://github.com/wincowgerDEV/chRoma.
