

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
3*5*12*54
?reshape

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
