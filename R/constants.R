# Data release version
PKMAPR_DATA_VERSION <- "v2023.2"

# Base URL for GitHub Releases
PKMAPR_BASE_URL <- paste0(
  "https://github.com/abdullahumer1101/pkmapr-data/",
  "releases/download/", PKMAPR_DATA_VERSION, "/"
)

# File manifest
PKMAPR_FILES <- list(
  country_simplified    = "pk_country_simplified.gpkg",
  country_full          = "pk_country_full.gpkg",
  provinces_simplified  = "pk_provinces_simplified.gpkg",
  provinces_full        = "pk_provinces_full.gpkg",
  districts_simplified  = "pk_districts_simplified.gpkg",
  districts_full        = "pk_districts_full.gpkg",
  tehsils_simplified    = "pk_tehsils_simplified.gpkg",
  tehsils_full          = "pk_tehsils_full.gpkg",
  dictionary            = "pk_dictionary.csv"
)
