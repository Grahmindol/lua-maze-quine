local code=[[local a=%q a=string.gsub(string.gsub(string.format(a,a),string.char(34),string.char(91,91),1),string.char(34),string.char(93,93),1)a=string.gsub(string.gsub(a,string.char(10),string.char(32)),string.char(92,32),string.char())local b=-1;while b~=0 do a,b=string.gsub(a,string.char(32,32),string.char(32))end;local c=require(string.char(108,101,120,101,114))local function d(e,f)f=f or e;if e%%2==0 then e=e+1 end;if f%%2==0 then f=f+1 end;local g={}for h=1,(e+1)*f do g[h]=1 end;local i,j=0,0;local k,l=math.random(1,(f-1)/2)*2,math.random(1,(e-1)/2)*2;local m,n=0,0;local o={{0,1},{0,-1},{1,0},{-1,0}}local function p(q,r)return q<f and q>0 and r<e and r>0 end;local function s(q,r)m=m+1;if m>n then i,j=q,r;n=m end;local t={}for u,v in ipairs(o)do table.insert(t,v)end;for h=#t,2,-1 do local w=math.random(1,h)t[h],t[w]=t[w],t[h]end;for u,x in ipairs(t)do local y,z=q+2*x[1],r+2*x[2]if p(y,z)and g[z*f+y]==1 then g[(z-x[2])*f+y-x[1] ]=0;g[z*f+y]=0;s(y,z)m=m-1 end end end;g[l*f+k]=2;s(k,l)g[j*f+i]=3;g.h=e;g.w=f;function g.print(A)A=A or 4;if A%%2==1 then A=A+1 end;local B=c(a)[1]for C,D in pairs(B)do if D.data==string.char(91,91)then C=C+1;local E=c(table.remove(B,C).data)[1]for h=#E,1,-1 do table.insert(B,C,E[h])end;break end end;local C=1;local function F(G,H)H=H or false;if G<=0 then return string.char(),G end;while H and C<=#B and B[C].type==string.char(119,104,105,116,101,115,112,97,99,101)do C=C+1 end;local I=string.char(45,45)if C<=#B then I=B[C].data;C=C+1 end;local J,K=F(G-#I)if G-#I>=K then return I..J,K end;C=C-1;return I,G-#I end;local L=0;for h=1,e do for u=1,A/2-1 do for w=1,f do if g[h*f+w]==1 then local J,K=F(A-L,g[h*f+w-1]==0)L=-K;io.write(J)else io.write(string.rep(string.char(32),A-L))L=math.max(0,L-A)end end;io.write(string.char(10))L=0 end end;while C<=#B do local x,u=F(f*A)io.write(x)io.write(string.char(10))end end;return g end;d(19,11).print(8)]]
code = string.gsub(string.gsub(string.format(code, code),string.char(34),string.char(91,91),1),string.char(34),string.char(93,93),1)
code = string.gsub(string.gsub(code,string.char(10),string.char(32)),string.char(92,32),string.char())
local space_removed = -1
while space_removed ~= 0 do 
    code,space_removed = string.gsub(code,string.char(32,32),string.char(32))
end

local lex = require(string.char(108,101,120,101,114))


local function genMaze(h, w)
    w = w or h
    if h % 2 == 0 then h = h + 1 end
    if w % 2 == 0 then w = w + 1 end

    local maze = {}
    for i = 1, (h + 1) * w do maze[i] = 1 end

    local fx, fy = 0, 0
    local sx, sy = math.random(1, (w - 1) / 2) * 2, math.random(1, (h - 1) / 2) * 2
    local distance, farest_distance = 0, 0

    local dirs = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}}

    local function isInBound(x, y)
        return x < w and x > 0 and y < h and y > 0
    end

    local function carve(x, y)
        distance = distance + 1
        if distance > farest_distance then
            fx, fy = x, y
            farest_distance = distance
        end

        local shuffled_dirs = {}
        for _, dir in ipairs(dirs) do
            table.insert(shuffled_dirs, dir)
        end
        for i = #shuffled_dirs, 2, -1 do
            local j = math.random(1, i)
            shuffled_dirs[i], shuffled_dirs[j] = shuffled_dirs[j], shuffled_dirs[i]
        end

        for _, d in ipairs(shuffled_dirs) do
            local nx, ny = x + 2 * d[1], y + 2 * d[2]
            if isInBound(nx, ny) and maze[ny * w + nx] == 1 then
                maze[(ny - d[2]) * w + nx - d[1]] = 0
                maze[ny * w + nx] = 0
                carve(nx, ny)
                distance = distance - 1
            end
        end
    end

    maze[sy * w + sx] = 2
    carve(sx, sy)
    maze[fy * w + fx] = 3
    maze.h = h
    maze.w = w

    function maze.print(r)
        r = r or 4
        if r % 2 == 1 then r = r + 1 end
        local token = lex(code)[1]
		for k,v in pairs(token) do
			if v.data == string.char(91,91) then
				k = k+1
				local sub = lex(table.remove(token,k).data)[1]
				for i=#sub,1,-1 do
					table.insert(token,k,sub[i])
				end
				break
			end
		end
        local k = 1

        local function getChunk(td, isAfterSpace)
            isAfterSpace = isAfterSpace or false
            if td <= 0 then return string.char(), td end

            while isAfterSpace and k <= #token and token[k].type == string.char(119,104,105,116,101,115,112,97,99,101) do
                k = k + 1
            end
			local s = string.char(45,45)
			if k <= #token then
            	s = token[k].data
            	k = k + 1
			end

            local data, over = getChunk(td - #s)
            if td - #s >= over then
                return s .. data, over
            end

            k = k - 1
            return s, td - #s
        end

        local late = 0
        for i = 1, h do
            for _ = 1, r / 2 - 1 do
                for j = 1, w do
                    if maze[i * w + j] == 1 then
                        local data, over = getChunk(r - late, maze[i * w + j - 1] == 0)
                        late = -over
                        io.write(data)
                    else
                        io.write(string.rep(string.char(32), r - late))
                        late = math.max(0, late - r)
                    end
                end
                io.write(string.char(10))
                late = 0
            end
        end
		while k <= #token do 
            local d,_ = getChunk(w*r)
			io.write(d)
            io.write(string.char(10))
		end
    end

    return maze
end

genMaze(19,11).print(8)
