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

Returns a data frame (class "data.frame") with the following columns:

- name:

  Matching administrative unit name(s)

- level:

  Administrative level of each match

- code:

  P-code of each match

- parent:

  Parent unit of each match

The output represents all administrative units that match the search
query. When no matches are found, returns invisible NULL with a warning
message. When fuzzy matching is enabled, the output may include
approximate matches that could be useful for handling typos or spelling
variations.

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
# Case-insensitive search
pk_search("lahore")   # Returns Lahore district and tehsils
#> ✔ Found 3 match(es) for: "lahore"
#>           name     level    code parent
#> 1       Lahore districts   PK617 Punjab
#> 2 Lahore Cantt   tehsils PK61701 Lahore
#> 3  Lahore City   tehsils PK61702 Lahore
pk_search("LAHORE")   # Same result
#> ✔ Found 3 match(es) for: "LAHORE"
#>           name     level    code parent
#> 1       Lahore districts   PK617 Punjab
#> 2 Lahore Cantt   tehsils PK61701 Lahore
#> 3  Lahore City   tehsils PK61702 Lahore

# Fuzzy search for misspelled "lahore"
pk_search("lahor", fuzzy = TRUE)
#> ℹ Fuzzy matching enabled. Results may include approximate matches.
#> Set options(pkmapr.fuzzy_warned = TRUE) to suppress this message.
#> ✔ Found 5 match(es) for: "lahor"
#>           name     level    code parent
#> 1       Lahore districts   PK617 Punjab
#> 2     Mulagori   tehsils PK51304 Khyber
#> 3        Lahor   tehsils PK53101  Swabi
#> 4 Lahore Cantt   tehsils PK61701 Lahore
#> 5  Lahore City   tehsils PK61702 Lahore
pk_search("lahre", fuzzy = TRUE)
#> ✔ Found 3 match(es) for: "lahre"
#>           name     level    code parent
#> 1       Lahore districts   PK617 Punjab
#> 2 Lahore Cantt   tehsils PK61701 Lahore
#> 3  Lahore City   tehsils PK61702 Lahore

