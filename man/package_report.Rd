% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reports.R
\name{package_report}
\alias{package_report}
\title{Report on backwards compatibility of a source package}
\usage{
package_report(path = ".", include, exclude = core_packages(),
  cutoff_date = Sys.Date() - 2 * 365, max_n_versions = NULL,
  parallel = FALSE, progress = !parallel, ...)
}
\arguments{
\item{path}{Path to the root of an R source package.}

\item{include}{Packages to include. By default, all are included except core packages and the package at
\code{path} itself.}

\item{exclude}{Packages to exclude from checking. Overrides \code{include}.}

\item{cutoff_date}{Don't check versions before this date (default: 2 years ago). Set to \code{NULL} for no cutoff.}

\item{max_n_versions}{Check at most this number of previous versions. Set to \code{NULL} for no limit.}

\item{parallel}{Run in parallel.}

\item{progress}{Show a progress bar.}

\item{...}{Arguments passed to \code{\link[=call_with_namespace]{call_with_namespace()}}.}
}
\value{
A data frame with three rows:
\itemize{
\item \code{package} for the external package
\item \code{version} for the latest version which caused problems or \code{NA} if there were no problems
\item \code{funs}    a list-column of function names where the API changed
}
}
\description{
\code{package_report} lists all external function calls from a source package
using \code{\link[pkgapi:map_package]{pkgapi::map_package()}}.
It then checks backward-compatibility of each call with previous versions.
}
\section{Parallelism}{

For parallel search, you can set up your own parallel
cluster by using \code{\link[parallel:setDefaultCluster]{parallel::setDefaultCluster()}}; otherwise one will be created, using
\code{getOption("cl.cores")} cores if that is set. If you
set up your own cluster, it will not be stopped automatically (see
\code{\link[parallel:stopCluster]{parallel::stopCluster()}}).
}

\examples{
\dontrun{
package_report(".")
# to include base packages also:
package_report(".", exclude = character(0))
}
}
