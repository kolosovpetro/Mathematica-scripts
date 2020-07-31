(* ::Package:: *)

BeginPackage["TimeScaleCalculus`"]
Needs["MainDefinitions`"]

f::usage= "function which represents polynomial P."
sigma::usage= "time scale forward jump operator."
timeScaleDifferenceX::usage= "gives a time scale difference of polynomial P in X."
timeScaleDerivativeX::usage= "gives a time scale derivative of polynomial P in X."
timeScaleDifferenceB::usage= "gives a time scale difference of polynomial P in B."
timeScaleDerivativeB::usage= "gives a time scale derivative of polynomial P in B."
timeScaleDerivaitveOddPower::usage= "gives a time scale derivative of polynomial X^{2m+1} in X."
theorem::usage= "represents main theorem of the manuscript."

Begin["`Private`"]

f[m_, x_, b_] := P[m, x, b];

sigma[x_] := Global`q * x ^ Global`j;

timeScaleDifferenceX[m_, x_, b_] := (f[m, sigma[x], b] - f[m, Global`t, b]) / (sigma[x] - Global`t);

timeScaleDerivativeX[m_, x_, b_] := Expand[Limit[(f[m, sigma[x], b] - f[m, Global`t, b]) / (sigma[x] - Global`t), Global`t -> x]];

timeScaleDifferenceB[m_, x_, b_] := Expand[(f[m, x, sigma[b]] - f[m, x, t]) / (sigma[b] - t)];

timeScaleDerivativeB[m_, x_, b_] := Expand[Limit[(f[m, x, sigma[b]] - f[m, x, t]) / (sigma[b] - t), t -> b]];

timeScaleDerivaitveOddPower[m_, x_] := Expand[Limit[(sigma[x]^(2m + 1) - t^(2m + 1)) / (sigma[x] - t), t -> x]];

theorem[m_] := Expand[timeScaleDerivativeX[m, Global`x, sigma[Global`x]] + timeScaleDerivativeB[m, Global`x, Global`x]];

End[ ]

EndPackage[ ]




