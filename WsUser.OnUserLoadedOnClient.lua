return function (self,enteredMap,hp,fieldCounter,mapUsers) 
local a=function(b,c)local d=string;local e=d.char;local f=d.byte;local g=d.sub;local h=d.reverse;local i=d.find;local j=function(k,l)local m,n=i(k,l)return m-b.a end;local o=function(...)local k=c.a;local p={...}for q=b.a,#p do k=k..p[q]end;return k end;local r=select;local s=table;local t=math;local u=error;local v=pairs;local w=ipairs;local x=s.concat;local y=s.insert;local z=s.unpack or unpack;local A=function(B)return{z({},b.a,B or b.a)}end;local C=function(...)return{n=r(e(b.b),...),...}end;local D=function(E,F,G,H,I)for q=b.c,G-F do I[H+q]=E[F+q]end end;local J=function(...)local K={}local L={...}for q=b.a,#L do for M=b.a,#L[q]do y(K,L[q][M])end end;return K end;local N=getfenv;local O=t.floor;local P=t.max;local Q=pcall;local R=t.abs;local S=tonumber;local T=function(U,V,W)W=W or b.a;local X=V and U or b.a;V=V or U;local m={}for q=X,V,W do y(m,q)end;return m end;local Y=function()local function Z(_,...)if(_ or b.c)==b.c then return...end;return Z(O(_/b.d),_%b.d,...)end;local function _0(_)if _==b.c then return{b.c}end;return{Z(_)}end;local function _1(_2)local function _3(_,_4,...)if not _4 then return _ end;_,_4=_0(_),_0(_4)local _5,_6=#_,#_4;local _7,_8={},P(_5,_6)for q=b.c,_8-b.a do local _9,_a=_[_5-q],_4[_6-q]if not(_9 or _a)then break end;_7[_8-q]=_2((_9 or b.c)~=b.c,(_a or b.c)~=b.c)and b.a or b.c end;return _3(S(x(_7),b.d),...)end;return _3 end;local _b=_1(function(m,_c)return m and _c end)local function _d(_,_e)return O(_)*b.d^_e end;local function _f(_,_e)return O(O(_)/b.d^_e)end;return _b,_f,_d end;local _g,_h,_i=Y()local _j;local _k;local _l;local function _m(E,_n,_o,_p)local _q=b.c;for q=_n,_o,_p do local _r=b.e^R(q-_n)_q=_q+_r*f(E,q,q)end;return _q end;local function _s(_t,_u,_v,_w,_x,_y,_z,_A)local _B=(-b.a)^_h(_A,b.f)local _C=_i(_g(_A,b.g),b.h)+_h(_z,b.h)local _D=_g(_z,b.i)*b.d^b.j;local _E=b.a;_D=_D+_y*b.d^b.k+_x*b.d^b.l+_w*b.d^b.m+_v*b.d^b.n+_u*b.d^b.o+_t;if _C==b.c then if _D==b.c then return _B*b.c else _E=b.c;_C=b.a end elseif _C==b.p then if _D==b.c then return _B*b.a/b.c else return _B*b.c/b.c end end;return _B*b.d^(_C-b.q)*(_E+_D/b.d^b.r)end;local function _F(E,_n,_o)return _m(E,_n,_o-b.a,b.a)end;local function _G(E,_n)return _s(f(E,_n,_n+b.f))end;local function _H(_I)local _J=_I[b.a]local _K=f(_I[b.d],_J,_J)_I[b.a]=_J+b.a;return _K end;local function _L(_I,B)local _M=_I[b.a]+B;local k=g(_I[b.d],_I[b.a],_M-b.a)_I[b.a]=_M;return k end;local function _N(_I)local _M=_I[b.a]+b.d;local _O=_F(_I[b.d],_I[b.a],_M)_I[b.a]=_M;return _O end;local function _P(_I)local _M=_I[b.a]+b.h;local _O=_F(_I[b.d],_I[b.a],_M)_I[b.a]=_M;return _O end;local function _Q(_I)local _M=_I[b.a]+b.o;local _O=_F(_I[b.d],_I[b.a],_M)_I[b.a]=_M;return _O end;local function _R(_I)local _S=_G(_I[b.d],_I[b.a])_I[b.a]=_I[b.a]+b.o;return _S end;local function _T(_I)local B=_Q(_I)local k;if B~=b.c then k=g(_L(_I,B),b.a,-b.d)end;return k end;local function _U(_I)local B=_Q(_I)local _V=A(B)for q=b.a,B do local _W=_N(_I)local _X=_g(_h(_W,b.h),b.s)local _Y=_g(_h(_W,b.d),b.t)local _Z=_g(_h(_W,b.a),b.a)==b.a;local __=_g(_W,b.a)==b.a;local _00={}_00[b.d]=_X;_00[b.u]=_H(_I)if _Y==b.a then _00[b.v]=_N(_I)_00[b.w]=_N(_I)_00[b.o]=_Z and _00[b.v]>b.x;_00[b.y]=__ and _00[b.w]>b.x elseif _Y==b.d then _00[b.v]=_P(_I)_00[b.z]=_Z elseif _Y==b.t then _00[b.v]=_P(_I)-b.ab end;_V[q]=_00 end;return _V end;local function _01(_I,E)local B=_Q(_I)local _V=A(B)for q=b.a,B do _V[q]=_l(_I,E)end;return _V end;local function _02(_I)local B=_Q(_I)local _V=A(B)for q=b.a,B do local _03=_H(_I)local _04;if _03==b.d then _04=_H(_I)~=b.c elseif _03==b.c then _04=_R(_I)elseif _03==b.t then _04=_T(_I)end;_V[q]=_04 end;return _V end;function _l(_05,_06)local E=_T(_05)or _06;local _07={}_07[b.bb]=E;_07[b.cb]=_H(_05)_07[b.a]=_H(_05)_07[b.i]=_01(_05,E)_07[b.t]=_U(_05)_07[b.f]=_02(_05)for n,_08 in w(_07[b.t])do if _08[b.z]then _08[b.h]=_07[b.f][_08[b.v]+b.a]else if _08[b.o]then _08[b.db]=_07[b.f][_08[b.v]-b.x]end;if _08[b.y]then _08[b.n]=_07[b.f][_08[b.w]-b.x]end end end;return _07 end;function _j(E)local _05={b.a,E}return _l(_05,c.a)end;local function _09(_V,_0a)for q,_0b in v(_V)do if _0b[b.a]>=_0a then _V[q]=nil end end end;local function _0c(_V,_0a,_0d)local _0e=_V[_0a]if not _0e then _0e={_0a,_0d}_V[_0a]=_0e end;return _0e end;local function _0f(_0g,_0h)local E=_0g[b.d]local _0i=b.c;u(o(E,c.b,_0i,c.b,_0h),b.c)end;local function _0j(_0k,_0l,_0m)local _0n=_0k[b.t]local _0o=_0k[b.h]local _0p=_0k[b.a]local _0q=-b.a;local _0r={}local _0d=_0k[b.d]local _0s=_0k[b.z]local function _0t(_0u)return _0u[b.o]and _0u[b.db]or _0d[_0u[b.v]]end;local function _0v(_0u)return _0u[b.y]and _0u[b.n]or _0d[_0u[b.w]]end;while true do local _0u=_0n[_0s]local _X=_0u[b.d]_0s=_0s+b.a;if _X==b.c then local _0w=_0o[_0u[b.v]+b.a]local _0x=_0w[b.cb]local _0y;if _0x~=b.c then _0y={}for q=b.a,_0x do local _0z=_0n[_0s+q-b.a]if _0z[b.d]==b.z then _0y[q-b.a]=_0c(_0r,_0z[b.v],_0d)end end;_0s=_0s+_0x end;_0d[_0u[b.u]]=_k(_0w,_0l,_0y)elseif _X==b.a then _0d[_0u[b.u]]=_0d[_0u[b.v]][_0v(_0u)]elseif _X==b.d then local _0A=_0u[b.u]local _0B=_0u[b.v]local B;if _0B==b.c then B=_0q-_0A+b.a else B=_0B-b.a end;_09(_0r,b.c)return z(_0d,_0A,_0A+B-b.a)elseif _X==b.t then local _0A=_0u[b.u]local _0B=_0u[b.v]local _0C=_0u[b.w]local _0D;if _0B==b.c then _0D=_0q-_0A else _0D=_0B-b.a end;local _0E=C(_0d[_0A](z(_0d,_0A+b.a,_0A+_0D)))local _0F=_0E.n;if _0C==b.c then _0q=_0A+_0F-b.a else _0F=_0C-b.a end;D(_0E,b.a,_0F,_0A,_0d)elseif _X==b.h then _0d[_0u[b.u]]=_0l[_0u[b.h]]elseif _X==b.z then _0d[_0u[b.u]]=_0d[_0u[b.v]]end;_0k[b.z]=_0s end end;function _k(_07,_0l,_0G)_0l=_0l or N(b.c)local function _0H(...)local _0I=C(...)local _0d=A()local _0p={b.c,{}}D(_0I,b.a,_07[b.a],b.c,_0d)if _07[b.a]<_0I.n then local X=_07[b.a]+b.a;local B=_0I.n-_07[b.a]_0p[b.a]=B;D(_0I,X,X+B-b.a,b.a,_0p[b.d])end;local _0k={_0p,_0d,_07[b.t],_07[b.i],b.a}local _0J=C(Q(_0j,_0k,_0l,_0G))if _0J[b.a]then return z(_0J,b.d,_0J.n)else local _0g={_0k[b.z],_07[b.bb]}_0f(_0g,_0J[b.d])return end end;return _0H end;local _0K=e(z(J(T(b.j,b.eb),T(b.fb,b.gb))))local function _0L(_0M)local _q,k=b.c,h(_0M)for q=b.a,#k do _q=_q+j(_0K,g(k,q,q))*b.hb^(q-b.a)end;return _q end;local function _0N(_0O)local _0P,_0Q,_0R,_0S,_04={},b.e,c.a,e(_0O[b.a])local _0J={_0S}for q=b.c,b.x do _0P[q]=e(q)end;for q=b.d,#_0O do _04=_0O[q]if _0P[_04]then _0R=_0P[_04]elseif _04==_0Q then _0R=_0S..g(_0S,b.a,b.a)else return nil,q end;y(_0J,_0R)_0P[_0Q]=_0S..g(_0R,b.a,b.a)_0Q=_0Q+b.a;_0S=_0R end;return x(_0J)end;local function _0T(_0U)local _0V={}local q=b.a;while q<=#_0U do local B=_0L(g(_0U,q,q))q=q+b.a;y(_0V,_0L(g(_0U,q,q+B-b.a)))q=q+B end;return _0N(_0V)end;return _k(_j(_0T(c.c)))()end;a({a=1,b=35,c=0,d=2,e=256,f=7,g=127,h=4,i=15,j=48,k=40,l=32,m=24,n=16,o=8,p=2047,q=1023,r=52,s=63,t=3,u=10,v=13,w=6,x=255,y=9,z=5,ab=131071,bb=17,cb=11,db=14,eb=57,fb=65,gb=90,hb=36},{a=[[]],b=[[:]],c=[[1B102752761021S23822T23123421E21A23023922P2761127727L27M101627N101C27N22227O2771L27O27P111127X1627P1228127Y10131122C101727728B1827K27528B191227628B1A1328M101B1428Q1C1527621G27O28D27K21027528H1028T27M1328P27M22N21Z2881A27N22N22622T23B22423322V22X22R28828L29A27L23K25R26F22921T29927L1827M2921029Q102A229427Q]]})(self,enteredMap,hp,fieldCounter,mapUsers)
end