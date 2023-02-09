text <- pdftools::pdf_text("~/Desktop/test.pdf")
text <- text[-1]
text <- paste0(text, collapse = "\n")
text <- gsub("\\s{1,}", " ", text)
text <- tolower(text)
text <- strsplit(text, "references")[[1]]
text <- unlist(text[1:(length(text) - 1)])
text <- paste0(text, collapse = "\n")
# caesura
# remove punct + numbers

# https://vincentarelbundock.github.io/countrycode/index.html

all_country <- countrycode::countryname_dict |>
  dplyr::filter(grepl('[A-Za-z]', country.name.alt)) |>
  dplyr::pull(country.name.alt)|>
  tolower()

all_country <- unique(countrycode::countryname_dict$country.name.en)

all_country <- paste0("([[:punct:]]|\\s|[0-9])", all_country, "([[:punct:]]|\\s|[0-9])")
pattern   <- stringr::str_c(all_country, collapse = '|')

countries <- stringr::str_extract_all(tolower(text), tolower(pattern))
countries <- unlist(countries)

countries <- sort(table(countries))
names(countries) <- gsub("[[:punct:]]|\\s|[0-9]", "", names(countries))

dat <- data.frame(countries)
colnames(dat) <- c("country", "n")
countries <- tapply(INDEX = dat$"country", X = dat$"n", sum)
dat <- data.frame(country = names(countries), n = countries)
rownames(dat) <- NULL
