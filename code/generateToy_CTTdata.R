#************************************************************************
# Title: simulate_CTTdata
# Author: William Murrah
# Description: Simulate data to demonstrate CTT and reliability
# Created: Monday, 09 August 2021
# R version: R version 4.1.0 (2021-05-18)
# Project(working) directory: /Users/wmm0017/Projects/Courses/AdvancedMeasurementTheoryNotebook
#************************************************************************

simx <- function(truescore, sigmax = 1) {
  x <- rnorm(18, truescore, sigmax)
  return(round(x))
}
id <- rep(1:6, each = 3)
Tau <- rep(rep(4:6, each = 3),2)
set.seed(20210805)
CTTdata <- data.frame(
  id = id,
  time = rep(1:3, 6),
  x1 = simx(Tau),
  x2 = simx(Tau),
  x3 = simx(Tau),
  x4 = simx(Tau),
  x5 = simx(Tau),
  x6 = simx(Tau),
  x7 = simx(Tau),
  x8 = simx(Tau),
  x9 = simx(Tau),
  x10 = simx(Tau),
  Tau = Tau
)
rm(id, Tau, simx)
write.csv(CTTdata, file = "data/CTTdata.csv", row.names = FALSE)
