#' Pick a Random Outfit
#'
#' @param closet.file the name of the file containing your closet inventory. See 
#'     \code{\link{addItem}} to build a closet.
#' @param style (optional) category from which to select items. The default 
#'     \code{style = NULL} picks an outfit from all items in your closet.
#' @return Returns a character string outfit consisting of a top and a bottom, or a 
#'     one-piece outfit (such as a dress or jumpsuit), and a pair of shoes. 
#' @examples pickOutfit("closet.txt", style = "work")
#' @seealso \code{\link{addItem}}
#' @export

pickOutfit <- function(closet.file, style = NULL) {
  if (!file.exists(closet.file)) {
    warning(paste(closet.file, 'does not exist. Build a closet using addItem().'))
  } else {
    load_closet = as.data.frame(read.csv(closet.file))
    if (is.null(style)) {
      use_closet <- load_closet
    } else {
      flex_list <- load_closet[is.na(load_closet$style),]
      restrict <- style
      style_list <- subset(load_closet, style == restrict)
      use_closet <- merge(flex_list, style_list, all = T)
    }
    shoes_df <- subset(use_closet, type == "shoes")
    shoes <- shoes_df[sample(nrow(shoes_df), 1), ]

    clothes_df <- subset(use_closet, type != "shoes")
    piece.1 <- clothes_df[sample(nrow(clothes_df), 1), ]

    if(piece.1$type == "one-piece") {
      print(paste0(piece.1$item, ", ", shoes$item), quote = F)
    }
    
    if(piece.1$type == "top") {
      bottoms_df <- subset(use_closet, type == "bottom")
      bottom <- bottoms_df[sample(nrow(bottoms_df), 1), ]
      print(paste0(piece.1$item, ", ", bottom$item, ", ", shoes$item), quote = F)
    }
    
    if(piece.1$type == "bottom") {
      tops_df <- subset(use_closet, type == "top")
      top <- tops_df[sample(nrow(tops_df), 1), ]
      print(paste0(top$item, ", ", piece.1$item, ", ", shoes$item), quote = F)
    }
  }
}
