module day12
using ..Test

function parseIO(io::IO)
	input = readlines(io)
	d = Dict{String,Vector{String}}() 
	for con in input
		if haskey(d, string(split(con, "-")[1])) 
			push!(d[string(split(con, "-")[1])], String(split(con, "-")[2]))
		else
			d[string(split(con, "-")[1])] = [String(split(con, "-")[2])]
		end

		if haskey(d,string(split(con, "-")[2]))
				push!(d[string(split(con, "-")[2])], String(split(con, "-")[1]))
		else
			d[string(split(con, "-")[2])] = [String(split(con, "-")[1])]
		end
	end

	return d	
end


function upperstring(s::String)
	return all(c->isuppercase(c) | isspace(c), s);
end

counter = 0
function part1(io::IO)
	nodes = parseIO(io)
	delete!(nodes, "end")
	queue = Vector{String}()
	push!(queue, "start")
	search(nodes, queue, "start")

	count = counter

	return count
end
function search(nodes,queue, curr)
	#dfs with backtracing
	if curr == "end"
		global counter += 1
		return 1
	end
	Threads.@threads for v in nodes[curr]
		if (v ∉ queue || upperstring(v)) && v != "start"
			push!(queue, v)
			search(nodes, queue, v)
			pop!(queue) #backtracing
		end
	end
end
# -- part2 --
function part2(io::IO)
	global counter = 0
	nodes = parseIO(io)
	queue = Vector{String}()
	visited = Dict{String, Int}() # hashmap of visited times

	for v in keys(nodes)
		if upperstring(v)
			visited[v] = -9999999 # magic 
		else
			visited[v] = 0
		end
	end

	search2(nodes,queue,"start",visited)
	count = counter
	return count
end

function two(visited::Dict{String, Int})::Bool
	# check whether any node has been visited twice (not upper nodes)
	for k in keys(visited)
		if visited[k] >= 2
			return true
		end
	end
	return false
end

function search2(nodes,queue,curr, visited)
	
	if curr == "end"
		global counter += 1
		return 1
	end
	Threads.@threads for v in nodes[curr]
		if ((two(visited) == false || visited[v] == 0 || upperstring(v)) 
			&& v != "start")
			push!(queue, v)
			visited[v] += 1

			search2(nodes,queue,v,visited)

			visited[v] -= 1
			pop!(queue)
		end
	end
end

end
