# rm(list = ls())
# install.packages("pxweb")
library(pxweb)
update_pxweb_apis()
api_catalogue()



d1 <- 
  get_pxweb_data(url = "http://statbank.hagstova.fo/api/v1/fo/H2/PF/PF01/MFI_javni.px",
                 dims = list(instrument = c('*'),
                             sector = c('*'),
                             country = c('*'),
                             month = c('*')),
                 clean = T)
head(d1)
str(d1)

x1 <- reshape(d1, timevar = "mánaður",
              idvar = c("fíggjaramboð", "geiri", "land"),
              direction = "wide")
head(x1)
tail(x1)
levels(x1$fíggjaramboð)
levels(x1$geiri)
levels(x1$land)

mat1.names <- x1[, 1:3]
mat1.names$id <- 1:length(x1[, 1])
head(mat1.names)
tail(mat1.names)

start.ar <- as.numeric(substr(d1$mánaður[1], 1, 4))
start.mdr <- as.numeric(substr(d1$mánaður[1], 6, 7))

mat1.ts <- as.data.frame(t(x1[, -c(1:3)]), row.names = F)
names(mat1.ts) <- mat1.names$id
for (j in 1:dim(mat1.ts)[2]) {
  mat1.ts[, j] <- ts(mat1.ts[, j], start = c(start.ar, start.mdr), frequency = 12)
}

head(mat1.ts)

plot(mat1.ts[, 1], type = "n", ylim = c(min(mat1.ts), max(mat1.ts)))
grid()
for (j in 1:dim(mat1.ts)[2]) {
  lines(mat1.ts[, j], lwd = 2)
}










head(d1)


mat1.names

str(mat1.ts)
class(mat1.ts)

head(mat1.ts)
row.names(mat1.ts)

mat1.ts <- as.data.frame(matrix(nrow = dim(x1)[2] - 3, ncol = dim(x1)[1]))
names(mat1.ts) <- 1:dim(x1)[1]
head(mat1.ts)

dim(x1)
str(d1)
12*3*5
head(x1[, -c(1:3)])
head(t(x1[, -c(1:3)]))



r1 <- reshape(d1, timevar = "land",
              idvar = c("mánaður", "fíggjaramboð", "geiri"), direction = "wide", sep = " | ")
head(r1)
r2 <- reshape(r1, timevar = "geiri",
              idvar = c("mánaður", "fíggjaramboð"), direction = "wide", sep = " | ")
head(r2)
r3 <- reshape(r2, timevar = "fíggjaramboð", idvar = "mánaður", direction = "wide", sep = " | ")
head(r3)

str(r3)

sum(r3[, 2:14])
unique(r3[, 2])

v1 <- rep(NA, dim(r3)[2] - 1)
for (i in 1:dim(r3)[2] - 1) {
  v1[i] <- unique(r3[, i + 1])
}
warnings()
dim(r3)[2]
v1
is.na(r3)
#-
str(r3)

#-

d2 <- 
  get_pxweb_data(url = "http://statbank.hagstova.fo/api/v1/fo/H2/PF/PF01/MFI_vinna.px",
                 dims = list(instrument = c('*'),
                             "MFI-group" = c('*'),
                             industry = c('*'),
                             month = c('*')),
                 clean = TRUE)
head(d2)
r4 <- reshape(d2, timevar = "vinnugrein", idvar = c("mánaður", "MFI-bólkur", "fíggjaramboð"),
              direction = "wide", sep = " | ")
head(r4)
r5 <- reshape(r4, timevar = "MFI-bólkur", idvar = c("mánaður", "fíggjaramboð"),
              direction = "wide", sep = " | ")
head(r5)
r6 <- reshape(r5, timevar = "fíggjaramboð", idvar = "mánaður", direction = "wide", sep = " | ")
head(r6)
str(r6)





d3 <- 
  get_pxweb_data(url = "http://statbank.hagstova.fo/api/v1/fo/H2/PF/PF01/MFI_geiri.px",
                 dims = list(instrument = c('*'),
                             "original maturity" = c('*'),
                             "MFI-group" = c('*'),
                             sector = c('*'),
                             month = c('*')),
                 clean = TRUE)
