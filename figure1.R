# figure1.R

mean(df$BHM)
quantile(df$BHM) 
quantile(df$BHM,0.25)
quantile(df$BHM,0.5)
quantile(df$BHM,0.75)
# Quantile of 0.1068 was used in Bowling as that was Q1 in another (chromatic) dataset.

g1<-ggplot(df,aes(x=BHM,y=Overall,colour=Type,shape=Familiar))+
  geom_point(size=3,alpha=0.5,show.legend = FALSE)+
  geom_vline(xintercept = quantile(df$BHM,0.75),linetype='dotted')+
  annotate("text",x=quantile(df$BHM,0.75)+0.02,y=4.6,label='Q[3]',parse=TRUE)+
  scale_color_manual(values = c('blue','red'))+
  scale_x_continuous(breaks = seq(0,1,by=0.1))+
  scale_shape_manual(values = c(16,15,17))+
  ylab('Consonance')+
  xlab('Harmonicity')+
  theme_bw()


g2 <- ggplot(df,aes(x=BHM))+
  geom_density(adjust=1)+
  geom_vline(xintercept = quantile(df$BHM,0.75),linetype='dotted')+
  geom_vline(xintercept = quantile(df$BHM,0.50),linetype='dotted')+
  geom_vline(xintercept = quantile(df$BHM,0.25),linetype='dotted')+
  annotate("text",x=quantile(df$BHM,0.25)-0.02,y=6.70,label='Q[1]',parse=TRUE)+
  annotate("text",x=quantile(df$BHM,0.50)-0.00,y=6.70,label='Q[2]',parse=TRUE)+
  annotate("text",x=quantile(df$BHM,0.75)+0.02,y=6.70,label='Q[3]',parse=TRUE)+
  scale_x_continuous(breaks = seq(0,1,by=0.1))+
  scale_y_continuous(breaks = seq(0,7,by=1.5))+
  ylab('Density')+
  xlab('Harmonicity')+
  theme_bw()

library(cowplot)
fig1 <- plot_grid(g1,g2,labels = c("A", "B"),ncol = 1, nrow = 2, rel_heights = c(4,1),rel_widths = c(1,4))

#ggsave(filename = 'figure1.pdf',fig1,width = 7,height = 7)

