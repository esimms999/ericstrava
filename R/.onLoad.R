.onLoad <- function(libname, pkgname) {
  options(yaml.eval.expr = TRUE)

  packageStartupMessage("Setting options(yaml.eval.expr=TRUE) via .onLoad")
  cat("Hello from me!")

  run_on_load()
}
