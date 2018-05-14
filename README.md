# quantitray
An R package to calculate MPN (most probable number) from IDEXX Quanti-Tray, Quanti-Tray/2000, and Quanti-Tray/Legiolert tests.

## Quanti-Tray tests

Quanti-Tray tests allow to quantify bacterial counts in water samples. IDEXX Technologies offer three types of Quanti-Tray trays: Quanti-Tray (with 51 large wells), Quanti-Tray/2000 (with 49 large trays and 48 small trays), and Quanti-Tray/Legiolert (with 6 large trays and 90 small wells).

![Quantitrays](https://www.janknappe.com/quantitray/docs/quantitrays.png)

For detailed description on how to use the tests and interprete the test results, please refer to the documentation provided by the manufacturer here: [https://www.idexx.com/en/water/water-products-services/quanti-tray-system/](https://www.idexx.com/en/water/water-products-services/quanti-tray-system/)

Quanti-Tray and Quanti-Tray/2000 are used for quantifying coliforms, E. coli, enterococci, Pseudomonas aeruginosa, and Heterotrophic Plate Counts (HPC).Quanti-Tray/Legiolert is used for quantifying Legionella pneumophila.

## Converting from well counts to bacterial counts

### Solutions provided by the manufacturer

The manufacturer provides printable lookup tables on its website to convert from well counts to bacterial counts.

The manufacturer also provides a Windows-based software solution for download on its website to convert from well counts to bacterial counts.

### Solutions provided in this package

This package offers a set of functions to convert well counts to bacterial counts in R using the lookup tables provided by the manufacturer.

#### Installation

```r
devtools::install_github("jknappe/quantitray")
```

#### Load the package

```r
library(quantitray)
```

#### Conversion functions

This package introduces conversion functions from well counts to bacterial counts:

- `quantify_mpn(large, small, method)` to convert well counts to numeric point estimate MPN (in MPN/100 ml)
- `quantify_95lo(large, small, method)` to convert well counts to numeric lower 95% confidence interval MPN (in MPN/100 ml)
- `quantify_95hi(large, small, method)` to convert well counts to numeric upper 95% confidence interval MPN (in MPN/100 ml)

#### Arguments

- `large` needs to be a positive integer representing the number of positive large wells counted (mandatory for all methods)
- `small` needs to be a positive integer representing the number of positive small wells counted (mandatory for methods "qt-2000" and "qt-legio)
- `method` specifies the Quanti-Tray method used: "qt" for Quanti-Tray, "qt-2000" for Quanti-Tray/2000, "qt-legio" for Quanti-Tray/Legiolert (mandatory)

#### Edge cases

To provide coherent function output (numeric values or a list of numeric values), values above and below the method detection limit are handled as follows:
- For results below the detection limit (no positive wells), the quare root of the method detection limit is returned as point estimate.
- For results above the method detection limit (all positive wells), only the lower confidence interval is returned as numeric value, whereas point estimate and upper confidence interval are returned as `NA`.

#### Lookup tables

The lookup tables provided by the manufacturer can be accessed in R after the package is loaded. This might be useful to implement reverse lookups.

- `quanti_51` provides data for the QuantiTray (including MPN point estimate and 95% confidence intervals)
- `quanti_96` provides data for the QuantiTray/Legiolert (only MPN point estimate; confidence intervals are not provided)
- `quanti_97` provides data for the QuantiTray/2000 (including MPN point estimate and 95% confidence intervals)
