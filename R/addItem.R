#' Add an Item to Your Closet
#'
#' @param item description of the item.
#' @param type must be one of \code{"top"}, \code{"bottom"}, \code{"one-piece"}
#'   (such as a dress or jumpsuit), or \code{"shoes"}.
#' @param style (optional) one or more style category tags to apply to the item.
#'   Items within a style can be mixed-and-matched (for example, a
#'   capsule wardrobe). Items without an assigned style go with everything!
#' @param closet.file the name of the file containing your closet inventory. If
#'   the file does not exist, it will be created.
#' @return
#' @examples addItem(item = "green skirt", type = "bottom", style = "work",
#'     closet.file = "closet.txt")
#'
#' @examples addItem(item = "black sleeveless jumpsuit", type = "one-piece",
#'     style = c("work","fancy"), closet.file = "closet.txt")
#'
#' @examples addItem(item = "black t-shirt", type = "top",
#'     closet.file = "closet.txt")
#'
#' @examples addItem(item = "brown suede ankle boots", type = "shoes",
#'     closet.file = "closet.txt")
#' @seealso \code{\link{pickOutfit}}
#' @export

addItem <- function(item, type = c("top", "bottom", "one-piece", "shoes"), style = NA, closet.file) {
  if (!file.exists(closet.file)) {
    write("item,type,style", file = closet.file)
    message(paste(closet.file,'created.'))
  }
  write(paste0(item, "," ,type, ",", style), file = closet.file, append = T)
  message(paste(item, 'added to', closet.file))
}
