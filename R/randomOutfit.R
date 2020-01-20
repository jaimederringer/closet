#' Pick a Random Outfit
#'
#' Randomly select a top and a bottom or a one-piece outfit (such as a dress or
#' jumpsuit) and a pair of shoes from the closet dataframe.
#'
#' @param closet.name a closet dataframe containing four variables: 'brand',
#'   'color', 'description', and 'type'.
#' @return An outfit.
#' @examples work <- loadCloset("work_closet.csv")
#' @examples randomOutfit(work)
#'
#' @examples # get an outfit without storing the closet in the R environment
#' @examples randomOutfit(loadCloset("fancy_closet.csv"))
#' @seealso \code{\link{newCloset}}, \code{\link{addItem}},
#'   \code{\link{loadCloset}}
#' @export

randomOutfit <- function(closet.name) {
  shoes_df <- subset(closet.name, type == "shoes")
  shoes <- shoes_df[sample(nrow(shoes_df), 1), ]
  shoes_text <- paste(shoes[1,1],  shoes[1,2], shoes[1,3])

  clothes_df <- subset(closet.name, type != "shoes")
  piece.1 <- clothes_df[sample(nrow(clothes_df), 1), ]
  piece.1_text <- paste(piece.1[1,1],  piece.1[1,2], piece.1[1,3])

  if(piece.1$type == "one-piece") {
    print(paste0(piece.1_text, ", ", shoes_text), quote = F)
  }

  if(piece.1$type == "top") {
    bottoms_df <- subset(closet.name, type == "bottom")
    bottom <- bottoms_df[sample(nrow(bottoms_df), 1), ]
    bottom_text <- paste(bottom[1,1],  bottom[1,2], bottom[1,3])
    print(paste0(piece.1_text, ", ", bottom_text, ", ", shoes_text), quote = F)
  }

  if(piece.1$type == "bottom") {
    top_df <- subset(closet.name, type == "top")
    top <- top_df[sample(nrow(top_df), 1), ]
    top_text <- paste(top[1,1],  top[1,2], top[1,3])
    print(paste0(top_text, ", ", piece.1_text, ", ", shoes_text), quote = F)
  }
}
