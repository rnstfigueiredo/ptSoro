# Building a Prod-Ready, Robust Shiny Application.
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev scripts before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
#
#
########################################
#### CURRENT FILE: ON START SCRIPT #####
########################################

## Fill the DESCRIPTION ----
## Add meta data about your application
##
## /!\ Note: if you want to change the name of your app during development,
## either re-run this function, call golem::set_golem_name(), or don't forget
## to change the name in the app_sys() function in app_config.R /!\
##
golem::fill_desc(
  pkg_name = "soro", # The Name of the package containing the App
  pkg_title = "soro", # The Title of the package containing the App
  pkg_description = "Pontos de Distribuição Soro", # The Description of the package containing the App
  author_first_name = "Rnst/Gisele", # Your First Name
  author_last_name = "Figueiredo/Lima", # Your Last Name
  author_email = "emfigueiredo@saude.sp.gov.br/gdflima@saude.sp.gov.br", # Your Email
  repo_url = NULL, # The URL of the GitHub Repo (optional),
  pkg_version = "0.0.1.0001" # The Version of the package containing the App
)

## Set {golem} options ----
golem::set_golem_options()

## Install the required dev dependencies ----
golem::install_dev_deps()

## Create Common Files ----
## See ?usethis for more information
#usethis::use_mit_license("Golem User") # You can set another license here
usethis::use_apache_license(version = 2, include_future = TRUE)
usethis::use_readme_rmd(open = FALSE)
devtools::build_readme()
# Note that `contact` is required since usethis version 2.1.5
# If your {usethis} version is older, you can remove that param
usethis::use_code_of_conduct(contact = "Golem User")
usethis::use_lifecycle_badge("Experimental")
usethis::use_news_md(open = FALSE)

## Use git ----
usethis::use_git()

## Init Testing Infrastructure ----
## Create a template for tests
golem::use_recommended_tests()

## Favicon ----
# If you want to change the favicon (default is golem's one)
golem::use_favicon("favicon.png") # path = "path/to/ico". Can be an online file.
golem::use_favicon("/home/rnst/dev/R-Developer/dev/skellNew2k240217/skellB/www/favicon.png", pkg = golem::get_golem_wd(), method = "curl")
 golem::remove_favicon() # Uncomment to remove the default favicon

## Add helper functions ----
golem::use_utils_ui(with_test = TRUE)
golem::use_utils_server(with_test = TRUE)

# You're now set! ----

golem::amend_golem_config(key = "userdb",
                          value = "XXXXXX",
                          config = "severkey")

golem::amend_golem_config(key = "password",
                          value = "XXXXXXX",
                          config = "severkey")

golem::amend_golem_config(key = "dbname",
                          value = "dados",
                          config = "severkey")

golem::amend_golem_config(key = "hostlocal",
                          value = "localhost",
                          config = "severkey")
golem::amend_golem_config(key = "host",
                          value = "192.168.0.1",
                          config = "severkey")

attachment::att_amend_desc()

# go to dev/02_dev.R
rstudioapi::navigateToFile("dev/02_dev.R")
