(* ::Package:: *)

BeginPackage["arxiv160800801`"]

f::usage= "function which represents polynomial P."
CoeffA::usage= "CoeffA[n,k] produces the coefficient A, see https://arxiv.org/abs/1603.02468."
L::usage= "L[m, n, k] gives polynomial L, see https://arxiv.org/abs/1603.02468."
P::usage= "P[m_, n_, a_, b_] gives the polynomial P, see https://arxiv.org/abs/1603.02468."
sigma::usage= "time scale forward jump operator."
timeScaleDifferenceX::usage= "gives a time scale difference of polynomial P in X."
timeScaleDerivativeX::usage= "gives a time scale derivative of polynomial P in X."
timeScaleDifferenceB::usage= "gives a time scale difference of polynomial P in B."
timeScaleDerivativeB::usage= "gives a time scale derivative of polynomial P in B."
timeScaleDerivaitveOddPower::usage= "gives a time scale derivative of polynomial X^{2m+1} in X."
theorem::usage= "represents main theorem of the manuscript."

Begin["`Private`"]

Unprotect[Power];
Power[0|0., 0|0.] = 1;
Protect[Power];

f[m_, x_, b_] := P[m, x, b];

CoeffA[n_, k_] := 0;
CoeffA[n_, k_] := (2k + 1) * Binomial[2k, k] * Sum[CoeffA[n, j] * Binomial[j, 2k + 1] * (-1)^(j - 1) / (j - k) * BernoulliB[2j - 2k], {j, 2k + 1, n}] /; 0 <= k < n;
CoeffA[n_, k_] := (2n + 1) * Binomial[2n, n] /; k == n;

L[m_, n_, k_] := Sum[CoeffA[m, r] * k^r * (n - k)^r, {r, 0, m}];
P[m_, n_, b_] := Sum[L[m, n, k], {k, 0, b - 1}];

sigma[x_] := x + 1;

timeScaleDifferenceX[m_, x_, b_] := (P[m, sigma[x], b] - P[m, Global`t, b]) / (sigma[x] - Global`t);

timeScaleDerivativeX[m_, x_, b_] := Expand[Limit[(P[m, sigma[x], b] - P[m, Global`t, b]) / (sigma[x] - Global`t), Global`t -> x]];

timeScaleDifferenceB[m_, x_, b_] := Expand[(P[m, x, sigma[b]] - P[m, x, t]) / (sigma[b] - t)];

timeScaleDerivativeB[m_, x_, b_] := Expand[Limit[(P[m, x, sigma[b]] - P[m, x, t]) / (sigma[b] - t), t -> b]];

timeScaleDerivaitveOddPower[m_, x_] := Expand[Limit[(sigma[x]^(2m + 1) - t^(2m + 1)) / (sigma[x] - t), t -> x]];

theorem[m_] := Expand[timeScaleDerivativeX[m, Global`x, sigma[Global`x]] + timeScaleDerivativeB[m, Global`x, Global`x]];

End[ ]

EndPackage[ ]










