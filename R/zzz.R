.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "coursepackR ", utils::packageVersion("coursepackR"), "\n",
    "Textbook: https://sim-lab-siue.github.io/vibes-to-variables/\n",
    "Course site: https://sim-lab-siue.github.io/liaison-program/\n",
    "Run mccourse_check() to verify your environment."
  )
}
