pkgname <- "pkmapr"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
base::assign(".ExTimings", "pkmapr-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('pkmapr')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("get_country")
### * get_country

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: get_country
### Title: Get Pakistan national boundary
### Aliases: get_country

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  pk <- get_country()
  plot(sf::st_geometry(pk))
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("get_country", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("get_districts")
### * get_districts

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: get_districts
### Title: Get Pakistan district boundaries
### Aliases: get_districts

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  all_districts    <- get_districts()
  punjab_districts <- get_districts(province = "Punjab")
  punjab_districts <- get_districts(province = "punjab")  # Case-insensitive
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("get_districts", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("get_provinces")
### * get_provinces

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: get_provinces
### Title: Get Pakistan province boundaries
### Aliases: get_provinces

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  pk <- get_provinces()
  plot(sf::st_geometry(pk))
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("get_provinces", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("get_tehsils")
### * get_tehsils

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: get_tehsils
### Title: Get Pakistan tehsil boundaries
### Aliases: get_tehsils

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  sindh_tehsils  <- get_tehsils(province = "Sindh")
  sindh_tehsils  <- get_tehsils(province = "sindh")  # Case-insensitive
  lahore_tehsils <- get_tehsils(district = "Lahore")
  lahore_tehsils <- get_tehsils(district = "lahore")  # Case-insensitive
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("get_tehsils", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_area")
### * pk_area

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_area
### Title: Recalculate area in km² for an sf object
### Aliases: pk_area

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  districts <- get_districts()
  districts <- pk_area(districts)
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_area", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_basemap")
### * pk_basemap

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_basemap
### Title: Leaflet basemap centred on Pakistan
### Aliases: pk_basemap

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  pk_basemap()
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_basemap", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_bbox")
### * pk_bbox

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_bbox
### Title: Get a bounding box for a named administrative unit
### Aliases: pk_bbox

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  bb <- pk_bbox("Lahore", level = "district")
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_bbox", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_buffer")
### * pk_buffer

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_buffer
### Title: Create buffers around sf geometries in km
### Aliases: pk_buffer

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  districts <- get_districts()
  buffered  <- pk_buffer(districts, dist_km = 10)
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_buffer", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_centroid")
### * pk_centroid

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_centroid
### Title: Extract centroids from an sf object
### Aliases: pk_centroid

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  districts <- get_districts()
  centres   <- pk_centroid(districts)
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_centroid", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_crs_suggest")
### * pk_crs_suggest

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_crs_suggest
### Title: Suggest an appropriate projected CRS for a Pakistan sf object
### Aliases: pk_crs_suggest

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  pk_crs_suggest(get_country())
  pk_crs_suggest(get_districts(province = "Balochistan"))
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_crs_suggest", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_dictionary")
### * pk_dictionary

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_dictionary
### Title: Pakistan Administrative Boundaries Dictionary
### Aliases: pk_dictionary

### ** Examples

## Not run: 
##D   # All provinces
##D   pk_dictionary(level = "provinces")
##D 
##D   # Case-insensitive search for districts containing "lahore"
##D   pk_dictionary(level = "districts", name = "lahore")
##D   pk_dictionary(level = "districts", name = "LAHORE")  # Same result
##D 
##D   # Search by code
##D   pk_dictionary(code = "PK6")
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_dictionary", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_distance")
### * pk_distance

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_distance
### Title: Compute distances between two sf objects in km
### Aliases: pk_distance

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  provinces <- get_provinces()
  d <- pk_distance(provinces, provinces)
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_distance", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_join")
### * pk_join

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_join
### Title: Join data to a pkmapr sf object with match checking
### Aliases: pk_join

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  districts <- get_districts()
  my_data   <- data.frame(district_code = "PK603", value = 42)
  joined    <- pk_join(districts, my_data, by = "district_code")
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_join", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_map")
### * pk_map

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_map
### Title: Quick choropleth map of a pkmapr sf object
### Aliases: pk_map

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  pk_map(get_provinces())
  pk_map(get_provinces(), fill = "area_km2", title = "Province areas")
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_map", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_map_interactive")
### * pk_map_interactive

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_map_interactive
### Title: Interactive choropleth map of a pkmapr sf object
### Aliases: pk_map_interactive

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  districts <- get_districts()
  pk_map_interactive(districts,
                      fill = "area_km2",
                      popup = list("district_name", "area_km2"))
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_map_interactive", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_neighbors")
### * pk_neighbors

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_neighbors
### Title: Construct a spatial neighbours list for Pakistan administrative
###   units
### Aliases: pk_neighbors

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  districts <- get_districts()
  w <- pk_neighbors(districts)

  # Calculate Moran's I using spdep
  moran_result <- spdep::moran.test(districts$area_km2, w$listw)
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_neighbors", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_points_in")
### * pk_points_in

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_points_in
### Title: Assign points to administrative units (point-in-polygon)
### Aliases: pk_points_in

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  # Get district boundaries
  districts <- get_districts()

  # Create sample points (or use your own sf object)
  set.seed(123)
  sample_points <- sf::st_sample(districts, size = 50)
  sample_points_sf <- sf::st_sf(geometry = sample_points)

  # Assign points to districts
  points_with_districts <- pk_points_in(sample_points_sf, districts)
  print(head(points_with_districts))
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_points_in", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_project")
### * pk_project

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_project
### Title: Project an sf object to a Pakistan-appropriate CRS
### Aliases: pk_project

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  districts <- get_districts()
  projected <- pk_project(districts)
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_project", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_search")
### * pk_search

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_search
### Title: Search Across All Administrative Levels
### Aliases: pk_search

### ** Examples

## Not run: 
##D   # Case-insensitive search
##D   pk_search("lahore")   # Returns Lahore district and tehsils
##D   pk_search("LAHORE")   # Same result
##D 
##D   # Fuzzy search for misspelled "lahore"
##D   pk_search("lahor", fuzzy = TRUE)
##D   pk_search("lahre", fuzzy = TRUE)
##D 
##D   # Search by code
##D   pk_search("PK6")
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_search", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_union")
### * pk_union

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_union
### Title: Dissolve sf polygons by a grouping column
### Aliases: pk_union

### ** Examples

## Don't show: 
if (interactive()) withAutoprint({ # examplesIf
## End(Don't show)
  tehsils     <- get_tehsils()
  by_district <- pk_union(tehsils, by = "district_name")
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_union", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pk_version")
### * pk_version

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pk_version
### Title: Check package version and update status
### Aliases: pk_version

### ** Examples

## No test: 
pk_version()
## End(No test)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pk_version", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
