# correlational_analysis_after_trimming.R

df$BHML<-log(df$BHM) # log transform skewed harmonicity variable
BF_Corr<-6           # modify p-values with six tests (Bonferroni correction)

Table1<-NULL # put results into a table
Table1$predictor<-rep(NA,1,6); Table1$subset<-rep(NA,1,6); Table1$n<-rep(0,1,6); Table1$r<-rep(0,1,6); Table1$pr<-rep(0,1,6);Table1$spr<-rep(0,1,6);Table1$r_pval<-rep(0,1,6);Table1$pr_pval<-rep(0,1,6);Table1$spr_pval<-rep(0,1,6);
Table1<-data.frame(Table1)

# Correlation: FULL DATA for harmonicity
r <- cor.test(df$Overall,df$BHML,method = 'pearson',exact = FALSE) 
#cat(paste0('Consonance vs Harmonicity with full data: r=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))
Table1$predictor[1]<-'Harmonicity'; Table1$subset[1]<-'Full'; Table1$r[1]<-r$estimate; Table1$r_pval[1]<-r$p.value*BF_Corr;Table1$n[1]<-r$parameter+2; 

# Correlation: Chromatic exclusion 
r<-cor.test(df$Overall[df$Familiar=='No'],df$BHML[df$Familiar=='No'],method = 'pearson',exact = FALSE)
#cat(paste0('Consonance vs Harmonicity with chromatic exclusion: r=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))
Table1$predictor[2]<-'Harmonicity'; Table1$subset[2]<-'Chromatic excl.'; Table1$r[2]<-r$estimate; Table1$r_pval[2]<-r$p.value*BF_Corr;Table1$n[2]<-r$parameter+2; 

# Correlation: Low harmonicity exclusion 
r<-cor.test(df$Overall[df$BHM>0.1068],df$BHML[df$BHM>0.1068],method = 'pearson',exact = FALSE)          # threshold "0.1068" comes from Bowling
#cat(paste0('Consonance vs Harmonicity with low harmonicity exclusion: r=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))
Table1$predictor[3]<-'Harmonicity'; Table1$subset[3]<-'Low Harmonicity excl.'; Table1$r[3]<-r$estimate; Table1$r_pval[3]<-r$p.value*BF_Corr;Table1$n[3]<-r$parameter+2; 

# Correlation: FULL DATA with roughness
r<-cor.test(df$Overall,df$SIM,method = 'pearson',exact = FALSE) 
#cat(paste0('Consonance vs Roughness with full data: r=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))
Table1$predictor[4]<-'Roughness'; Table1$subset[4]<-'Full'; Table1$r[4]<-r$estimate; Table1$r_pval[4]<-r$p.value*BF_Corr;Table1$n[4]<-r$parameter+2; 

#### Correlation: Chromatic exclusion -----------
r<-cor.test(df$Overall[df$Familiar=='No'],df$SIM[df$Familiar=='No'],method = 'pearson',exact = FALSE)  # 0.2738673 EXCLUDING CHROMATIC
#cat(paste0('Consonance vs Roughness with chromatic exclusionr=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))
Table1$predictor[5]<-'Roughness'; Table1$subset[5]<-'Chromatic excl.'; Table1$r[5]<-r$estimate; Table1$r_pval[5]<-r$p.value*BF_Corr;Table1$n[5]<-r$parameter+2; 

#### Correlation: Low harmonicity exclusion -----------
r<-cor.test(df$Overall[df$BHM>0.1068],df$SIM[df$BHM>0.1068],method = 'pearson',exact = FALSE)          # 0.5496433 EXCLUDING Q1
#cat(paste0('Consonance vs Roughness with low harmonicity exclusion r=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))
Table1$predictor[6]<-'Roughness'; Table1$subset[6]<-'Low harmonicity excl.'; Table1$r[6]<-r$estimate; Table1$r_pval[6]<-r$p.value*BF_Corr;Table1$n[6]<-r$parameter+2; 

# Partial correlation: FULL DATA  harmonicity
p <- pcor.test(df$Overall,df$BHML,df$SIM,method = 'pearson')          # -0.09918113 0.4755129
#cat(paste0('Consonance vs Harmonicity with roughness partialled out, pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
Table1$pr[1]<-p$estimate; Table1$pr_pval[1]<-p$p.value*BF_Corr;

#### Partial correlation: Chromatic exclusion -----------
p <- pcor.test(df$Overall[df$Familiar=='No'],df$BHML[df$Familiar=='No'],df$SIM[df$Familiar=='No'],method = 'pearson')          # -0.09918113 0.4755129
#cat(paste0('Consonance vs Harmonicity with roughness partialled out, pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
Table1$pr[2]<-p$estimate; Table1$pr_pval[2]<-p$p.value*BF_Corr;

