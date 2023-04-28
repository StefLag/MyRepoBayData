# Homework 2

# 2.1

#generate random values from a uniform distribution
# n is the number of draws; a = 1 and b = 100 is the value range from which 100 numbers are drawn 
x <- runif(100, 1, 100) 
mean_x <- round(mean(x), 2) 

set.seed(100)
x <- runif(100, 1, 100) 
mean_x <- round(mean(x), 2) 


# 2.2 

x <- 1:1000
x<- seq(1, 1000)

y <- seq(999,0)

#Generate a vector y such that the output of x + y returns a vector that only contains 1000s.
x+y

#how much money do the all possess together 
sum(x+y)



# 2.3

n <- 1e4
scale <- 1.5e4
income <- round( rbeta(n=n, shape1=2, shape2=12) * scale, 2)

library(ggplot2) # only load (run) once

# Plot the resulting curve
library(ggplot2)
ggplot(data.frame(x = income), aes(x=x)) +
  geom_histogram(color = "#0065BD", fill = "#0065BD", alpha=0.5, bins = 100) +
  scale_x_continuous(breaks = seq(0, scale, 1e3)) + 
  labs(x = "Gross income", 
       y = "Counts") + 
  theme_minimal()





#Use the income distribution income that you came up with to compute 
#each person’s share of the total income of all people

total_income <- sum(income)


 for(i in 1:length(income)){
   
   perc_of_tot_income[i] <- income[i]/total_income
   
 }


#next exercise

income_s <- sort(income)
group <- c("Lower 1%", "Lower 50%", "Top 10%", "Top 1%")
p <- c(.1, .5, .9, .99)

boundary <- round(income_s[p*n], 0)

low10_m <- mean( income_s[c(1:(.1*n))] )
low50_m <- mean( income_s[c(1:(.5*n))] )
top10_m <- mean( income_s[c((.9*n):n)] )
top1_m <- mean( income_s[c((.99*n):n)] )

means <-  round( c(low10_m, low50_m, top10_m, top1_m) , 0)

income_summary <- data.frame(group, boundary, means)
income_summary

##       group boundary means
## 1  Lower 1%      618   398
## 2 Lower 50%     1865  1073
## 3   Top 10%     4014  4979
## 4    Top 1%     6125  6737








