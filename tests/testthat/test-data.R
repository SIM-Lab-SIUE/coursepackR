test_that("unified_music dataset loads correctly", {
  data("unified_music", package = "coursepackR", envir = environment())
  expect_s3_class(unified_music, "data.frame")
  expect_equal(nrow(unified_music), 1792L)
  expect_true("Max_Rank" %in% names(unified_music))
  expect_true("danceability" %in% names(unified_music))
  expect_true("valence" %in% names(unified_music))
})
