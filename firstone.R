# Let's star by installing all the necessary packages.
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
install.packages("ggpubr")

# Time to load everything.
library("tidyverse")
library("skimr")
library("janitor")
library("ggpubr")

# We'll bee working with some base dataset, the Monthly Airline Passenger Numbers 1949-1960
data(USArrests)
crime <- USArrests

# Time to take a look at the data:
head(crime)
colnames(crime)
skim_without_charts(crime)


# A correlation analysis: (Spoiler: No correlation)

ggscatter(crime, x = "Murder", y = "UrbanPop", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Murder Rate", ylab = "Percentile of Urban Pop")

ggscatter(crime, x = "Assault", y = "UrbanPop", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Murder Rate", ylab = "Percentile of Urban Pop")

ggscatter(crime, x = "Rape", y = "UrbanPop", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Murder Rate", ylab = "Percentile of Urban Pop")

# Looking and the highest Murder State Numbers

sub_crime <- crime %>% 
  select(Murder, UrbanPop)
head(high_crime)

sub_crime[order(sub_crime$Murder, decreasing=TRUE),]
sub_crime <- subset(high_crime, Murder > 14.3)
sub_crime
# Let's create a bar chart to see:

bar_crime<-ggplot(data=sub_crime, aes(x=Murder, y=UrbanPop)) +
  geom_bar(stat="identity", fill="steelblue")
#  geom_text(aes(label=len), vjust=1.6, color="white", size=3.5)
bar_crime
