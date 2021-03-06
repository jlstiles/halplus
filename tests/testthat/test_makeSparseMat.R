library(hal)
library(testthat)

context("makeSparseMat")

# TODO: need to run some specific tests on this method.

# Number of covariates to use.
d <- 5

# Sample size
n <- 500

# Simulate some data, all continuous covariates.
set.seed(1)
x = data.frame(matrix(rnorm(n * d), ncol = d))

sparse_mat = hal::makeSparseMat(x)
str(sparse_mat)

# Convert to a normal matrix.
normal_mat = as.matrix(sparse_mat)
str(normal_mat)

# Compare object sizes.
library(pryr)
object_size(sparse_mat)
object_size(normal_mat)

# We use about 1/3 of the memory due to the sparse matrix.
as.numeric(object_size(sparse_mat)) / as.numeric(object_size(normal_mat))
