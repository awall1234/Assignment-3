*Assignment 3

*1 

*Adam Walker
*POL S 411
*Dr Snagovsky
*Oct 24 2025

clear all
cd "C:\Users\adamj\Downloads"
use "cses5.dta"

*2 Research 

* Is there a relationship between where a person places themsleves on a left-right ideology scale and how high they rate their knowledge of their country's politics. 

*Null: Where someone places themselves on an ideology scale is unrelated to where they rank their own political knowledge. 

*Alternative: People who rank themselves further to either extreme of the left-right scale will rate their political knowledge higher. Since they have stronger political opinions it is possible they have done some form of research or reasoning to come to those conclusions and feel knowledgeable. 


*3 Variable info

codebook E3003 E3020
describe E3003 E3020

replace E3003 = . if E3003 > 5
replace E3020 = . if E3020 > 10

ssc install revrs
revrs E3003

sum revE3003 E3020, detail

*revE3003 Internal Efficacy -- Mean: 3.60, Median: 4, Min: 1, Max: 5, SD: 1.14, Skew: -0.67

*E3020 Ideology Self -- Mean: 5.22, Median: 5, Min: 0, Max: 10, SD: 2.70, Skew: -0.03 


ssc install blindschemes
set scheme plottig


*4 Dependent Var Graph
graph bar, over(revE3003, label(labsize(1.55))) b1title("I understand the most important political events of my country.") ytitle(Percentage of Respondents, size(medium)) name(Four) title(Self Ranking of Politcal Knowledge)

graph save "Four" "C:\Users\adamj\Downloads\Four.pdf"


*5 Idependent Var Graph
graph bar, over(E3020) b1title(Ideology) ytitle(Percentage of Respondents, size(medium)) name(Five) title(Self Ranked Ideology)

graph save "Five" "C:\Users\adamj\Downloads\Five.pdf"


*6 Grouped Graph
label define knowledge_labels 1 "Very Low Knowledge" 2 "Low Knowledge" 3 "Moderate Knowledge" 4 "High Knowledge" 5 "Very High Knowledge"
label values revE3003 knowledge_labels

graph hbar (percent), over(revE3003, label(labsize(1))) over(E3020) title(Self Ranked Knowledge grouped by Ideology Rank) ytitle(Percentage of Total Respondents) name(Six)

graph save "Six" "C:\Users\adamj\Downloads\Six.pdf"


*7 Correlation matrix
pwcorr revE3003 E3020, sig

*The p value is 0.000 so we know that the correlation is statistically significant. The r value is -0.039 which indicates a very weak negative correlation. As one value (either political knowledge or how far right one is) increases the other value, on average will decrease just slightly. For example as someone moves further right ideologically they should report slightly lower levels of political knowledge. While being statistically significant the correlation is so weak that it is nearly negligible. 



*8 Regression
regress revE3003 E3020

*The relationship is statistically significant as the p value is 0.000. As with the previous test while being statistically significant the correlation is tiny at -0.016. Looking at the r^2 value and we can see that the model accounted for less than 1% of the variance in the dependent variable. The model is not very accurate at all, there could possibly be a non-linear correlation or something else at play. 



*9 Analysis
*  While there is a statistically significant but very weak correlation the model is so inaccurate that I must fail to reject the null hypothesis for now. My alternative hypothesis would likely be a non linear model, more of a v or u shape with either side cancelling out and giving me the rather flat slope value of -0.016, but this is only speculation based on intuition and the grouped bar graph. I have not done futher testing to determine if that is true or not so I must fail to reject the null hypothesis. 


*10 Function Line

twoway function y=-0.016*x+3.773, range(0 10) xlab(0(1)10) ylab(1(1)5) xtitle(Ideology) ytitle(Political Knowledge) title(y=-0.016*x+3.773) name(Ten)

graph save "Ten" "C:\Users\adamj\Downloads\Ten.pdf"
