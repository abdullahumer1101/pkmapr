# Pakistan Administrative Boundaries Dictionary

Search and explore administrative names and codes for Pakistan.

## Usage

``` r
pk_dictionary(level = NULL, name = NULL, code = NULL)
```

## Arguments

- level:

  Character. One of: "provinces", "districts", "tehsils". NULL (default)
  returns all levels.

- name:

  Character. Filter by partial name (case-insensitive).

- code:

  Character. Filter by partial P-code (case-insensitive).

## Value

A data frame with columns: name, level, code, parent.

## Case Insensitivity

All matching in `pk_dictionary()` is **case-insensitive**. "Lahore",
"lahore", and "LAHORE" all return the same results.

## Examples

``` r
if (FALSE) { # \dontrun{
  # All provinces
  pk_dictionary(level = "provinces")

  # Case-insensitive search for districts containing "lahore"
  pk_dictionary(level = "districts", name = "lahore")
  pk_dictionary(level = "districts", name = "LAHORE")  # Same result

  # Search by code
  pk_dictionary(code = "PK6")
} # }
```
