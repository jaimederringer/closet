#' Load an Existing Closet
#'
#' Load a closet dataframe from a csv file. The file must include four variables
#' with the headers: 'brand', 'color', 'description', and 'type' (one of 'top',
#' 'bottom', 'one-piece', or 'shoes'). It can be generated using
#' \code{\link{newCloset}} and \code{\link{addItem}}.
#'
#' @param file.name  name of the closet csv file to load.
#' @return
#' @examples work <- loadCloset("work_closet.csv")
#' @seealso \code{\link{newCloset}}, \code{\link{addItem}},
#'   \code{\link{randomOutfit}}
#' @export

loadCloset <- function(file.name) {
  if (!file.exists(file.name)) {
    warning(paste(file.name, 'does not exist. Create a new closet file using newCloset().'))
  } else {
    df <- as.data.frame(read.table(file.name, header=T, sep = ",", stringsAsFactors = FALSE))
    return(df)
  }
}
