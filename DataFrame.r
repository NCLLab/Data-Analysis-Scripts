list.files()
all.files = list.files(pattern="^MMN23")
MMN23 = data.frame()
for(file in all.files){
  data = read.table(file)
  MMN23=rbind(MMN23, data.frame(y=apply(data[, c(18,19,12,20,13,24)], 1, mean), time=seq(from=-230, to=518,by=2), file=file))}

MMN23= within(MMN23, {
  partic = sapply(MMN23$file, function(x) {substr(strsplit(as.character(x), split="\\.")[[1]][[1]], start=13, stop=16)}) 
  step = sapply(MMN23$file, function(x) {as.factor(substr(strsplit(as.character(x), split="\\.")[[1]][[1]], start=6, stop=7))})  
  status = sapply(MMN23$file, function(x) {as.factor(substr(strsplit(as.character(x), split="\\.")[[1]][[1]], start=8, stop=9))}) 
  group = ifelse(partic %in% c("1098","1137","1156","1170","1191","1192","1197"), "NE", "NC")
})
