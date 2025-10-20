cmake_minimum_required(VERSION 3.12)
project(incrementalqr)

# Set the path to pybind11
set(pybind11_DIR "/Users/pren/miniconda3/envs/tensor/lib/python3.12/site-packages/pybind11/share/cmake/pybind11")
#You will have to update this path sorry 

# Find pybind11
find_package(pybind11 REQUIRED)

# Specify the path to LAPACK installation
list(APPEND CMAKE_PREFIX_PATH "/opt/homebrew/opt/lapack")

# Find LAPACK and LAPACKE
find_package(LAPACK REQUIRED)
find_path(LAPACK_INCLUDE_DIR NAMES "lapacke.h" PATHS "/opt/homebrew/lapack/include")
find_library(LAPACK_LIBRARIES NAMES "lapack" PATHS "/opt/homebrew/lapack/lib")

# Find BLAS
set(BLAS_INCLUDE_DIR /opt/homebrew/opt/openblas/include)
include_directories(${BLAS_INCLUDE_DIR})

find_package(BLAS REQUIRED)
# find_path(BLAS_INCLUDE_DIR NAMES "cblss.h" PATHS "/opt/homebrew/opt/openblas/include")
find_library(BLAS_LIBRARIES NAMES "blas" PATHS "/opt/homebrew/opt/openblas/lib")

# Include directories for LAPACK and BLAS
include_directories(${LAPACK_INCLUDE_DIR} ${BLAS_INCLUDE_DIR})

# Create the incrementalqr library
add_library(incrementalqr MODULE incrementalqr.cpp)
target_link_libraries(incrementalqr PRIVATE pybind11::module LAPACK::LAPACK ${LAPACK_LIBRARIES} ${BLAS_LIBRARIES})