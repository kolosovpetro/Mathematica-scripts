(* ::Package:: *)

BeginPackage["UnitTests`"]

UnitTest1::usage= "Performes Unit test 1 from source https:// ... "
UnitTest2::usage= "Performes Unit test 2 from source https:// ... "
UnitTest3::usage= "Performes Unit test 3 from source https:// ... "
UnitTest4::usage= "Performes Unit test 4 from source https:// ... "
UnitTest5::usage= "Performes Unit test 5 from source https:// ... "
UnitTest6::usage= "Performes Unit test 6 from source https:// ... "
UnitTest7::usage= "Performes Unit test 7 from source https:// ... "
UnitTest8::usage= "Performes Unit test 8 from source https:// ... "
UnitTest9::usage= "Performes Unit test 9 from source https:// ... "
UnitTest10::usage= "Performes Unit test 10 from source https:// ... "
UnitTest11::usage= "Performes Unit test 11 from source https:// ... "
UnitTest12::usage= "Performes Unit test 12 from source https:// ... "
UnitTest13::usage= "Performes Unit test 13 from source https:// ... "
UnitTest14::usage= "Performes Unit test 14 from source https:// ... "
UnitTest15::usage= "Performes Unit test 15 from source https:// ... "
UnitTest16::usage= "Performes Unit test 16 from source https:// ... "

Begin["`Private`"]

Needs["MainDefinitions`"]

UnitTest1 := Column[Table[Expand[P[m,t,a,b] == P[m,t,0,b]-P[m,t,0,a]],{m,0,10},{t,0,10}],Left];
UnitTest2 := Column[Table[Expand[P[m,t,a,b] == Sum[(-1)^(m-j) X[m,j,a,b] t^j,{j,0,m}]],{m,0,3},{t,0,10}],Left];
UnitTest3 := Column[Table[Expand[X[m,t,a,b]==X[m,t,0,b]-X[m,t,0,a]],{m,0,10},{t,0,10}],Left];
UnitTest4 := Column[Table[Simplify[X[m,t,a,b]==(-1)^m Sum[H[m,t,k]*(b^k-a^k),{k,1,2 m-t+1}]],{m,0,10},{t,0,10}],Left];
UnitTest5 := Column[Table[Expand[P[m,t,a,b]==Sum[(-1)^(m-j) (-1)^m Sum[H[m,j,k]*(b^k-a^k),{k,1,2 m-j+1}] t^j,{j,0,m}]],{m,0,10},{t,0,10}],Left];
UnitTest6 := Column[Table[FullSimplify[Q[r, n, a, b] == Q[r, n, 0, b] - Q[r, n, 0, a]], {r, 0, 10}, {n, 0, 7}], Left];
UnitTest7 := Column[Table[FullSimplify[DiscreteConvf[r,t,n]==Q[r,n,t,n-t+1]],{t,0,5},{n,0,5}],Left];
UnitTest8 := Column[Table[FullSimplify[n^(2m+1)+1 == Sum[CoeffA[m,r]*DiscreteConvf[r,0,n], {r,0,m}]], {n,0,5}, {m,0,3}], Left];
UnitTest9 := Column[Table[FullSimplify[n^(2m+1)-1 == Sum[CoeffA[m,r]*DiscreteConvf[r,1,n], {r,0,m}]], {n,0,5}, {m,0,3}], Left];
UnitTest10 := Column[Table[FullSimplify[X[m,t,a,b]==(-1)^m Sum[CoeffA[m,j] (-1)^j Binomial[j,t] (S[2 j-t,b]-S[2 j-t,a]),{j,t,m}]],{m,0,10},{t,0,10}],Left];
UnitTest11 := Column[Table[FullSimplify[P[m,n,a,b] == Sum[Sum[(-1)^(2m+j-k)CoeffA[m,j]Binomial[j,k](S[2j-k,b]-S[2j-k,a])n^k, {j,k,m}],{k,0,m}]], {m,0,10},{n,0,10}],Left];
UnitTest12 := Column[Table[Expand[(a+b)^(2m+1)]== P[m, a+b, 0, a+b], {m, 0, 10}, {a, 0, 10}], Left];
UnitTest13 := Column[Table[FullSimplify[n^(2m+1) == P[m, n, 0, n]], {m, 0, 10}, {n, 0, 10}], Left];
UnitTest14 := Column[Table[FullSimplify[n^t== n^(Boole[Mod[t, 2]== 0]) P[Floor[(t-1)/2], n, 0, n]], {t, 0, 10}, {n, 0, 10}], Left];
UnitTest15 := Column[Table[FullSimplify[P[m, n, t, n-t+1]== Sum[CoeffA[m, r] * DiscreteConvf[r, t, n], {r, 0, m}]], {m,0, 2},{n, 0, 10}, {t, 0, 10}], Left];
UnitTest16 := Column[Table[FullSimplify[1== P[m, n, 0, n]-P[m, n, 1, n]], {m, 0, 10}, {n, 0, 10}], Left];

End[ ]

EndPackage[ ]



(* ::Code:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::Code:: *)
(**)
