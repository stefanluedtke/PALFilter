#' Filter a PAL dataset
#'
#' @param newdata A data frame containing a PAL dataset (see vignette)
#' @return A numeric vector of predicted porpoise probabilities
#' @export
porpoiseProb.xgb <- function(test) {

  featnames = c('NofClx', 'nActualClx', 'medianKHz', 'avEndF',
                'nRisingIPIs', 'avSPL', 'avPkAt', 'avBWx8', 'TrDur_us',
                'AvPRF',
                'nICIrising', 'MinICI_us', 'midpointICI', 'MaxICI_us',
                'ClkNofMinICI',
                'ClkNofMaxICI', 'NofClstrs', 'avClstrNx8', 'avclF0',
                'avclF1',
                'avPkIPI', 'BeforeIPIratio', 'PreIPIratio',
                'Post1IPIratio',
                'Post2IPIratio', 'EndIPIratio')

  mtest = as.matrix(test[,featnames])

  preds = predict(mod,mtest)
  return(preds)
}



