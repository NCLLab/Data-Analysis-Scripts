puredata<-read.csv("CorrelationsPure.csv")
voweldata<-read.csv("CorrelationsVowel.csv")
nondata<-read.csv("CorrelationsNonSpeech.csv")

AMP_p<-puredata$Amplitude
LAT_p<-puredata$Latency
CELF_p<-puredata$CELF5
AMP_v<-voweldata$Amplitude
LAT_v<-voweldata$Latency
CELF_v<-voweldata$CELF5
AMP_n<-nondata$Amplitude
LAT_n<-nondata$Latency
CELF_n<-nondata$CELF5

data0<-data.frame(AMP_p,LAT_p,CELF_p)
data1<-data.frame(AMP_v,LAT_v,CELF_v)
data2<-data.frame(AMP_n,LAT_n,CELF_n)

install.packages("psych")
library(psych)
CORp<-corr.test(data0,adjust="none")
CORp

CORv<-corr.test(data1,adjust="none")
CORv

CORn<-corr.test(data2,adjust="none")
CORn

(model1<-lm(CELF_n~LAT_n+AMP_n,data=data2))
(model2<-lm(CELF_v~LAT_v+AMP_v,data=data1))
(model3<-lm(CELF_p~LAT_p+AMP_p,data=data0))
