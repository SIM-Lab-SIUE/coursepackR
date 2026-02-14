# List Available Weeks

Returns the week identifiers available for a given course, or across all
courses if no course is specified.

## Usage

``` r
list_weeks(course = NULL)
```

## Arguments

- course:

  Character course identifier (e.g., `"mc451"`). If `NULL`, returns the
  union of weeks across all installed courses.

## Value

Character vector of week identifiers (e.g., `"week_01"`, `"week_02"`),
sorted numerically.

## Examples

``` r
list_weeks()
#>  [1] "week_01" "week_02" "week_03" "week_04" "week_05" "week_06" "week_07"
#>  [8] "week_08" "week_09" "week_10" "week_11" "week_12" "week_13" "week_14"
#> [15] "week_15" "week_16" "week_17"
list_weeks("mc451")
#>  [1] "week_01" "week_02" "week_03" "week_04" "week_05" "week_06" "week_07"
#>  [8] "week_08" "week_09" "week_10" "week_11" "week_12" "week_13" "week_14"
#> [15] "week_15" "week_16" "week_17"
```
