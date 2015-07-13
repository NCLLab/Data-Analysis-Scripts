install.packages('psych', depend=T) #http://blog.cogneurostats.com/?p=38
thedata = read.table("demo_500.txt", sep='\t', header=F, skip=0)
my.pca = principal(thedata[seq(26,150,2)], nfactors=5, rotate='varimax', scores=TRUE, covar=F)
rotdata = t(my.pca$scores) #rotates the data.frame
rename = matrix(rotdata, nrow=24, byrow=TRUE) #nrow = #subjects
rename = data.frame(rename); #convert it back to a dataframe
labels = c("FLcon1 FLcon2 FLcon3 FLcon4 FLcon5 FRcon1 FRcon2 FRcon3 FRcon4 FRcon5 CLcon1 CLcon2 CLcon3 CLcon4 CLcon5 CRcon1 CRcon2 CRcon3 CRcon4 CRcon5 PLcon1 PLcon2 PLcon3 PLcon4 PLcon5 PRcon1 PRcon2 PRcon3 PRcon4 PRcon5 OLcon1 OLcon2 OLcon3 OLcon4 OLcon5 ORcon1 ORcon2 ORcon3 ORcon4 ORcon5 TLcon1 TLcon2 TLcon3 TLcon4 TLcon5 TRcon1 TRcon2 TRcon3 TRcon4 TRcon5 FLinc1 FLinc2 FLinc3 FLinc4 FLinc5 FRinc1 FRinc2 FRinc3 FRinc4 FRinc5 CLinc1 CLinc2 CLinc3 CLinc4 CLinc5 CRinc1 CRinc2 CRinc3 CRinc4 CRinc5 PLinc1 PLinc2 PLinc3 PLinc4 PLinc5 PRinc1 PRinc2 PRinc3 PRinc4 PRinc5 OLinc1 OLinc2 OLinc3 OLinc4 OLinc5 ORinc1 ORinc2 ORinc3 ORinc4 ORinc5 TLinc1 TLinc2 TLinc3 TLinc4 TLinc5 TRinc1 TRinc2 TRinc3 TRinc4 TRinc5"); #assign variable names
names(rename) = unlist(strsplit(labels, split=" ")); #put names into dataframe
factor1 = names(rename[seq(1,100,5)])
f1 = rename[factor1]
f1$subject = seq(1,24)
longdata = melt(f1, id.vars=c("subject") )
longdata$region = rep(c('F', 'C', 'P', 'O', 'T'), each=48) #2 hemispheres, 5 regions, 24 subjects
longdata$hemisphere = rep(c('L', 'R'), each=24)
longdata$condition = rep(c('con', 'inc'), each=240)
library(ez)
ezANOVA(longdata, dv='value', wid=subject, within=.('condition', 'hemisphere', 'region'), type=)
$ANOVA
Effect DFn DFd F p p<.05
2 condition 1 23 0.06986913 7.938816e-01 
3 hemisphere 1 23 7.88955879 9.965560e-03 *
4 region 4 92 9.88646606 1.066086e-06 *
5 condition:hemisphere 1 23 0.11050484 7.425808e-01 
6 condition:region 4 92 1.04554033 3.881822e-01 
7 hemisphere:region 4 92 3.91039384 5.607436e-03 *
8 condition:hemisphere:region 4 92 1.24818805 2.962026e-01
my.pca$loadings