head(d3)

r7 <- reshape(d3, timevar = "geiri", idvar = c("mánaður", "MFI-bólkur", "upprunalig bindingartíð", "fíggjaramboð"),
              direction = "wide", sep = " | ")
head(r7)
r8 <- reshape(r7, timevar = "MFI-bólkur", idvar = c("mánaður", "upprunalig bindingartíð", "fíggjaramboð"),
              direction = "wide", sep = " | ")
head(r8)
r9 <- reshape(r8, timevar = "upprunalig bindingartíð", idvar = c("mánaður", "fíggjaramboð"),
              direction = "wide", sep = " | ")
head(r9)
r10 <- reshape(r9, timevar = "fíggjaramboð", idvar = "mánaður", direction = "wide", sep = " | ")
head(r10)
str(r10)




r1 <- reshape(d1, timevar = "land",
              idvar = c("mánaður", "fíggjaramboð", "geiri"), direction = "wide", sep = " | ")
head(r1)
r2 <- reshape(r1, timevar = "geiri",
              idvar = c("mánaður", "fíggjaramboð"), direction = "wide", sep = " | ")
head(r2)
r3 <- reshape(r2, timevar = "fíggjaramboð", idvar = "mánaður", direction = "wide", sep = " | ")
head(r3)










library(tidyr)
s1 <- spread(data = d1, key = fíggjaramboð, value = values)
head(s1)
tail(s1)

head(d1)
r1 <- reshape(d1, idvar = "mánaður", timevar = c("fíggjaramboð", "geiri", "land"), direction = "wide")
head(r1)
str(r1)
r1 <- reshape(d1[, c(1, 2, 3, 5)], v.names = "values",
              # idvar = "mánaður",
              timevar = c("fíggjaramboð", "geiri", "land"),
              direction = "wide")
head(r1)

head(d1)
d2 <- d1[, 3:5]
head(d2)
tail(d2)

summary(Indometh)
head(Indometh)
tail(Indometh)

# str(Indometh)
wide <- reshape(
  Indometh,
  v.names = "conc",
  idvar = "Subject",
  timevar = "time",
  direction = "wide"
)
wide
unique(Indometh$time)

head(d1)
r2 <- reshape(
  data = d1,
  v.names = "values",
  idvar = c("mánaður", "geiri", "land"),
  timevar = "fíggjaramboð",
  direction = "wide"
)
head(r2)

r2[1:60, ]

library(reshape2)
head(d1)
r3 <- dcast(data = d1,
            formula = fíggjaramboð + geiri + land ~ values, value.var = mánaður)
head(r3)


head(d1)
str(d1)
levels(d1$fíggjaramboð)[2] + levels(d1$fíggjaramboð)[4]
length(levels(d1$fíggjaramboð))
length(levels(d1$geiri))
length(levels(d1$land))

mat1 <- as.data.frame(matrix(nrow = length(levels(d1$mánaður)),
                             ncol = length(levels(d1$fíggjaramboð)) *
                             length(levels(d1$geiri)) *
                             length(levels(d1$land))
))
names(mat1)
str(d1)
paste(levels(d1$fíggjaramboð)[1], levels(d1$geiri)[1], levels(d1$land)[1], sep = "_")

matnames <- rep(NA, 180)
for (i in 1:length(levels(d1$fíggjaramboð))) {
  for (j in 1:length(levels(d1$geiri))) {
    for (k in 1:length(levels(d1$land))) {
      matnames[i] <- paste(levels(d1$fíggjaramboð)[i], levels(d1$geiri)[j],
                        levels(d1$land)[k], sep = " | ")
    }
  }
}
matnames


head(d1)
str(d1)
d1
length(unique(d1$mánaður))

paste(d1$fíggjaramboð[54], d1$geiri[54], d1$land[54], sep = " | ")
d1$fíggjaramboð[54]
