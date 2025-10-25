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

* Is there a relationship between where a person places themsleves on a left-right ideology scale and how much they rate their knowledge of politics. 
*Where someone places themselves on an ideology scale is unrelated to where they'd rank their self efficacy. 
*People who self rank in the left will be more likely to rank themselves as knowledgable because univeristies sometimes lean left.


*3 Variable info

codebook E3003 E3020
describe E3003 E3020

replace E3003 = . if E3003 > 5
replace E3020 = . if E3020 > 10

ssc install revrs
revrs E3003

sum revE3003 E3020, detail

*E3020 Ideology Self -- Mean: 5.22, Median: 5, Min: 0, Max: 10, SD: 2.70, Skew: -0.03 

*E3003 Internal Efficacy -- Mean: 3.60, Median: 4, Min: 1, Max: 5, SD: 1.14, Skew: -0.67


ssc install blindschemes
set scheme plottig

*4 Dependent Var Graph
graph bar, over(revE3003, label(labsize(1.55))) b1title(Efficacy) ytitle(Percentage, size(medium)) name(Four) title(Self Ranked Efficacy)

graph save "Four" "C:\Users\adamj\Downloads\Four.gpdf"

*5 Idependent Var Graph
graph bar, over(E3020) b1title(Ideology) ytitle(Percentage, size(medium)) name(Five) title(Self Ranked Ideology)

graph save "Five" "C:\Users\adamj\Downloads\Five.gpdf"

*6 Grouped Graph
graph hbar (percent), over(revE3003, label(labsize(1))) over(E3020) title(Efficacy by Ideology) ytitle(Percentage) name(Six)

graph save "Six" "C:\Users\adamj\Downloads\Six.gpdf"

*7 Correlation matrix
pwcorr revE3003 E3020, sig

*The p value is 0.000 so we know that the correlation in statistically significant. Additionally, the r value is -0.039 which means that as we move further right in peoples self reported ideology they are more likely to report lower levels of self efficacy but only very very slightly.

*8 Regression
regress revE3003 E3020

*Yes the relationship is statistically significant as the p value is 0.000. The finidings of the regression test indicate that the two variables are very slightly negatively correlated. 

*9
* While the finding of are statistically significant the correlation is very very weak so I would reject claiming anything. 

*10 Function Line

twoway function y=-0.016*x+3.773, range(0 10) xlab(0(1)10) ylab(1(1)5) xtitle(Ideology) ytitle(Efficacy) title(y=-0.016*x+3.773) name(ten)

graph save "Ten" "C:\Users\adamj\Downloads\Ten.gpdf"
