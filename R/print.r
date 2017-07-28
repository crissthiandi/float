print_spm_vec = function(x)
{
  n = nrow(x)
  
  cat(paste0("# An spv (single precision vector): ", n, "\n"))
  
  top = min(5, n)
  if (top == 0)
  {
    cat("# [no elements to display]\n")
    return(invisible())
  }
  
  if (top == n)
    submat = spm2mat(x)
  else
    submat = spm2mat(x[1:top, 1L])
  
  dim(submat) = NULL
  
  if (top < n)
    cat(capture.output(submat), "... \n")
  else
    print(submat) # NOTE intentional
  
  invisible()
}



print_spm_mat = function(x)
{
  m = nrow(x)
  n = ncol(x)
  
  cat(paste0("# An spm (single precision matrix): ", m, "x", n, "\n"))
  
  toprow = min(10, m)
  topcol = min(5, n)
  if (toprow == 0 || topcol == 0)
  {
    cat("# [no elements to display]\n")
    return(invisible())
  }
  
  if (toprow == m && toprow == n)
    submat = spm2mat(x)
  else
    submat = spm2mat(x[1:toprow, 1:topcol])
  
  dim(submat) = c(toprow, topcol)
  
  print(submat) # NOTE intentional
  
  if (toprow < m || topcol < n)
    cat("# ...\n\n")
  
  invisible()
}



print_spm = function(x)
{
  if (isavec(x))
    print_spm_vec(x)
  else
    print_spm_mat(x)
}



#' @rdname print
#' @export
setMethod("print", signature(x="spm"), function(x, ...) print_spm(x))

#' @rdname print
#' @export
setMethod("show", signature(object="spm"), function(object) print_spm(object))