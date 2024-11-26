extra_opts <- tibble::tribble(
  ~package, ~subdir,
  "epitweetr", "epitweetr"
)

read.csv("https://raw.githubusercontent.com/cran-task-views/Epidemiology/main/data/source_repositories.csv") |>
  # Remove environmental epidemiology packages
  dplyr::filter(!package %in% c("NADA", "EnvStats", "bkmr", "mediation", "mma", "HIMA")) |>
  dplyr::mutate(github_repo = ifelse(!is.na(github_repo), github_repo, glue::glue('cran/{package}'))) |>
  dplyr::mutate(
    url = glue::glue("https://github.com/{github_repo}"),
    .keep = "unused"
  ) |>
  dplyr::full_join(extra_opts) |>
  jsonlite::write_json("packages.json", pretty = TRUE)
