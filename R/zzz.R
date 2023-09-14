.onLoad <- function(libname, pkgname) {
  # Save current setting for option yaml.eval.expr
  yaml_eval_expr <<- getOption("yaml.eval.expr")

  # Set to TRUE so the R code in _pkgdown.yml can be evaluated
  options(yaml.eval.expr = TRUE)
}

.onUnload <- function(libname, pkgname) {
  # Reset to the setting before ericstrava was loaded
  options(yaml.eval.expr = yaml_eval_expr)
}
