# Quick environment self-test

Checks that installed templates are discoverable and reports available
weeks. Returns `TRUE` invisibly on success.

## Usage

``` r
mccourse_self_test()

mccourse_self_test()
```

## Value

`TRUE` (invisibly) if templates are discoverable; otherwise, an error.

## Examples

``` r
# \donttest{
mccourse_self_test()
#> Found courses: template_course
#>   - template_course weeks: week_01, week_02, week_09
# }
```
