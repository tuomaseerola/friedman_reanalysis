# correlational_analysis_with_rank.R
# Does not contain adjustment for multiple corrections

# Rank correlations between harmonicity and consonance, full data
rho<-cor.test(df$Overall,df$BHM,method='spearman',exact = FALSE) 
print(round(rho$estimate,3))  # 0.161 (0.162 in Bowling Figure 1, panel B, p. 332)

# Rank correlations between harmonicity and consonance, Chromatic excluded
rho <- cor.test(df$Overall[df$Familiar=='No'],df$BHM[df$Familiar=='No'],method = 'spearman',exact = FALSE) 
print(round(rho$estimate,3))  # 0.274 (0.273 in Bowling)

# Rank correlations between harmonicity and consonance, All low harmonicity intervals eliminated
rho <- cor.test(df$Overall[df$BHM>0.1068],df$BHM[df$BHM>0.1068],method = 'spearman',exact = FALSE) 
print(round(rho$estimate,3))  # 0.550 (0.543 in Bowling)

