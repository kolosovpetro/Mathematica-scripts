## Time Scale Calculus Mathematica Scripts

Supplementary repository

### User's guide

In order to verify main results from the manuscript - change only `sigma[x_]` function within the `time_scale_calculus.m` package. 
There is specified `sigma[x_]` function for each time scale. 
In order to understand better - open `time_scale_calculus_new.nb` notebook. 
By default ```sigma[x_] := x ^ Global`q```, so it is set to q-power time scale **R^q**.

For example, to test time scales, proceed as follows.

### Test Cases

- **Finite difference**
  - Set 
  
  ```cs 
  sigma[x_] = x + 1
  ```
  
  - Partial derivaitve `f1(x,b)` by `x` is got by command: 
  
  ```cs 
  timeScaleDerivativeX[1, x, sigma[x]]
  ```
  
  - Partial derivative `f1(x,b)` by `b` is got by command: 
  
  ```cs 
  timeScaleDerivativeB[1, x, x]
  ```
  
  - Theorem (3.1) for time scale **T** = **Z x Z** by command: 
  
  ```cs 
  timeScaleDerivativeX[1, x, sigma[x]] + timeScaleDerivativeB[1, x, x]
  ```

- **Classical derivaitve**
  - Set 
  
  ```cs 
  sigma[x_] = x + Global`dx
  ```
  
  - Partial derivaitve `f1(x,b)` by `x` is got by command: 
  
  ```cs 
  timeScaleDerivativeX[1, x, sigma[x]]
  ```
  
  - Partial derivative `f1(x,b)` by `b` is got by command: 
  
  ```cs 
  timeScaleDerivativeB[1, x, x]
  ```
  
  - Theorem (3.1) for time scale **T** = **R x R** by command: 
  
  ```cs 
  Limit[timeScaleDerivativeX[1, x, sigma[x]] + timeScaleDerivativeB[1, x, x], dx -> 0]
  ```

- **q-Derivative**

  - Set 
  
  ```cs 
  sigma[x_] = x * Global`q
  ```
  
  - Partial derivaitve `f1(x,b)` by `x` is got by command: 
  
  ```cs 
  timeScaleDerivativeX[1, x, sigma[x]]
  ```
  
  - Partial derivative `f1(x,b)` by `b` is got by command: 
  
  ```cs 
  timeScaleDerivativeB[1, x, x]
  ```
  
  - Theorem (3.1) for time scale **T** = **qR x qR** by command: 
  
  ```cs 
  timeScaleDerivativeX[1, x, sigma[x]] + timeScaleDerivativeB[1, x, x]
  ```

- **q-power Derivative**

  - Set 
  
  ```cs 
  sigma[x_] = x ^ Global`q
  ```
  
  - Partial derivaitve `f1(x,b)` by `x` is got by command: 
  
  ```cs 
  timeScaleDerivativeX[1, x, sigma[x]]
  ```
  
  - Partial derivative `f1(x,b)` by `b` is got by command: 
  
  ```cs 
  timeScaleDerivativeB[1, x, x]
  ```
  
  - Theorem (3.1) for time scale **T** = **Rq x Rq** by command: 
  
  ```cs 
  timeScaleDerivativeX[1, x, sigma[x]] + timeScaleDerivativeB[1, x, x]
  ```
  
  User is free to test any custom time scale, simply changing the `sigma[x_]` function.