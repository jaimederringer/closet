#' Add an Item to an Existing Closet
#'
#' Add an item to one or more closet files.
#'
#' @param brand item brand.
#' @param color item color.
#' @param description description of the item.
#' @param type must be one of "top", "bottom", "one-piece" (such as a dress or jumpsuit), or
#'   "shoes".
#' @param file.name name(s) of closet files to add item to.
#' @return
#' @examples addItem(brand = "Gap", color = "green", description = "sweater",
#'   type = "top", file.name = "work_closet.csv")
#'     # the item will print elsewhere as: brand color description. So this
#'     # item prints as 'Gap green sweater'.
#'
#' @examples addItem(brand = "J. Crew", color = "black",
#'   description = "sleeveless jumpsuit", type = "one-piece",
#'   file.name = c("work_closet.csv","fancy_closet.csv"))
#' @seealso \code{\link{newCloset}}, \code{\link{loadCloset}},
#'   \code{\link{randomOutfit}}
#' @export

addItem <- function(brand, color, description, type = c("top", "bottom", "one-piece", "shoes"), file.name) {
  for (i in 1:length(file.name)) {
    if (!file.exists(file.name[i])) {
      warning(paste(file.name[i], 'does not exist. Create a new closet file using newCloset().'))
    } else {
      write(paste0(brand,",",color,",",description,",",type), file = file.name[i], append = T)
      message(paste(brand, color, description, 'added to', file.name[i]))
    }
  }
}
