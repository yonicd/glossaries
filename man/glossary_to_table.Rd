% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/glossary_utils.R
\name{glossary_to_table}
\alias{glossary_to_table}
\alias{glossary_to_flextable}
\title{Export glossary to  table format}
\usage{
glossary_to_table(entries = get_entries())

glossary_to_flextable(entries = get_entries())
}
\arguments{
\item{entries}{character, entries to export, Default: get_entries()}
}
\value{
data.frame
}
\description{
Convert the internal glossary object to a data.frame
}
\examples{
\dontrun{
if(interactive()){
 #EXAMPLE1
 }
}
}
\seealso{
Other io: 
\code{\link{load_entries}()}

Other io: 
\code{\link{load_entries}()}
}
\concept{io}
