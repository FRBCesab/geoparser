#' Detect countries names
#'
#' @param x a `character` in which countries will be detected. 
#'
#' @return a `data.frame` with the following four columns:
#'   - `geographic_entity`: the name of the country
#'   - `n_pages`: the total number of pages in the document
#'   - `page`: the page number
#'   - `count`: the occurrence of the country for a given page
#' 
#' @export
#'
#' @examples
#' ## Example document ----
#' texte <- c(
#'   "
#'   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod 
#'   tempor incididunt US labore et dolore magna aliqua. USA enim ad minim 
#'   veniam, quis nostrud exercitation ullamco laboris United States
#'   ",
#'   "
#'   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod 
#'   tempor incididunt US labore et dolore magna aliqua. USA enim ad minim 
#'   veniam, quis nostrud exercitation ullamco laboris Canada.
#'   "
#' )
#' 
#' ## Detect countries ----
#' geoparser(texte)

geoparser <- function(x) {
  
  
  ## Check args ----
  
  if (missing(x)) {
    stop("Argument 'x' is required", call. = FALSE)
  }
  
  if (!is.character(x)) {
    stop("Argument 'x' must be a character", call. = FALSE)
  }
  
  if (any(is.na(x))) {
    stop("Argument 'x' cannot contain NA", call. = FALSE)
  }
  
  
  ## Import patterns ----
  
  world_countries <- world_countries[!is.na(world_countries$"parser"), ]
  countries <- world_countries$"parser"

  
  ## Clean patterns ----
  
  countries <- gsub("-", " ", countries)
  
  
  ## Clean content ----
  
  x <- strsplit(x, "\t|\n|\\s{2,}")  
  
  x <- lapply(x, function(.) gsub("[[:punct:]]", " ", .))
  x <- lapply(x, function(.) gsub("\\s{1,}", " ", .))
  x <- lapply(x, function(.) trimws(.))
  x <- lapply(x, function(.) tolower(.))
  x <- lapply(x, function(.) paste0(., collapse = " "))

  x <- unlist(x)
  
  
  ## Detect patterns ----
  
  detections <- lapply(x, function(page) {
    
    unlist(lapply(countries, function(country) {
      
      country <- c(
        paste0("^",   unlist(strsplit(country, "\\|")), "$",   collapse = "|"),
        paste0("^",   unlist(strsplit(country, "\\|")), "\\s", collapse = "|"),
        paste0("\\s", unlist(strsplit(country, "\\|")), "$",   collapse = "|"),
        paste0("\\s", unlist(strsplit(country, "\\|")), "\\s", collapse = "|")
      )
      
      country <- paste0(country, collapse = "|")
      
      length(unlist(stringr::str_extract_all(page, country)))
    })) 
  })
  
  
  ## Arrange object ----
  
  detections <- do.call(cbind.data.frame, detections)
  colnames(detections) <- paste0("page", 1:ncol(detections))
  
  detections <- data.frame(
    "geographic_entity" = world_countries$"geographic_entity",
    detections)
  
  detections <- tidyr::pivot_longer(detections, cols = -1, 
                                    names_to = "page", values_to = "count")
  
  detections <- as.data.frame(detections)
  
  detections$"page"   <- as.numeric(gsub("page", "", detections$"page"))
  detections$"n_page" <- length(x)
  

  ## Keep only matches ----
  
  detections <- detections[detections$"count" > 0, ]
  
  detections <- detections[with(detections, order(page, count)), c(1, 4, 2, 3)]
  
  rownames(detections) <- NULL
  
  detections
}
