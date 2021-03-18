# varying_thresholds.R

#### Let's explore the trimming systematically -------------
a1<-NULL
a2<-NULL
a3<-NULL
s<-seq(0.10,0.90,by=0.01)
for (i in s) {
  tmp<-dplyr::filter(df,BHM >= quantile(BHM,i))
  model0<-lm(Overall ~ 1,data = tmp)
  model1<-lm(Overall ~ log(BHM),data = tmp)
  model2<-lm(Overall ~ log(BHM)+ I(log(BHM)^2),data = tmp)
  
  df$dummy<-0
  df$dummy[df$BHM < as.numeric(quantile(df$BHM,i))]<- 1
  modeldummy<-lm(Overall ~ log(BHM) + dummy,data = df)
  model0dummy<-lm(Overall ~ 1,data = df)
  
  x1<-anova(model0,model1)
  a1<-rbind(a1,x1$`Pr(>F)`[2])

  x2<-anova(model0,model2)
  a2<-rbind(a2,x2$`Pr(>F)`[2])
  
  x3<-anova(model0dummy,modeldummy)
  a3<-rbind(a3,x3$`Pr(>F)`[2])
}

tmpf<-data.frame(pval=c(a1,a2,a3),Q=c(s,s,s),model=c(rep('Linear',length(a2)),rep('Quadr.',length(a2)),rep('Dummy',length(a2))))

g5<-ggplot(tmpf,aes(Q,pval,colour=model,shape=model))+
  geom_point(size=1.75,alpha=0.80)+
  geom_line()+
  scale_x_continuous(limits = c(0.0,1),breaks = seq(0,1,by=0.25),expand = c(0.01,0.01))+
#  scale_y_continuous(limits = c(0,0.8),breaks = seq(0.05,1,by=0.05),expand = c(0,0),trans = 'log2')+
  scale_y_continuous(trans = 'log10')+
  scale_shape(name='Model')+
  scale_color_grey(start = .5,end = 0.0,name='Model')+
  geom_hline(yintercept = 0.05,colour='grey40',linetype='dashed')+
  geom_hline(yintercept = 0.01,colour='grey40',linetype='dotted')+
  geom_hline(yintercept = 0.001,colour='grey60',linetype='dotted')+
  geom_vline(xintercept = 0.25,colour='grey50',linetype='dotted')+
  geom_vline(xintercept = 0.50,colour='grey50',linetype='dotted')+
  geom_vline(xintercept = 0.75,colour='grey50',linetype='dotted')+
  annotate("text",x=0.25,y=0.9,label='Q[1]',parse=TRUE)+
  annotate("text",x=0.50,y=0.9,label='Q[2]',parse=TRUE)+
  annotate("text",x=0.75,y=0.9,label='Q[3]',parse=TRUE)+
  xlab('Harmonicity Percentile Eliminated or Coded as Dummy Value')+
  ylab('P value (Log scale)')+
  theme_bw()+
  theme(legend.justification=c(1,0), legend.position=c(0.15,0.15))+
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))
#g5

#ggsave(filename = 'Quartile_as_Deleted_and_Dummy_log.pdf',g1,height = 3.75,width = 6)

#### end --------------
library(nortest)
shapiro.test(df$BHM)
ad.test(df$BHM)

g3<-ggplot(df,aes(x=BHM))+
  geom_histogram(fill='white',colour='black',bins=12)+
  ylab('Count')+
  xlab('Harmonicity')+
  annotate("text",x=.15,y=32,label="Normality~italic(p)<.001",parse=TRUE,size=3,hjust=0)+
  theme_bw()
#g3

shapiro.test(log(df$BHM))
ad.test(log(df$BHM))

g4<-ggplot(df,aes(x=log(BHM)))+
  geom_histogram(fill='grey60',colour='black',bins = 12)+
  ylab('Count')+
  xlab('Log of Harmonicity')+
  annotate("text",x=-5.5,y=20,label="Normality~italic(p)==.13",parse=TRUE,size=3,hjust=0)+
  theme_bw()
#g4

library(cowplot)
#fig2 <- plot_grid(g1,g3,g2,g4,g5,labels = c("A", "B","C","D","E"),ncol = 2, nrow = 3, rel_heights = c(2,2),rel_widths = c(2,2))
#fig2

first_row = plot_grid(g1,g3, labels = c('A','B'), nrow = 1)
second_row = plot_grid(g2,g4, labels = c('C', 'D'), nrow = 1)
third_row = plot_grid(g5, labels = c('E'), nrow = 1)

combo = plot_grid(first_row, second_row, third_row, labels=c('', ''), ncol=1)

#ggsave(filename = 'combo.pdf',combo,height = 9,width = 7)
