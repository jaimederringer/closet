#' Create a New Closet
#'
#' Creates one or more new csv files with the headers 'brand', 'color',
#' 'description', and 'type'.
#'
#' @param file.name unique file path/name(s) for new csv file(s) with closet
#'   variable names.
#' @examples newCloset(file.name = "work_closet.csv")
#'
#' @examples newCloset(file.name = c("fancy_closet.csv","casual_closet.csv"))
#' @seealso \code{\link{addItem}}, \code{\link{loadCloset}},
#'   \code{\link{randomOutfit}}
#' @export

newCloset <- function(file.name) {
  for (i in 1:length(file.name)) {
    if (file.exists(file.name[i])) {
      warning(paste(file.name[i], 'already exists. Choose a unique file name for newCloset(), or use addItem or loadCloset() to work with an existing closet.'))
    } else {
      write("brand,color,description,type", file = file.name[i])
      message(paste(file.name[i],'created.'))
    }
  }
}
