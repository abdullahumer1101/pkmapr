# Data release version — update when new processed data is released
PKMAPR_DATA_VERSION <- "v2023.1"

# Base URL for GitHub Releases
PKMAPR_BASE_URL <- paste0(
  "https://github.com/abdullahumer1101/pkmapr-data/",
  "releases/download/", PKMAPR_DATA_VERSION, "/"
)

# File manifest
PKMAPR_FILES <- list(
  country_simplified    = "pak_country_simplified.gpkg",
  country_full          = "pak_country_full.gpkg",
  provinces_simplified  = "pak_provinces_simplified.gpkg",
  provinces_full        = "pak_provinces_full.gpkg",
  districts_simplified  = "pak_districts_simplified.gpkg",
  districts_full        = "pak_districts_full.gpkg",
  tehsils_simplified    = "pak_tehsils_simplified.gpkg",
  tehsils_full          = "pak_tehsils_full.gpkg",
  dictionary            = "pak_dictionary.csv"
)
