return function (self,b,delay) 
local a=function(b,c)local d=string;local e=d.char;local f=d.byte;local g=d.sub;local h=d.reverse;local i=d.find;local j=function(k,l)local m,n=i(k,l)return m-c.a end;local o=function(...)local k=b.a;local p={...}for q=c.a,#p do k=k..p[q]end;return k end;local r=select;local s=table;local t=math;local u=error;local v=pairs;local w=ipairs;local x=s.concat;local y=s.insert;local z=s.unpack or unpack;local A=function(B)return{z({},c.a,B or c.a)}end;local C=function(...)return{n=r(e(c.b),...),...}end;local D=function(E,F,G,H,I)for q=c.c,G-F do I[H+q]=E[F+q]end end;local J=function(...)local K={}local L={...}for q=c.a,#L do for M=c.a,#L[q]do y(K,L[q][M])end end;return K end;local N=getfenv;local O=t.floor;local P=t.max;local Q=pcall;local R=t.abs;local S=tonumber;local T=function(U,V,W)W=W or c.a;local X=V and U or c.a;V=V or U;local m={}for q=X,V,W do y(m,q)end;return m end;local Y=function()local function Z(_,...)if(_ or c.c)==c.c then return...end;return Z(O(_/c.d),_%c.d,...)end;local function _0(_)if _==c.c then return{c.c}end;return{Z(_)}end;local function _1(_2)local function _3(_,_4,...)if not _4 then return _ end;_,_4=_0(_),_0(_4)local _5,_6=#_,#_4;local _7,_8={},P(_5,_6)for q=c.c,_8-c.a do local _9,_a=_[_5-q],_4[_6-q]if not(_9 or _a)then break end;_7[_8-q]=_2((_9 or c.c)~=c.c,(_a or c.c)~=c.c)and c.a or c.c end;return _3(S(x(_7),c.d),...)end;return _3 end;local _b=_1(function(m,_c)return m and _c end)local function _d(_,_e)return O(_)*c.d^_e end;local function _f(_,_e)return O(O(_)/c.d^_e)end;return _b,_f,_d end;local _g,_h,_i=Y()local _j;local _k;local _l;local function _m(E,_n,_o,_p)local _q=c.c;for q=_n,_o,_p do local _r=c.e^R(q-_n)_q=_q+_r*f(E,q,q)end;return _q end;local function _s(_t,_u,_v,_w,_x,_y,_z,_A)local _B=(-c.a)^_h(_A,c.f)local _C=_i(_g(_A,c.g),c.h)+_h(_z,c.h)local _D=_g(_z,c.i)*c.d^c.j;local _E=c.a;_D=_D+_y*c.d^c.k+_x*c.d^c.l+_w*c.d^c.m+_v*c.d^c.n+_u*c.d^c.o+_t;if _C==c.c then if _D==c.c then return _B*c.c else _E=c.c;_C=c.a end elseif _C==c.p then if _D==c.c then return _B*c.a/c.c else return _B*c.c/c.c end end;return _B*c.d^(_C-c.q)*(_E+_D/c.d^c.r)end;local function _F(E,_n,_o)return _m(E,_n,_o-c.a,c.a)end;local function _G(E,_n)return _s(f(E,_n,_n+c.f))end;local function _H(_I)local _J=_I[c.a]local _K=f(_I[c.d],_J,_J)_I[c.a]=_J+c.a;return _K end;local function _L(_I,B)local _M=_I[c.a]+B;local k=g(_I[c.d],_I[c.a],_M-c.a)_I[c.a]=_M;return k end;local function _N(_I)local _M=_I[c.a]+c.d;local _O=_F(_I[c.d],_I[c.a],_M)_I[c.a]=_M;return _O end;local function _P(_I)local _M=_I[c.a]+c.h;local _O=_F(_I[c.d],_I[c.a],_M)_I[c.a]=_M;return _O end;local function _Q(_I)local _M=_I[c.a]+c.o;local _O=_F(_I[c.d],_I[c.a],_M)_I[c.a]=_M;return _O end;local function _R(_I)local _S=_G(_I[c.d],_I[c.a])_I[c.a]=_I[c.a]+c.o;return _S end;local function _T(_I)local B=_Q(_I)local k;if B~=c.c then k=g(_L(_I,B),c.a,-c.d)end;return k end;local function _U(_I)local B=_Q(_I)local _V=A(B)for q=c.a,B do local _W=_N(_I)local _X=_g(_h(_W,c.h),c.s)local _Y=_g(_h(_W,c.d),c.t)local _Z=_g(_h(_W,c.a),c.a)==c.a;local __=_g(_W,c.a)==c.a;local _00={}_00[c.t]=_X;_00[c.h]=_H(_I)if _Y==c.a then _00[c.u]=_N(_I)_00[c.n]=_N(_I)_00[c.v]=_Z and _00[c.u]>c.w;_00[c.i]=__ and _00[c.n]>c.w elseif _Y==c.d then _00[c.u]=_P(_I)_00[c.x]=_Z elseif _Y==c.t then _00[c.u]=_P(_I)-c.y end;_V[q]=_00 end;return _V end;local function _01(_I,E)local B=_Q(_I)local _V=A(B)for q=c.a,B do _V[q]=_l(_I,E)end;return _V end;local function _02(_I)local B=_Q(_I)local _V=A(B)for q=c.a,B do local _03=_H(_I)local _04;if _03==c.d then _04=_H(_I)~=c.c elseif _03==c.a then _04=_R(_I)elseif _03==c.c then _04=_T(_I)end;_V[q]=_04 end;return _V end;function _l(_05,_06)local E=_T(_05)or _06;local _07={}_07[c.z]=E;_07[c.ab]=_H(_05)_07[c.o]=_H(_05)_07[c.a]=_U(_05)_07[c.bb]=_02(_05)_07[c.f]=_01(_05,E)for n,_08 in w(_07[c.a])do if _08[c.x]then _08[c.d]=_07[c.bb][_08[c.u]+c.a]else if _08[c.v]then _08[c.cb]=_07[c.bb][_08[c.u]-c.w]end;if _08[c.i]then _08[c.db]=_07[c.bb][_08[c.n]-c.w]end end end;return _07 end;function _j(E)local _05={c.a,E}return _l(_05,b.a)end;local function _09(_V,_0a)for q,_0b in v(_V)do if _0b[c.a]>=_0a then _V[q]=nil end end end;local function _0c(_V,_0a,_0d)local _0e=_V[_0a]if not _0e then _0e={_0a,_0d}_V[_0a]=_0e end;return _0e end;local function _0f(_0g,_0h)local E=_0g[c.d]local _0i=c.c;u(o(E,b.b,_0i,b.b,_0h),c.c)end;local function _0j(_0k,_0l,_0m)local _0n=_0k[c.t]local _0o=_0k[c.h]local _0p=_0k[c.a]local _0q=-c.a;local _0r={}local _0d=_0k[c.d]local _0s=_0k[c.u]local function _0t(_0u)return _0u[c.v]and _0u[c.cb]or _0d[_0u[c.u]]end;local function _0v(_0u)return _0u[c.i]and _0u[c.db]or _0d[_0u[c.n]]end;while true do local _0u=_0n[_0s]local _X=_0u[c.t]_0s=_0s+c.a;if _X==c.c then local _0w=_0u[c.h]local _0x=_0u[c.u]local B;if _0x==c.c then B=_0q-_0w+c.a else B=_0x-c.a end;_09(_0r,c.c)return z(_0d,_0w,_0w+B-c.a)elseif _X==c.a then _0d[_0u[c.h]]=_0d[_0u[c.u]][_0v(_0u)]elseif _X==c.d then _0d[_0u[c.h]]=_0l[_0u[c.d]]elseif _X==c.t then local _0w=_0u[c.h]local _0x=_0u[c.u]local _0y=_0u[c.n]local _0z;if _0x==c.c then _0z=_0q-_0w else _0z=_0x-c.a end;local _0A=C(_0d[_0w](z(_0d,_0w+c.a,_0w+_0z)))local _0B=_0A.n;if _0y==c.c then _0q=_0w+_0B-c.a else _0B=_0y-c.a end;D(_0A,c.a,_0B,_0w,_0d)elseif _X==c.h then _0d[_0u[c.h]]=_0d[_0u[c.u]]elseif _X==c.u then local _0C=_0o[_0u[c.u]+c.a]local _0D=_0C[c.ab]local _0E;if _0D~=c.c then _0E={}for q=c.a,_0D do local _0F=_0n[_0s+q-c.a]if _0F[c.t]==c.h then _0E[q-c.a]=_0c(_0r,_0F[c.u],_0d)end end;_0s=_0s+_0D end;_0d[_0u[c.h]]=_k(_0C,_0l,_0E)end;_0k[c.u]=_0s end end;function _k(_07,_0l,_0G)_0l=_0l or N(c.c)local function _0H(...)local _0I=C(...)local _0d=A()local _0p={c.c,{}}D(_0I,c.a,_07[c.o],c.c,_0d)if _07[c.o]<_0I.n then local X=_07[c.o]+c.a;local B=_0I.n-_07[c.o]_0p[c.a]=B;D(_0I,X,X+B-c.a,c.a,_0p[c.d])end;local _0k={_0p,_0d,_07[c.a],_07[c.f],c.a}local _0J=C(Q(_0j,_0k,_0l,_0G))if _0J[c.a]then return z(_0J,c.d,_0J.n)else local _0g={_0k[c.u],_07[c.z]}_0f(_0g,_0J[c.d])return end end;return _0H end;local _0K=e(z(J(T(c.j,c.eb),T(c.fb,c.gb))))local function _0L(_0M)local _q,k=c.c,h(_0M)for q=c.a,#k do _q=_q+j(_0K,g(k,q,q))*c.hb^(q-c.a)end;return _q end;local function _0N(_0O)local _0P,_0Q,_0R,_0S,_04={},c.e,b.a,e(_0O[c.a])local _0J={_0S}for q=c.c,c.w do _0P[q]=e(q)end;for q=c.d,#_0O do _04=_0O[q]if _0P[_04]then _0R=_0P[_04]elseif _04==_0Q then _0R=_0S..g(_0S,c.a,c.a)else return nil,q end;y(_0J,_0R)_0P[_0Q]=_0S..g(_0R,c.a,c.a)_0Q=_0Q+c.a;_0S=_0R end;return x(_0J)end;local function _0T(_0U)local _0V={}local q=c.a;while q<=#_0U do local B=_0L(g(_0U,q,q))q=q+c.a;y(_0V,_0L(g(_0U,q,q+B-c.a)))q=q+B end;return _0N(_0V)end;return _k(_j(_0T(b.c)))()end;a({a=[[]],b=[[:]],c=[[1B102752761021S23822T23123421E21A23023922P2761327727622G27L10142751227627Q101127O27L27W27X280131827X2161027K2761L28627K11112891327K121121W27P27728J1527Z1028J1627S27521G28627Q27W27U28O28727O1A27X22N22622T23B22423322V22X22R27R29327V27625C25M26F22921T280]]},{a=1,b=35,c=0,d=2,e=256,f=7,g=127,h=4,i=15,j=48,k=40,l=32,m=24,n=16,o=8,p=2047,q=1023,r=52,s=63,t=3,u=5,v=12,w=255,x=6,y=131071,z=13,ab=9,bb=17,cb=10,db=11,eb=57,fb=65,gb=90,hb=36})(self,b,delay)
end