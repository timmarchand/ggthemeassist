# Extract named values from S7 ggplot2 theme elements (ggplot2 >= 4.0.0)
extractS7ThemeElement <- function(el) {
  if (is.null(el)) return(NULL)
  s7_class <- attributes(el)$S7_class
  if (is.null(s7_class)) {
    # fallback for non-S7 elements
    return(unlist(el))
  }
  props <- names(s7_class@properties)
  # exclude internal/non-theme properties
  props <- props[!props %in% c("inherit.blank", "margin", "debug",
                               "italic", "fontweight", "fontwidth")]
  result <- lapply(props, function(p) tryCatch(el[[p]], error = function(e) NULL))
  names(result) <- props
  result <- result[!sapply(result, is.null)]
  unlist(result)
}
