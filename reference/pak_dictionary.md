# Look up Pakistan administrative unit names and codes

Returns a tibble of official administrative unit names and PBS geocodes
from the OCHA/HDX source. Use this to find the exact names and codes
expected by geometry functions and
[`pak_join()`](https://abdullahumer1101.github.io/pkmapr/reference/pak_join.md)
before attempting joins or filters.

## Usage

``` r
pak_dictionary(
  level = c("provinces", "districts", "tehsils"),
  province = NULL,
  district = NULL,
  refresh = FALSE
)
```

## Arguments

- level:

  Character. Administrative level. One of "provinces", "districts", or
  "tehsils".

- province:

  Character. Filter to a specific province. Applies when level is
  "districts" or "tehsils". NULL returns all.

- district:

  Character. Filter to a specific district. Applies when level is
  "tehsils". NULL returns all.

- refresh:

  Logical. Force re-download. Default FALSE.

## Value

A tibble.

## Examples

``` r
# \donttest{
  pak_dictionary("provinces")
#> ℹ Downloading pak_dictionary.csv
#> ✔ Downloading pak_dictionary.csv [157ms]
#> 
#> # A tibble: 7 × 2
#>   province_name      province_code
#>   <chr>              <chr>        
#> 1 Azad Kashmir       PK1          
#> 2 Balochistan        PK2          
#> 3 Gilgit Baltistan   PK3          
#> 4 Islamabad          PK4          
#> 5 Khyber Pakhtunkhwa PK5          
#> 6 Punjab             PK6          
#> 7 Sindh              PK7          
  pak_dictionary("districts", province = "Punjab")
#> # A tibble: 36 × 3
#>    province_name district_name   district_code
#>    <chr>         <chr>           <chr>        
#>  1 Punjab        Attock          PK601        
#>  2 Punjab        Bahawalnagar    PK602        
#>  3 Punjab        Bahawalpur      PK603        
#>  4 Punjab        Bhakkar         PK604        
#>  5 Punjab        Chakwal         PK605        
#>  6 Punjab        Chiniot         PK606        
#>  7 Punjab        Dera Ghazi Khan PK607        
#>  8 Punjab        Faisalabad      PK608        
#>  9 Punjab        Gujranwala      PK609        
#> 10 Punjab        Gujrat          PK610        
#> # ℹ 26 more rows
  pak_dictionary("tehsils", district = "Lahore")
#> # A tibble: 2 × 4
#>   province_name district_name tehsil_name  tehsil_code
#>   <chr>         <chr>         <chr>        <chr>      
#> 1 Punjab        Lahore        Lahore Cantt PK61701    
#> 2 Punjab        Lahore        Lahore City  PK61702    
  pak_dictionary("tehsils", province = "Sindh")
#> # A tibble: 125 × 4
#>    province_name district_name   tehsil_name          tehsil_code
#>    <chr>         <chr>           <chr>                <chr>      
#>  1 Sindh         Badin           Badin                PK70101    
#>  2 Sindh         Badin           Matli                PK70102    
#>  3 Sindh         Badin           Shaheed Fazil Rahu   PK70103    
#>  4 Sindh         Badin           Talhar               PK70104    
#>  5 Sindh         Badin           Tando Bago           PK70105    
#>  6 Sindh         Central Karachi Gulberg Town         PK70201    
#>  7 Sindh         Central Karachi Liaqatabad Town      PK70202    
#>  8 Sindh         Central Karachi New Karachi Town     PK70203    
#>  9 Sindh         Central Karachi North Nazimabad Town PK70204    
#> 10 Sindh         Dadu            Dadu                 PK70301    
#> # ℹ 115 more rows
# }
```
