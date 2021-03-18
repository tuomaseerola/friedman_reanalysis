# correlational_analysis.R

cor(df$Overall[df$Type=='Dyad'],df$BHM[df$Type=='Dyad'],method = 'spearman')  # 0.1898214 in MP p. 321
cor(df$Overall[df$Type=='Dyad'],df$HPHM[df$Type=='Dyad'],method = 'spearman') # 0.55846
cor(df$Overall[df$Type=='Dyad'],df$SIM[df$Type=='Dyad'],method = 'spearman') # -0.8088041

# Dropping the "familiar ones", 2 and 11
cor(df$Overall[df$Type=='Dyad' & df$ID!=2 & df$ID!=11],df$BHM[df$Type=='Dyad' & df$ID!=2 & df$ID!=11],method = 'spearman')  # 0.651 in MP p. 321
cor(df$Overall[df$Type=='Dyad' & df$ID!=2 & df$ID!=11],df$HPHM[df$Type=='Dyad' & df$ID!=2 & df$ID!=11],method = 'spearman')  # 0.365 
cor(df$Overall[df$Type=='Dyad' & df$ID!=2 & df$ID!=11],df$SIM[df$Type=='Dyad' & df$ID!=2 & df$ID!=11],method = 'spearman')  # -0.870

#### Partial correlations -------------------
cor.test(df$Overall,df$BHM,method='spearman',exact = FALSE) # 0.160
cor.test(df$Overall,df$HPHM,method='spearman',exact = FALSE) # 0.306
cor.test(df$Overall,df$SIM,method='spearman',exact = FALSE) # -0.789

# Consonance and Harmonicity when Roughness has been partialled out
pcor.test(df$Overall,df$BHM,df$SIM,method='spearman') # -0.2368381, p=0.02
# pcor, how much harmonicity and consonance correlate when roughness has been removed (after controlling for Roughness)
spcor.test(df$Overall,df$BHM,df$SIM,method='spearman') # -0.1456003 p=0.1709096
# spcor, how much harmonicity correlates beyond roughness

# Consonance and Harmonicity (HP) when Roughness has been partialled out
pcor.test(df$Overall,df$HPHM,df$SIM,method='spearman') # -0.2322316, p=0.027
spcor.test(df$Overall,df$HPHM,df$SIM,method='spearman') # -0.1427684, p=0.1794743

# Consonance and Roughness when Harmonicity has been partialled out
pcor.test(df$Overall,df$SIM,df$BHM,method='spearman') # -0.7961258, p=0.0000001
spcor.test(df$Overall,df$SIM,df$BHM,method='spearman') # -0.7857923, p=0.0000001

# Consonance and Roughness when Harmonicity (HP) has been partialled out
pcor.test(df$Overall,df$SIM,df$HPHM,method='spearman') # -0.7782042 1.800625e-19
spcor.test(df$Overall,df$SIM,df$HPHM,method='spearman') # -0.7409657 6.875063e-17

# in nutshell, roughness is MORE influential

#                   Consonance r  pcor        spcor
# Harmonicity (B)      0.160      -0.237*     -0.145
# Harmonicity (HP)     0.306**    -0.232*     -0.143
# Roughness           -0.789***   -0.796****  -0.786***

#### Same operation wiht log BHM and Pearson correlation -----------------
df$BHML<-log(df$BHM)
# par(mfrow=c(2,1))
# plot(df$Overall,df$BHM,main = 'Original Harmonicity')
# plot(df$Overall,df$BHML,main = 'Log transformed Harmonicity')

# Overall, 

cor(df$Overall[df$Type=='Dyad'],df$BHML[df$Type=='Dyad'],method = 'pearson')  # 0.1898214 => 0.121299
#cor(df$Overall[df$Type=='Dyad'],df$HPHM[df$Type=='Dyad'],method = 'pearson') # 0.55846    => 0.5678186
cor(df$Overall[df$Type=='Dyad'],df$SIM[df$Type=='Dyad'],method = 'pearson') # -0.8088041  =>-0.7224856

# Dropping the "familiar ones", 2 and 11
cor(df$Overall[df$Type=='Dyad' & df$ID!=2 & df$ID!=11],df$BHML[df$Type=='Dyad' & df$ID!=2 & df$ID!=11],method = 'pearson')  # 0.651=> 0.585
cor(df$Overall[df$Type=='Dyad' & df$ID!=2 & df$ID!=11],df$HPHM[df$Type=='Dyad' & df$ID!=2 & df$ID!=11],method = 'pearson')  # 0.365=> 0.596
cor(df$Overall[df$Type=='Dyad' & df$ID!=2 & df$ID!=11],df$SIM[df$Type=='Dyad' & df$ID!=2 & df$ID!=11],method = 'pearson')  # -0.870=> -0.811

#### Correlations -------------------
r<-cor.test(df$Overall,df$BHML,method='pearson',exact = FALSE) # 0.160 => 0.147 ns
print(paste0('r=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))
r<-cor.test(df$Overall,df$SIM,method='pearson',exact = FALSE) # -0.789 => -0.746
print(paste0('r=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))

# Consonance and Harmonicity when Roughness has been partialled out
p<-pcor.test(df$Overall,df$BHML,df$SIM,method='pearson') # -0.2368381, p=0.02 => r=-0.1915829 p=0.07046581
print(paste0('pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))

# pcor, how much harmonicity and consonance correlate when roughness has been removed (after controlling for Roughness)
p<-spcor.test(df$Overall,df$BHML,df$SIM,method='pearson') # -0.1456003 p=0.1709096 => r=-0.12767 p=0.2304625
print(paste0('spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
# spcor, how much harmonicity correlates beyond roughness

# Consonance and Roughness when Harmonicity has been partialled out
p<-pcor.test(df$Overall,df$SIM,df$BHML,method='pearson') # -0.7961258, p=0.0000001 =>  r= -0.7501668 p=1.744771e-17
print(paste0('pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
p<-spcor.test(df$Overall,df$SIM,df$BHML,method='pearson') # -0.7857923, p=0.0000001 => r= -0.7420019 p=5.908396e-17
print(paste0('spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
