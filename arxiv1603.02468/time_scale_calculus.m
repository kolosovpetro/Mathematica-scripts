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
sigma[x_, q_] := x;
timeScaleDifferenceX[m_, x_, b_, t_, q_] := (P[m, sigma[q, x], b] - P[m, t, b])/(sigma[q, x] - t);
timeScaleDerivativeX[m_, x_, b_, q_] := Expand[Limit[timeScaleDifferenceX[m, x, b, t, q], t -> x]];
timeScaleDifferenceB[m_, x_, b_, t_, q_] := Expand[(P[m, x, sigma[q, b]]- P[m, x, t])/(sigma[q, b] - b)];
timeScaleDerivativeB[m_, x_, b_, q_] := Expand[Limit[timeScaleDifferenceB[m, x, b, t, q], t-> b]];
timeScaleDerivaitveOddPower[m_, x_]:= Expand[Limit[(sigma[Global`q, x]^(2m+1) - t^(2m+1))/(sigma[Global`q, x]- t), t-> x]];
theorem[m_] := Expand[timeScaleDerivativeX[m, Global`x, sigma[Global`q, Global`x], Global`q] + timeScaleDerivativeB[m, Global`x, Global`x, Global`q]];

End[ ]

EndPackage[ ]


(* ::Code:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::Code:: *)
(**)
