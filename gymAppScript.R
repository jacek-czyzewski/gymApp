golem::create_golem("gymApp")

golem::fill_desc(
  pkg_name = "gymApp",
  pkg_title = "App for tracking your gym activity",
  pkg_description = "PKG_DESC.",
  author_first_name = "Jacek",
  author_last_name = "Czyzewski",
  author_email = "jacek.czyzewski@o2.pl",
  repo_url = "https://github.com/jacek-czyzewski/gymApp"
)

golem::set_golem_options()

golem::use_recommended_tests()

golem::use_recommended_deps()

golem::use_utils_ui()

golem::use_utils_server()

library(shinipsum)

usethis::use_package("shinipsum")

golem::add_module(name = 'Home')

golem::add_module(name = 'Exercises')

golem::add_module(name = 'MuscleGroup')

install.packages("shinydashboard")
install.packages("shinydashboardPlus")
usethis::use_package("shinydashboard")
usethis::use_package("shinydashboardPlus")
usethis::use_package("ggplot2")
