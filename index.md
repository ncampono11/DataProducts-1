---
title    : Signal through the noise
subtitle : Illustrating the effect of noise on a linear regression
author   : Marc T. Henry de Frahan
widgets  : []
mode     : selfcontained
framework   : io2012
---
	   
## Slide 1
		
Use an empty line followed by three dashes to separate slides!

---


## A Simple Plot

Let us create a simple scatterplot.


```r
require(ggplot2)
qplot(wt, mpg, data = mtcars)
```

<img src="assets/fig/simple-plot-1.png" title="plot of chunk simple-plot" alt="plot of chunk simple-plot" style="display: block; margin: auto;" />
