### Descriptive Statistic
---
| Mean | Median | Mode |
|------|--------|------|
| Mean is the arithmetic average and is sensitive to extreme value, so it's best for normal distributed data|Median represent middle value and is robust to outlier|Mode is the most frequent value and is mainly used for categorical data or frequency bases analysis|
|AVERAGE|MIDDLE VALUE|MOST FREQUENT|
|sensitive to extreme value|robust to outlier|frequncy based analysis|
|normal data|skewed data|categorical data|
|||Mode is unique because it's the only measure that works on categorical data, like finding the popular product category|
---

| Variance | Standard Deviation |
|----------|--------------------|
|Variance is the average of squared deviation from the mean. Squaring makes all values positive and amplifies outliers, but it also give you units squared, which is hard to interpret directly|Standard Deviation is simply the square root of variance, which brings it back to the original units of data|
||Standard deviation measures *how much the data is spread out from the mean (average)*|
|* *if values are close to the mean -> low variance* <br>* *if values are far from the mean -> high variance*|* *if values are close to the mean -> low standard deviation* <br>* *if values are far from the mean -> high standard deviation*|

> *variance measure the average of squared deviation from the mean, while standard deviation is the square root of variance*
---

| Skewness | Kurtosis |
|----------|----------|
|Skewness measure the asymmetry of a distribution. Positive skew indicate a longer right tail, while negative skew indicate a longer left tail,|Kurtosis describe the shape of tails, how extreme the outlier are |
|(+ve) skew indicate right tail <br> (-ve) skew indicate left tail.| indicate extreme outlier are.|


---
> Statistical measure used to describe the destribution of data by dividing an ordered dataset into equal parts.

|Percentile|Quartiles|IQR|
|---------|---------|-----|
|Percentile divide data into 100 equal part, indicating the percentage of values below a certain score.| Quartile divide data into four equal quarters (Q1 = 25%, Q2 = 50% or *mean* , Q3 = 75%)||
|Used to rank data, such as 95th percentile test score, meaning you performed better than 95% of test taker in exam|Q1 - lower quartile <br> Q2 - median <br> upper quartile||

---
**Outlier**
> *An Outlier is a data point that **deviates** significantly from the rest, and right way to handle it depends entirely on whether it represents a data error or a genuine extreme event, which is why investigation always comes before treatment*.

> Explanation : An outlier is a data point that deviates significantly from the rest of the distribution.

> But before deciding what to do with it, I always investigate cause. Outlier can arise from data entry errors, measurement failures, or sampling issues, in which case they should be corrected or removed.  But they can also be genuine extreme events that carry the most interesting signal in the data, like a fraud transaction or a viral post. The treatment depends entirely on the cause.

>IQR method uses Tukey's fences — Q1 minus 1.5×IQR as lower bound, Q3 plus 1.5×IQR as upper. It's non-parametric so it works even on skewed distributions like salary or house prices.



Summary

| | |
|---|---|
|Definition|A value that deviates from the rest of the distribution, may or may not belong to the same distribution|
|4 Causes|Data entry error, measurement error, sampling error, genuine rare event|
|IQR method|Below Q1-1.5xIQR or above Q3+1.5xIQR|
|z-score method|\|z\| > 3. Assume normality. Use for sysmmetric, normal distributions.|
|visual methods|Box Plot, scatter Plot, histogram—always do this first|
|5 treatments|Remove, Cap(winsorize), Transform(log), keep with robust model, model separately|
|Golden rule|Never blindly remove. Always ask WHY it exists first.|



Question :- How outlier affect models ?

Answer :- 
Linear Regression
---


