# pkmapr: Pakistan Spatial Data Toolkit

Provides a tidy interface to Pakistan's official administrative boundary
data from the United Nations Office for the Coordination of Humanitarian
Affairs (OCHA). Downloads and caches spatial data at country, province,
district, and tehsil levels as `sf` objects compatible with the
tidyverse and geospatial ecosystem.

## Value

No return value, called for package documentation and namespace
management.

## Key functions

- Data loading:

  [`get_districts`](https://abdullahumer1101.github.io/pkmapr/reference/get_districts.md),
  [`get_tehsils`](https://abdullahumer1101.github.io/pkmapr/reference/get_tehsils.md),
  [`get_provinces`](https://abdullahumer1101.github.io/pkmapr/reference/get_provinces.md),
  [`get_country`](https://abdullahumer1101.github.io/pkmapr/reference/get_country.md):
  Download administrative boundaries at different levels.

- Lookup:

  [`pk_dictionary`](https://abdullahumer1101.github.io/pkmapr/reference/pk_dictionary.md):
  Look up official names and PBS geocodes.

- Joining:

  [`pk_join`](https://abdullahumer1101.github.io/pkmapr/reference/pk_join.md):
  Join external data with administrative units, with match checking.

- Spatial weights:

  [`pk_neighbors`](https://abdullahumer1101.github.io/pkmapr/reference/pk_neighbors.md):
  Build spatial weights for spdep and spatialreg.

- Visualisation:

  [`pk_map`](https://abdullahumer1101.github.io/pkmapr/reference/pk_map.md),
  [`pk_map_interactive`](https://abdullahumer1101.github.io/pkmapr/reference/pk_map_interactive.md):
  Quick choropleth maps with ggplot2 or leaflet.

## Package options

`pkmapr` uses the following global options:

- `pkmapr_use_cache`:

  Logical. If `TRUE`, caches downloaded data in a persistent user
  directory. Default `FALSE` (uses temporary directory).

- `pkmapr_refresh`:

  Logical. Re-download data even if cached copy exists. Default `FALSE`.

## References

United Nations Office for the Coordination of Humanitarian Affairs
(OCHA). Pakistan Administrative Boundaries. <https://data.humdata.org/>

## See also

Useful links:

- [Package website](https://abdullahumer1101.github.io/pkmapr/)

- [Source code](https://github.com/abdullahumer1101/pkmapr/)

- [Bug reports](https://github.com/abdullahumer1101/pkmapr/issues)

## Author

**Maintainer**: Abdullah Umer <abdullahumer1101@gmail.com>
([ORCID](https://orcid.org/0009-0008-4082-8394))