# Search by code
pk_search("PK6")
#> ✔ Found 176 match(es) for: "PK6"
#>                       name     level    code          parent
#> 1                   Punjab provinces     PK6            <NA>
#> 2                   Attock districts   PK601          Punjab
#> 3             Bahawalnagar districts   PK602          Punjab
#> 4               Bahawalpur districts   PK603          Punjab
#> 5                  Bhakkar districts   PK604          Punjab
#> 6                  Chakwal districts   PK605          Punjab
#> 7                  Chiniot districts   PK606          Punjab
#> 8          Dera Ghazi Khan districts   PK607          Punjab
#> 9               Faisalabad districts   PK608          Punjab
#> 10              Gujranwala districts   PK609          Punjab
#> 11                  Gujrat districts   PK610          Punjab
#> 12               Hafizabad districts   PK611          Punjab
#> 13                   Jhang districts   PK612          Punjab
#> 14                  Jhelum districts   PK613          Punjab
#> 15                   Kasur districts   PK614          Punjab
#> 16                Khanewal districts   PK615          Punjab
#> 17                 Khushab districts   PK616          Punjab
#> 18                  Lahore districts   PK617          Punjab
#> 19                   Leiah districts   PK618          Punjab
#> 20                 Lodhran districts   PK619          Punjab
#> 21         Mandi Bahauddin districts   PK620          Punjab
#> 22                Mianwali districts   PK621          Punjab
#> 23                  Multan districts   PK622          Punjab
#> 24            Muzaffargarh districts   PK623          Punjab
#> 25           Nankana Sahib districts   PK624          Punjab
#> 26                 Narowal districts   PK625          Punjab
#> 27                   Okara districts   PK626          Punjab
#> 28               Pakpattan districts   PK627          Punjab
#> 29          Rahim Yar Khan districts   PK628          Punjab
#> 30                Rajanpur districts   PK629          Punjab
#> 31              Rawalpindi districts   PK630          Punjab
#> 32                 Sahiwal districts   PK631          Punjab
#> 33                Sargodha districts   PK632          Punjab
#> 34             Sheikhupura districts   PK633          Punjab
#> 35                 Sialkot districts   PK634          Punjab
#> 36          Toba Tek Singh districts   PK635          Punjab
#> 37                  Vehari districts   PK636          Punjab
#> 38                  Attock   tehsils PK60101          Attock
#> 39              Fateh Jang   tehsils PK60102          Attock
#> 40             Hasan Abdal   tehsils PK60103          Attock
#> 41                   Hazro   tehsils PK60104          Attock
#> 42                    Jand   tehsils PK60105          Attock
#> 43              Pindi Gheb   tehsils PK60106          Attock
#> 44            Bahawalnagar   tehsils PK60201    Bahawalnagar
#> 45               Chishtian   tehsils PK60202    Bahawalnagar
#> 46              Fort Abbas   tehsils PK60203    Bahawalnagar
#> 47              Haroonabad   tehsils PK60204    Bahawalnagar
#> 48             Minchinabad   tehsils PK60205    Bahawalnagar
#> 49           Ahmadpur East   tehsils PK60301      Bahawalpur
#> 50              Bahawalpur   tehsils PK60302      Bahawalpur
#> 51                Hasilpur   tehsils PK60303      Bahawalpur
#> 52       Khairpur Tamewali   tehsils PK60304      Bahawalpur
#> 53                  Yazman   tehsils PK60305      Bahawalpur
#> 54                 Bhakkar   tehsils PK60401         Bhakkar
#> 55              Darya Khan   tehsils PK60402         Bhakkar
#> 56               Kalur Kot   tehsils PK60403         Bhakkar
#> 57                 Mankera   tehsils PK60404         Bhakkar
#> 58                 Chakwal   tehsils PK60501         Chakwal
#> 59        Choa Saidan Shah   tehsils PK60502         Chakwal
#> 60            Kallar Kahar   tehsils PK60503         Chakwal
#> 61               Tala Gang   tehsils PK60504         Chakwal
#> 62                 Bhawana   tehsils PK60601         Chiniot
#> 63                 Chiniot   tehsils PK60602         Chiniot
#> 64                  Lalian   tehsils PK60603         Chiniot
#> 65  D.G Khan (Tribal Area)   tehsils PK60701 Dera Ghazi Khan
#> 66         Dera Ghazi Khan   tehsils PK60702 Dera Ghazi Khan
#> 67              Kot Chatta   tehsils PK60703 Dera Ghazi Khan
#> 68                  Taunsa   tehsils PK60704 Dera Ghazi Khan
#> 69             Chak Jhumra   tehsils PK60801      Faisalabad
#> 70         Faisalabad City   tehsils PK60802      Faisalabad
#> 71        Faisalabad Sadar   tehsils PK60803      Faisalabad
#> 72               Jaranwala   tehsils PK60804      Faisalabad
#> 73               Summundri   tehsils PK60805      Faisalabad
#> 74           Tandlian Wala   tehsils PK60806      Faisalabad
#> 75              Gujranwala   tehsils PK60901      Gujranwala
#> 76                  Kamoke   tehsils PK60902      Gujranwala
#> 77         Nowshera Virkan   tehsils PK60903      Gujranwala
#> 78               Wazirabad   tehsils PK60904      Gujranwala
#> 79                  Gujrat   tehsils PK61001          Gujrat
#> 80                 Kharian   tehsils PK61002          Gujrat
#> 81           Sarai Alamgir   tehsils PK61003          Gujrat
#> 82               Hafizabad   tehsils PK61101       Hafizabad
#> 83          Pindi Bhattian   tehsils PK61102       Hafizabad
#> 84           Ahmadpur Sial   tehsils PK61201           Jhang
#> 85                   Jhang   tehsils PK61202           Jhang
#> 86                 Shorkot   tehsils PK61203           Jhang
#> 87           Athara Hazari   tehsils PK61204           Jhang
#> 88                    Dina   tehsils PK61301          Jhelum
#> 89                  Jhelum   tehsils PK61302          Jhelum
#> 90         Pind Dadan Khan   tehsils PK61303          Jhelum
#> 91                  Sohawa   tehsils PK61304          Jhelum
#> 92                 Chunian   tehsils PK61401           Kasur
#> 93                   Kasur   tehsils PK61402           Kasur
#> 94        Kot Radha Kishen   tehsils PK61403           Kasur
#> 95                 Pattoki   tehsils PK61404           Kasur
#> 96                Jahanian   tehsils PK61501        Khanewal
#> 97               Kabirwala   tehsils PK61502        Khanewal
#> 98                Khanewal   tehsils PK61503        Khanewal
#> 99             Mian Channu   tehsils PK61504        Khanewal
#> 100                Khushab   tehsils PK61601         Khushab
#> 101               Naushera   tehsils PK61602         Khushab
#> 102                Noorpur   tehsils PK61603         Khushab
#> 103              Quaidabad   tehsils PK61604         Khushab
#> 104           Lahore Cantt   tehsils PK61701          Lahore
#> 105            Lahore City   tehsils PK61702          Lahore
#> 106               Choubara   tehsils PK61801           Leiah
#> 107         Karor Lal Esan   tehsils PK61802           Leiah
#> 108                  Leiah   tehsils PK61803           Leiah
#> 109               Dunyapur   tehsils PK61901         Lodhran
#> 110           Kahror Pacca   tehsils PK61902         Lodhran
#> 111                Lodhran   tehsils PK61903         Lodhran
#> 112               Malakwal   tehsils PK62001 Mandi Bahauddin
#> 113        Mandi Bahauddin   tehsils PK62002 Mandi Bahauddin
#> 114                 Phalia   tehsils PK62003 Mandi Bahauddin
#> 115                Isakhel   tehsils PK62101        Mianwali
#> 116               Mianwali   tehsils PK62102        Mianwali
#> 117                 Piplan   tehsils PK62103        Mianwali
#> 118       Jalalpur Pirwala   tehsils PK62201          Multan
#> 119            Multan City   tehsils PK62202          Multan
#> 120          Multan Saddar   tehsils PK62203          Multan
#> 121               Shujabad   tehsils PK62204          Multan
#> 122                 Alipur   tehsils PK62301    Muzaffargarh
#> 123                  Jatoi   tehsils PK62302    Muzaffargarh
#> 124               Kot Addu   tehsils PK62303    Muzaffargarh
#> 125           Muzaffargarh   tehsils PK62304    Muzaffargarh
#> 126          Nankana Sahib   tehsils PK62401   Nankana Sahib
#> 127            Sangla Hill   tehsils PK62402   Nankana Sahib
#> 128               Shah Kot   tehsils PK62403   Nankana Sahib
#> 129                Narowal   tehsils PK62501         Narowal
#> 130             Shakargarh   tehsils PK62502         Narowal
#> 131               Zafarwal   tehsils PK62503         Narowal
#> 132               Depalpur   tehsils PK62601           Okara
#> 133                  Okara   tehsils PK62602           Okara
#> 134           Renala Khurd   tehsils PK62603           Okara
#> 135              Arif Wala   tehsils PK62701       Pakpattan
#> 136              Pakpattan   tehsils PK62702       Pakpattan
#> 137                Khanpur   tehsils PK62801  Rahim Yar Khan
#> 138              Liaqatpur   tehsils PK62802  Rahim Yar Khan
#> 139         Rahim Yar Khan   tehsils PK62803  Rahim Yar Khan
#> 140              Sadiqabad   tehsils PK62804  Rahim Yar Khan
#> 141                 Jampur   tehsils PK62901        Rajanpur
#> 142               Rajanpur   tehsils PK62902        Rajanpur
#> 143 Rajanpur (Tribal Area)   tehsils PK62903        Rajanpur
#> 144                 Rojhan   tehsils PK62904        Rajanpur
#> 145             Gujar Khan   tehsils PK63001      Rawalpindi
#> 146                 Kahuta   tehsils PK63002      Rawalpindi
#> 147        Kallar Sayaddan   tehsils PK63003      Rawalpindi
#> 148          Kotli Sattian   tehsils PK63004      Rawalpindi
#> 149                 Murree   tehsils PK63005      Rawalpindi
#> 150             Rawalpindi   tehsils PK63006      Rawalpindi
#> 151                 Taxila   tehsils PK63007      Rawalpindi
#> 152            Chichawatni   tehsils PK63101         Sahiwal
#> 153                Sahiwal   tehsils PK63102         Sahiwal
#> 154                Bhalwal   tehsils PK63201        Sargodha
#> 155              Kot Momin   tehsils PK63202        Sargodha
#> 156                Sahiwal   tehsils PK63203        Sargodha
#> 157               Sargodha   tehsils PK63204        Sargodha
#> 158                Shahpur   tehsils PK63205        Sargodha
#> 159             Sillanwali   tehsils PK63206        Sargodha
#> 160                  Bhera   tehsils PK63207        Sargodha
#> 161             Ferozewala   tehsils PK63301     Sheikhupura
#> 162                Muridke   tehsils PK63302     Sheikhupura
#> 163             Safdarabad   tehsils PK63303     Sheikhupura
#> 164             Sharak Pur   tehsils PK63304     Sheikhupura
#> 165            Sheikhupura   tehsils PK63305     Sheikhupura
#> 166                  Daska   tehsils PK63401         Sialkot
#> 167                 Pasrur   tehsils PK63402         Sialkot
#> 168               Sambrial   tehsils PK63403         Sialkot
#> 169                Sialkot   tehsils PK63404         Sialkot
#> 170                  Gojra   tehsils PK63501  Toba Tek Singh
#> 171                Kamalia   tehsils PK63502  Toba Tek Singh
#> 172         Toba Tek Singh   tehsils PK63503  Toba Tek Singh
#> 173              Pir Mahal   tehsils PK63504  Toba Tek Singh
#> 174               Burewala   tehsils PK63601          Vehari
#> 175                 Mailsi   tehsils PK63602          Vehari
#> 176                 Vehari   tehsils PK63603          Vehari
```
