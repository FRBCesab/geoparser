
# Exclude page 1 and last page
# If single word country, search for exact match

x <- pdftools::pdf_text("~/Desktop/chambers2013.pdf")
x <- gsub("\\s+", " ", x)

pattern <- "clark"
pages <- grep(pattern, x, ignore.case = TRUE)
page <- pages[2]

content <- strsplit(x[page], "[[:punct:]]|\\s")[[1]]

grep(paste0("^", pattern, "$"), content, ignore.case = TRUE)


