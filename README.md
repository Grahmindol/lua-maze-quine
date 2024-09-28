# Générateur de Labyrinthe Quine

## Présentation

Ce projet est un **quine**, un programme qui, lorsqu'il est exécuté, génère son propre code. Dans ce cas, le quine génère un labyrinthe aléatoire en Lua. Chaque labyrinthe est unique, et le code produit peut lui-même être exécuté pour générer un nouveau labyrinthe à chaque itération.

## Code

```lua
local a=[[local a=%q a=string.gsub(string.gsub(string.format(a,a),string.char(34),string
.char(91,91),1),string.char(34),string.char(93,93),1)a=string.gsub(string.gsub(a,string.
char(10),string.char(32)),string.char(92,32),string.char())local b=-1;while b~=0 do a,b=
string.gsub     (a,string                       .char(32                        ,32),string
.char(32        ))end;local                     c=require                       (string.
char(108        ,101,120                        ,101,114                        ))local 
function        d(e,f)f=        f or e;if       e%%2==0 then e=e+1 end;if       f%%2==0
then f=f        +1 end;local    g={}for         h=1,(e+1)*f do g[h]=1 end       ;local i
,j=0,0;local    k,l=math        .random(        1,(f-1)/2)*2,math.random        (1,(e-1)
/2)*2;local     m,n=0,0;        local o=                        {{0,1},{        0,-1},{1
,0},{-1,        0}}local        function                        p(q,r)return    q<f and
q>0 and         r<e and         r>0 end;                        local function  s(q,r)m=
m+1;if m        >n then         i,j=q,r;n=m end;local t=        {}for u,        v in ipairs
(o)do table     .insert(        t,v)end;for h=#t,2,-1 do        local w=        math.random
(1,h)t[h        ],t[w]=t        [w],t[h]end;for u,x in ipairs   (t)do local     y,z=q+2*
x[1],r+2        *x[2]if         p(y,z)and       g[z*f+y]        ==1 then        g[(z-x[2
])*f+y-x        [1] ]=0;        g[z*f+y]        =0;s(y,z        )m=m-1 end      end end;
g[l*f+k]        =2;s(k,l        )g[j*f+i        ]=3;g.h=        e;g.w=f;        function
 g.print        (A)A=A or       4;if A%%        2==1 then       A=A+1 end       ;local B
=c(a)[1]        for C,D         in pairs        (B)do if        D.data==        string.char
(91,91)then     C=C+1;local     E=c(table       .remove(        B,C).data       )[1]for
h=#E,1,-        1 do table                      .insert(        B,C,E[h])       end;break
 end end        ;local C                        =1;local        function        F(G,H)H=
H or false      ;if G<=0                        then return     string.char     (),G end
;while H        and C<=#B and B[C].type==       string.char     (119,104        ,105,116
,101,115        ,112,97,99,101)do C=C+1         end;local       I=string        .char(45
,45)if C        <=#B then I=B[C].data;C=        C+1 end;        local J,        K=F(G-#I
)if G-#I                        >=K then        return I        ..J,K end       ;C=C-1;return
 I,G-#I                         end;local       L=0;for         h=1,e do        for u=1,
A/2-1 do                        for w=1,        f do if         g[h*f+w]        ==1 then
 local J        ,K=F(A-L        ,g[h*f+w        -1]==0)L=-K;io.write(J)else     io.write
(string.        rep(string      .char(32        ),A-L))L=math.max(0,L-A)        end end;
io.write        (string.        char(10))       L=0 end end;while C<=#B         do local
 x,u=F(f        *A)io.write     (x)io.write     (string.                        char(10))
end end;        return g        end;d(19        ,11).print                      (8)]] a=
string.gsub     (string.        gsub(string     .format(                        a,a),string
.char(34        ),string        .char(91        ,91),1),        string.char(34),string.char
(93,93),        1)a=string      .gsub(string    .gsub(a,        string.char(10),string.char
(32)),string    .char(92        ,32),string     .char())        local b=-1;while b~=0 do
 a,b=string     .gsub(a,                        string.char                     (32,32),
string.char     (32))end                        ;local c                        =require
(string.        char(108                        ,101,120                        ,101,114
))local         function d(e,f)f=f or e;if e%2==0 then e=e+1 end;if f%2==       0 then f
=f+1 end        ;local g={}for h=1,(e+1)*f do g[h]=1 end;local i,j=0,0;local    k,l=math
.random(        1,(f-1)/2)*2,math.random(1,(e-1)/2)*2;local m,n=0,0;local       o={{0,1},{
0,-1},{1                        ,0},{-1,                                        0}}local
 function                       p(q,r)return                                    q<f and
q>0 and                         r<e and                                         r>0 end;
local function s(q,r)m=m        +1;if m>        n then i,j=q,r;n=m end;local    t={}for 
u,v in ipairs(o)do table        .insert(        t,v)end;for h=#t,2,-1 do        local w=
math.random(1,h)t[h],t[w        ]=t[w],t        [h]end;for u,x in ipairs        (t)do local
 y,z=q+2                                        *x[1],r+                        2*x[2]if
 p(y,z)and                                      g[z*f+y]                        ==1 then
 g[(z-x[                                        2])*f+y-                        x[1] ]=0
;g[z*f+y]=0;s(y,z)m=m-1 end end end;g[l*f+k]=2;s(k,l)g[j*f+i]=3;g.h=e;g.w=f;function g.print
(A)A=A or 4;if A%2==1 then A=A+1 end;local B=c(a)[1]for C,D in pairs(B)do if D.data==string
.char(91,91)then C=C+1;local E=c(table.remove(B,C).data)[1]for h=#E,1,-1 do table.insert
(B,C,E[h])end;break end end;local C=1;local function F(G,H)H=H or false;if G<=0 then return
 string.char(),G end;while H and C<=#B and B[C].type==string.char(119,104,105,116,101,115
,112,97,99,101)do C=C+1 end;local I=string.char(45,45)if C<=#B then I=B[C].data;C=C+1 end
;local J,K=F(G-#I)if G-#I>=K then return I..J,K end;C=C-1;return I,G-#I end;local L=0;for
 h=1,e do for u=1,A/2-1 do for w=1,f do if g[h*f+w]==1 then local J,K=F(A-L,g[h*f+w-1]==
0)L=-K;io.write(J)else io.write(string.rep(string.char(32),A-L))L=math.max(0,L-A)end end
;io.write(string.char(10))L=0 end end;while C<=#B do local x,u=F(f*A)io.write(x)io.write
(string.char(10))end end;return g end;d(19,11).print(8)

```

## Source
- https://github.com/MakeNowJust/quine/blob/main/quine.lua
- https://github.com/LoganDark/lua-lexer/blob/master/lexer.lua
