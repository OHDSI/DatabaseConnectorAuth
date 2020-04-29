# @file DatabaseConnectorAuth.R
#
# Copyright 2020 Observational Health Data Sciences and Informatics
#
# This file is part of DatabaseConnectorJars
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#' DatabaseConnectorAuth
#'
#' This package provides Windows integrated authenication DLL for \code{sqljdbc42}
#'
#' @docType package
#' @name DatabaseConnectorAuth
NULL

.onLoad <- function(libname, pkgname) {
  path <- getAuthDllPath()
  if (!is.null(path)) {
    Sys.setenv("PATH_TO_AUTH_DLL" = path)
  }
}

#' Get authenication DLL path for \code{sqljdbc42}
#'
#' This function returns the package path to the Windows integrated authenication DLL
#' for \code{sqljbdc42}.
#'
#' @export
getAuthDllPath <- function() {
  platform <- R.Version()$platform
  path <- NULL
  if (platform == "x86_64-w64-mingw32") {
    path = system.file("dll", "x64", package = "DatabaseConnectorAuth")
  }
  return(path)
}
