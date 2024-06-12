read.csv("https://raw.githubusercontent.com/cran-task-views/Epidemiology/main/data/source_repositories.csv") |>
  dplyr::rename(package = "package") |>
  dplyr::mutate(github_repo = ifelse(!is.na(github_repo), github_repo, glue::glue('cran/{package}'))) |>
  dplyr::mutate(
    url = glue::glue("https://github.com/{github_repo}"),
    .keep = "unused"
  ) |>
  jsonlite::write_json("packages.json", pretty = TRUE)
