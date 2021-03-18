# correlational_analysis_after_trimming.R

#### Correlation: FULL DATA -----------
r<-cor.test(df$Overall,df$BHML,method = 'pearson',exact = FALSE)                                        # 0.160 ALL
print(paste0('r=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))

#### Correlation: Chromatic exclusion -----------
r<-cor.test(df$Overall[df$Familiar=='No'],df$BHML[df$Familiar=='No'],method = 'pearson',exact = FALSE)  # 0.2738673 EXCLUDING CHROMATIC
print(paste0('r=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))

#### Correlation: Low harmonicity exclusion -----------
r<-cor.test(df$Overall[df$BHM>0.1068],df$BHML[df$BHM>0.1068],method = 'pearson',exact = FALSE)          # 0.5496433 EXCLUDING Q1
print(paste0('r=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))

#### Partial correlation: FULL DATA -----------
p <- pcor.test(df$Overall,df$BHML,df$SIM,method = 'pearson')          # -0.09918113 0.4755129
print(paste0('pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))

#### Partial correlation: Chromatic exclusion -----------
p <- pcor.test(df$Overall[df$Familiar=='No'],df$BHML[df$Familiar=='No'],df$SIM[df$Familiar=='No'],method = 'pearson')          # -0.09918113 0.4755129
print(paste0('pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))

#### Partial correlation: Low harmonicity exclusion -----------
p <- pcor.test(df$Overall[df$BHM>0.1068],df$BHML[df$BHM>0.1068],df$SIM[df$BHM>0.1068],method = 'pearson')
print(paste0('pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))

#### Semi-partial correlation: FULL DATA -----------
p <- spcor.test(df$Overall,df$BHML,df$SIM,method = 'pearson')          # -0.09918113 0.4755129
print(paste0('spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
#### Semi-partial correlation: Chromatic exclusion -----------
p <- spcor.test(df$Overall[df$Familiar=='No'],df$BHML[df$Familiar=='No'],df$SIM[df$Familiar=='No'],method = 'pearson')          # -0.09918113 0.4755129
print(paste0('spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
#### Semi-partial correlation: Low harmonicity exclusion -----------
p <- spcor.test(df$Overall[df$BHM>0.1068],df$BHML[df$BHM>0.1068],df$SIM[df$BHM>0.1068],method = 'pearson')
print(paste0('spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))


# Roughness

#### Correlation: FULL DATA -----------
r<-cor.test(df$Overall,df$SIM,method = 'pearson',exact = FALSE)                                        # 0.160 ALL
print(paste0('r=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))

#### Correlation: Chromatic exclusion -----------
r<-cor.test(df$Overall[df$Familiar=='No'],df$SIM[df$Familiar=='No'],method = 'pearson',exact = FALSE)  # 0.2738673 EXCLUDING CHROMATIC
print(paste0('r=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))

#### Correlation: Low harmonicity exclusion -----------
r<-cor.test(df$Overall[df$BHM>0.1068],df$SIM[df$BHM>0.1068],method = 'pearson',exact = FALSE)          # 0.5496433 EXCLUDING Q1
print(paste0('r=',round(r$estimate,3),', p-value=',round(r$p.value*6,5)))

#### Partial correlation: FULL DATA -----------
p <- pcor.test(df$Overall,df$SIM,df$BHML,method = 'pearson')          # -0.09918113 0.4755129
print(paste0('pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))

#### Partial correlation: Chromatic exclusion -----------
p <- pcor.test(df$Overall[df$Familiar=='No'],df$SIM[df$Familiar=='No'],df$BHML[df$Familiar=='No'],method = 'pearson')          # -0.09918113 0.4755129
print(paste0('pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))

#### Partial correlation: Low harmonicity exclusion -----------
p <- pcor.test(df$Overall[df$BHM>0.1068],df$SIM[df$BHM>0.1068],df$BHML[df$BHM>0.1068],method = 'pearson')
print(paste0('pr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))

#### Semi-partial correlation: FULL DATA -----------
p <- spcor.test(df$Overall,df$SIM,df$BHML,method = 'pearson')          # -0.09918113 0.4755129
print(paste0('spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
#### Semi-partial correlation: Chromatic exclusion -----------
p <- spcor.test(df$Overall[df$Familiar=='No'],df$SIM[df$Familiar=='No'],df$BHML[df$Familiar=='No'],method = 'pearson')          # -0.09918113 0.4755129
print(paste0('spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))
#### Semi-partial correlation: Low harmonicity exclusion -----------
p <- spcor.test(df$Overall[df$BHM>0.1068],df$SIM[df$BHM>0.1068],df$BHML[df$BHM>0.1068],method = 'pearson')
print(paste0('spr_p=',round(p$estimate,3),', p-value=',round(p$p.value*6,5)))



# for roughness
cor.test(df$Overall[df$BHM>0.1068],df$SIM[df$BHM>0.1068],method = 'spearman',exact = FALSE)          # -0.6322684 0.0006966
pcor.test(df$Overall[df$BHM>0.1068],df$SIM[df$BHM>0.1068],df$BHM[df$BHM>0.1068],method = 'spearman')          # -0.4363544 0.03302773
spcor.test(df$Overall[df$BHM>0.1068],df$SIM[df$BHM>0.1068],df$BHM[df$BHM>0.1068],method = 'spearman')          # -0.3645302 0.07988916

cor.test(df$Overall[df$Familiar=='No'],df$SIM[df$Familiar=='No'],method = 'spearman',exact = FALSE)          # -0.7615886 
pcor.test(df$Overall[df$Familiar=='No'],df$SIM[df$Familiar=='No'],df$BHM[df$Familiar=='No'],method = 'spearman')          # -0.7419092
spcor.test(df$Overall[df$Familiar=='No'],df$SIM[df$Familiar=='No'],df$BHM[df$Familiar=='No'],method = 'spearman')          # -0.7135441

