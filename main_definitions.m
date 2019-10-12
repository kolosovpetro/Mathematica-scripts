(* ::Package:: *)

BeginPackage["MainDefinitions`"]

PiecewisePow::usage= "PiecewisePow[r_, t_, n_] is power function defined for f=n^r, defined for n >= t, otherwise is 0. "
PiecewisePowDiscConv::usage= "Gives discrete convolution of funtion f[r, t, n]. "
ContinuousConvf::usage= "Gives cont. convolution of funtion f[r, t, n]. "
CoeffA::usage= "CoeffA[n,k] produces the k-th coefficient A in n-th row."
ConvolveSum::usage= "ConvolveSum gives convolution-like sum of power."
L::usage= "L[m, n, k] gives polynomial L."
X::usage= "X[m_, t_, a_, b_] gives coefficient X."
H::usage= "H[m_, t_, k_] gives coefficient H."
P::usage= "P[m_, n_, a_, b_] gives the polynomial P."
P2::usage= "P2 = Indicator * P."
S::usage= "S gives an ordinary power sum."
DiscConvTable::usage= "DiscConvTable gives a discrete self-convolution of power n for n>=0."
MatrixPolynomialL::usage= "MatrixPolynomialL gives a MxN matrix of values of polynomial L."
MacaulayPow::usage= "gives a Macaulay condiditons of x>=a."
MacaulayPowStrict::usage= "gives a Macaulay condiditons of x>a."
MacaulayDiscConv::usage= "gives a discrete convolution of MacaulayPow."
MacaulayDiscConvStrict::usage= "gives a discrete convolution of MacaulayPowStrict."
MacaulayDiscConvTable::usage= "gives a table consisting of discrete convolution of MacaulayPow."
MacaulayDiscConvTableStrict::usage= "gives a table consisting of discrete convolution of MacaulayPowStrict."
GeneralP::usage= "gives the generalized polynomial P."

Begin["`Private`"]

Unprotect[Power];
Power[0|0., 0|0.] = 1;
Protect[Power];

CoeffA[n_, k_] := 0;
CoeffA[n_, k_] := (2k+1) * Binomial[2k, k] * Sum[CoeffA[n, j] * Binomial[j, 2k+1]*(-1)^(j-1)/(j-k) * BernoulliB[2j-2k], {j, 2k+1, n}] /; 0 <= k < n;
CoeffA[n_, k_] := (2n+1) * Binomial[2n, n] /; k == n;

L[m_, n_, k_] := Sum[CoeffA[m, r] * k^r * (n-k)^r, {r, 0, m}];
P[m_, n_, b_] := Expand[Sum[L[m, n, k], {k, 0, b-1}]];
H[m_, t_, b_] := Sum[Binomial[j, t] * CoeffA[m, j] * (-1)^j/(2j-t+1) * Binomial[2j-t+1, b] * BernoulliB[2 j-t+1-b], {j, t, m}];
X[m_, t_, j_] := Expand[(-1)^m Sum[H[m, t, k] j^k, {k, 1, 2m-t+1}]];
S[p_, n_]:= Sum[k^p, {k, 0, n-1}];

ConvolveSum[n_, r_, b_] := Sum[k^r (n-k)^r, {k, 0, b-1}];
PiecewisePow[x_, n_, a_] := x^n Boole[x >= a];
MacaulayPow[x_, n_, a_] := Piecewise[{{(x-a)^n, x>=a}, {0, True}}];
MacaulayPowStrict[x_, n_, a_] := Piecewise[{{(x-a)^n, x>a}, {0, True}}];

PiecewisePowDiscConv[x_, n_, a_]:= Sum[PiecewisePow[k, n, a] * PiecewisePow[x-k, n, a], {k, -Infinity, +Infinity}];
MacaulayDiscConv[x_, n_, a_]:= Sum[MacaulayPow[k, n, a] * MacaulayPow[x-k, n, a], {k, -Infinity, +Infinity}];
MacaulayDiscConvStrict[x_, n_, a_]:= Sum[MacaulayPowStrict[k, n, a] * MacaulayPowStrict[x-k, n, a], {k, -Infinity, +Infinity}];
ContinuousConvf[x_, n_, a_]:= Integrate[PiecewisePow[k, n, a] * PiecewisePow[x-k, n, a], {k, -Infinity, +Infinity}];

P2[m_, n_, b_] := Expand[n^Boole[Mod[m, 2]==0]* P[Floor[(m-1)/2], n, b]];
GeneralP[m_, n_, a_, b_] := Expand[Sum[L[m, n, k], {k, a, b-1}]];

DiscConvTable[m_] := Column[Table[PiecewisePowDiscConv[n-k, k, 0], {n, 0, m}, {k, 0, n}], Left];
MacaulayDiscConvTable[m_, a_] := Column[Table[MacaulayDiscConv[n-k, k, a], {n, 0, m}, {k, 0, n}], Left];
MacaulayDiscConvTableStrict[m_, a_] := Column[Table[MacaulayDiscConvStrict[n-k, k, a], {n, 0, m}, {k, 0, n}], Left];
MatrixPolynomialL[m_, M_, N_] := Column[Table[L[m, n, k], {n, -N, N}, {k, -M, M}], Left];

End[ ]

EndPackage[ ]


(* ::Code:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::Code:: *)
(**)
