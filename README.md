# matrixImpute

An R package for column-wise median imputation of missing values in numeric CSV matrices.

## Installation

Install the package from the source package:

```r
install.packages("matrixImpute_0.1.0.tar.gz", repos = NULL, type = "source")
```
## Docker image
Build the Docker image from the Docker workflow directory:
docker build -f dockerfile -t imputation .

## Command-line example
Run the imputation workflow:
Rscript runImputation.R file matrix_missing.csv completed_matrix.csv

## Functions
imputeColumns()
runImputation()
