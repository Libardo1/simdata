Example session:

```
> library(simdata)
> x <- simdata()

##############################################################

Enter values for simulated multivariate normal data:

n: 1000
E(X): 5
E(Y): 12
Var(X): 8
Var(Y): 88
Corr(X, Y): 0.78

##############################################################

Actual values for simulated data:

Sample Mean X: 5.0387
Sample Mean Y: 11.9504
Sample Var X: 7.3933
Sample Var Y: 83.9161
Sample Covar X, Y: 18.9759
Sample Corr X, Y: 0.7618

##############################################################
> plot_data(x)
```

![simdata plot](https://dl.dropboxusercontent.com/u/14555519/simdata_plot.png)