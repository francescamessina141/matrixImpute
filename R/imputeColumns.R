#' Impute missing values column-wise
#'
#' Reads a numeric CSV matrix, replaces each missing value with
#' the median of the observed values in the same column, and
#' saves the completed matrix to disk.
#'
#' @param input_file Path to the input CSV file.
#' @param output_file Path to the output CSV file.
#'
#' @return A named list containing:
#' \itemize{
#'   \item \code{n_missing}: number of missing elements in the original matrix.
#'   \item \code{missing_percentage}: percentage of missing elements in the original matrix.
#' }
#'
#' @importFrom stats median
#' @importFrom utils read.csv write.csv
#' @export
#'
#' @examples
#' \dontrun{
#' result <- imputeColumns("matrix_missing.csv", "completed_matrix.csv")
#' result
#' }
imputeColumns <- function(input_file, output_file) {

  # Read the CSV file
  mat <- read.csv(input_file, header = TRUE)

  # Count missing values in the original matrix
  n_missing <- sum(is.na(mat))

  # Calculate the total number of elements
  total <- nrow(mat) * ncol(mat)

  # Calculate the percentage of missing values
  missing_percentage <- (n_missing / total) * 100

  # Replace each missing value with the median of its column
  for (j in 1:ncol(mat)) {
    med <- median(mat[[j]], na.rm = TRUE)
    mat[[j]][is.na(mat[[j]])] <- med
  }

  # Save the completed matrix as CSV
  write.csv(mat, output_file, row.names = FALSE)

  # Return the original missing-value statistics
  return(list(
    n_missing = n_missing,
    missing_percentage = missing_percentage
  ))
}
