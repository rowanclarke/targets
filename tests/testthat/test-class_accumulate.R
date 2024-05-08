tar_test("run an accumulation", {
  tar_script(
    list(
      tar_target(x, c(1, 2, 3)),
      tar_target(y, if (exists("y")) x + y else x, map(x), accumulate = TRUE),
      tar_target(z, y + 1, map(y))
    )
  )
  tar_make(callr_function = NULL)
  expect_equal(tar_read(y) |> unname(), c(1, 3, 6))
  browser()
  tar_script(
    list(
      tar_target(x, c(1, 2, 4)),
      tar_target(y, if (exists("y")) x + y else x, map(x), accumulate = TRUE),
      tar_target(z, y + 1, map(y))
    )
  )
  tar_make()
})