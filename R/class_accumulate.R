accumulate_new <- function(
  command = NULL,
  settings = NULL,
  cue = NULL,
  value = NULL,
  junction = NULL,
  patternview = NULL
) {
  force(command)
  force(settings)
  force(cue)
  force(value)
  force(junction)
  force(patternview)
  enclass(environment(), c("tar_accumulate", "tar_pattern", "tar_target"))
}

#' @export
target_produce_junction.tar_accumulate <- function(target, pipeline) {
  name <- target$settings$name
  deps <- pattern_get_deps(target, pipeline)
  names <- pattern_name_branches(target_get_parent(target), deps$nibling)
  deps$all[, name] <- c(NA, head(names, -1))
  junction_init(target_get_parent(target), names, deps$all)
}
