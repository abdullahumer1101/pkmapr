# Search Across All Administrative Levels

Search for administrative units by partial name or code across all
levels (provinces, districts, tehsils).

## Usage

``` r
pk_search(query, fuzzy = FALSE)
```

## Arguments

- query:

  Character. Search term (partial match, case-insensitive).

- fuzzy:

  Logical. If TRUE, uses fuzzy matching for typos. Default FALSE.
  Warning: Fuzzy matching can be slower and may return unexpected
  matches for short or common queries.

## Value

A data frame with columns: name, level, code, parent.

## Case Insensitivity

All matching in `pk_search()` is **case-insensitive** by default.
"Lahore", "lahore", and "LAHORE" all return the same results.

## Fuzzy Matching

When `fuzzy = TRUE`, the function uses approximate string matching to
handle typos and spelling variations. For example, "lahor" will match
"Lahore". This is useful for interactive exploration but may return
unexpected results for ambiguous queries.

## Examples

``` r
if (FALSE) { # \dontrun{
  # Case-insensitive search
  pk_search("lahore")   # Returns Lahore district and tehsils
  pk_search("LAHORE")   # Same result

  # Fuzzy search for misspelled "lahore"
  pk_search("lahor", fuzzy = TRUE)
  pk_search("lahre", fuzzy = TRUE)

  # Search by code
  pk_search("PK6")
} # }
```