#### Partial correlation: Low harmonicity exclusion -----------
p <- pcor.test(df$Overall[df$BHM>0.1068],df$BHML[df$BHM>0.1068],df$SIM[df$BHM>0.1068],method = 'pearson')
#cat(paste0('Consonance vs Harmonicity with roughness partialled out, pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
Table1$pr[3]<-p$estimate; Table1$pr_pval[3]<-p$p.value*BF_Corr;

#### Semi-partial correlation: FULL DATA -----------
p <- spcor.test(df$Overall,df$BHML,df$SIM,method = 'pearson')          # -0.09918113 0.4755129
#cat(paste0('Consonance vs Harmonicity with roughness partialled out, spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
Table1$spr[1]<-p$estimate; Table1$spr_pval[1]<-p$p.value*BF_Corr;

#### Semi-partial correlation: Chromatic exclusion -----------
p <- spcor.test(df$Overall[df$Familiar=='No'],df$BHML[df$Familiar=='No'],df$SIM[df$Familiar=='No'],method = 'pearson')          # -0.09918113 0.4755129
#cat(paste0('Consonance vs Harmonicity with roughness partiallied out, spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
Table1$spr[2]<-p$estimate; Table1$spr_pval[2]<-p$p.value*BF_Corr;

#### Semi-partial correlation: Low harmonicity exclusion -----------
p <- spcor.test(df$Overall[df$BHM>0.1068],df$BHML[df$BHM>0.1068],df$SIM[df$BHM>0.1068],method = 'pearson')
#cat(paste0('Consonance vs Harmonicity with roughness partialled out, spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
Table1$spr[3]<-p$estimate; Table1$spr_pval[3]<-p$p.value*BF_Corr;

#### Partial correlation: FULL DATA Roughness
p <- pcor.test(df$Overall,df$SIM,df$BHML,method = 'pearson')          # -0.09918113 0.4755129
#cat(paste0('Consonance vs Roughness with Harmonicity partialled out, pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
Table1$pr[4]<-p$estimate; Table1$spr_pval[4]<-p$p.value*BF_Corr; 

#### Partial correlation: Chromatic exclusion roughness
p <- pcor.test(df$Overall[df$Familiar=='No'],df$SIM[df$Familiar=='No'],df$BHML[df$Familiar=='No'],method = 'pearson')          # -0.09918113 0.4755129
#cat(paste0('Consonance vs Roughness with Harmonicity partialled out, pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
Table1$pr[5]<-p$estimate; Table1$pr_pval[5]<-p$p.value*BF_Corr; 

#### Partial correlation: Low harmonicity exclusion roughness
p <- pcor.test(df$Overall[df$BHM>0.1068],df$SIM[df$BHM>0.1068],df$BHML[df$BHM>0.1068],method = 'pearson')
#cat(paste0('Consonance vs Roughness with Harmonicity partialled out, pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
Table1$pr[6]<-p$estimate; Table1$pr_pval[6]<-p$p.value*BF_Corr; 

#### Semi-partial correlation: FULL DATA Roughness
p <- spcor.test(df$Overall,df$SIM,df$BHML,method = 'pearson')          # -0.09918113 0.4755129
#cat(paste0('Consonance vs Roughness with Harmonicity partialled out, spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
Table1$spr[4]<-p$estimate; Table1$spr_pval[4]<-p$p.value*BF_Corr; 

#### Semi-partial correlation: Chromatic exclusion Roughness
p <- spcor.test(df$Overall[df$Familiar=='No'],df$SIM[df$Familiar=='No'],df$BHML[df$Familiar=='No'],method = 'pearson')          # -0.09918113 0.4755129
#cat(paste0('Consonance vs Roughness with Harmonicity partialled out, spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
Table1$spr[5]<-p$estimate; Table1$spr_pval[5]<-p$p.value*BF_Corr; 

#### Semi-partial correlation: Low harmonicity exclusion -----------
p <- spcor.test(df$Overall[df$BHM>0.1068],df$SIM[df$BHM>0.1068],df$BHML[df$BHM>0.1068],method = 'pearson')
#cat(paste0('Consonance vs Roughness with Harmonicity partialled out, spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
Table1$spr[6]<-p$estimate; Table1$spr_pval[6]<-p$p.value*BF_Corr; 

print(knitr::kable(Table1,digits = 3,caption = 'Table 1. Model correlations with consonance ratings and with Roughness or Harmonicity partialled out.'))
