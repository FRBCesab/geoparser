#' Dataset: World countries list
#' 
#' @description
#' This dataset contains a list of 256 World countries (geographic entities)
#' according to the GADM database \url{https://gadm.org}.
#'   
#' @format A `data.frame` with 256 rows (geographic entities, official 
#' (or non official) countries) and the 10 following variables:
#' \describe{
#'   \item{iso_alpha2}{the ISO 3166 alpha 2 code of the country}
#'   \item{iso_alpha3}{the ISO 3166 alpha 3 code of the country}
#'   \item{iso_num}{the ISO 3166 numeric code of the country}
#'   \item{geographic_entity}{the name of the country (geographic entity)}
#'   \item{sovereignty}{the name of recognized country (by the UN)}
#'   \item{formal_name}{the formal name of the geographic entity}
#'   \item{parser}{the regular expression used to detect the entity in a full
#'     text}
#'   \item{continent}{the name of the continent where the entity is located}
#'   \item{un_region}{the name of the UN region where the entity is located}
#'   \item{un_subregion}{the name of the UN subregion where the entity is 
#'     located}
#' }
#' 
#' @examples 
#' data("world_countries")
#' head(world_countries)

"world_countries"
