#' Run matrix imputation using Docker
#'
#' Launches the Docker container used to run the imputation workflow.
#'
#' @param data_dir Local directory containing the input and output files.
#' @param input_name Name of the input CSV file.
#' @param output_name Name of the output CSV file.
#'
#' @return The status code returned by the Docker command.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' runImputation("file", "matrix_missing.csv", "completed_matrix.csv")
#' }
runImputation <- function(data_dir, input_name, output_name) {

  # Build the Docker volume
  volume <- paste0(normalizePath(data_dir), ":/data")

  # Run the Docker container
  system2(
    "docker",
    args = c(
      "run",
      "--rm",
      "-v", volume,
      "imputation",
      paste0("/data/", input_name),
      paste0("/data/", output_name)
    )
  )
}
