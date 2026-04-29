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
> Any value below Q1 minus 1.5 times IQR, or above Q3 plus 1.5 times IQR , is flagged as an outlier. This is what exactly box plot visualize.
