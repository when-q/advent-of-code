module day5

using ..Test

function parseIO(io::IO)

	temp = [[replace(y, "->" => "", "," =>" ")] for y in readlines(io)]
	input = [[parse(Int, ss) for ss in split(y[1])] for y in temp]

	return input
end


function part1(io::IO)

	v = Vector{Tuple{Int64,Int64}}()
	visited = Vector{Tuple{Int64,Int64}}()

	count = 0 
	input = parseIO(io)
	for line in input
		if line[1] == line[3] # vertical
			if line[2] <= line[4]
				for i in line[2] : line[4]
					if ((line[1], i) in v) && ((line[1], i) in visited) == false
						count+=1
						push!(visited, (line[1], i))
						continue
					else
						push!(v, (line[1], i))
					end
				end
			else
				for i in line[4]: line[2]
					if ((line[1], i) in v) && ((line[1], i) in visited) == false
						count+=1
						push!(visited, (line[1], i))
						continue
					else
						push!(v,(line[1], i))
					end
				end
			end

		elseif line[2] == line[4]
			if line[1] <= line[3]
				for j in line[1] : line[3]
					if ((j, line[2]) in v )&& ((j, line[2]) in visited) == false
						count+=1
						push!(visited, (j, line[2]))
						continue
					else
						push!(v,(j, line[2]))
					end
				end
			else
				for j in line[3] : line[1]
					if ((j, line[2]) in v )&& ((j, line[2]) in visited) == false
						count+=1
						push!(visited, (j, line[2]))
						continue
					else
						push!(v,(j, line[2]))
					end
				end

			end
		end
	end

	# no more smart way
	return count
end

function part2(io::IO)
	count = 0 
	input = parseIO(io)

	v = Vector{Tuple{Int64,Int64}}()
	visited = Vector{Tuple{Int64,Int64}}()

	for line in input
		if line[1] == line[3] # vertical
			if line[2] <= line[4]
				for i in line[2] : line[4]
					if ((line[1], i) in v) && ((line[1], i) in visited) == false
						count+=1
						push!(visited, (line[1], i))
						continue
					else
						push!(v, (line[1], i))
					end
				end
			else
				for i in line[4]: line[2]
					if ((line[1], i) in v) && ((line[1], i) in visited) == false
						count+=1
						push!(visited, (line[1], i))
						continue
					else
						push!(v,(line[1], i))
					end
				end
			end

		elseif line[2] == line[4]
			if line[1] <= line[3]
				for j in line[1] : line[3]
					if ((j, line[2]) in v )&& ((j, line[2]) in visited) == false
						count+=1
						push!(visited, (j, line[2]))
						continue
					else
						push!(v,(j, line[2]))
					end
				end
			else
				for j in line[3] : line[1]
					if ((j, line[2]) in v )&& ((j, line[2]) in visited) == false
						count+=1
						push!(visited, (j, line[2]))
						continue
					else
						push!(v,(j, line[2]))
					end
				end

			end
		else
			if line[1] >= line[3] && line[2] >= line[4]
				for j in 0 :line[1] -  line[3]
					if ((j+line[3], j+line[4]) in v ) && ((j+line[3], j+line[4]) in visited) == false
						count+=1
						push!(visited, (j+line[3], j+line[4]))
						continue
					else
						push!(v,(j+line[3], j+line[4]))
					end
				end
			elseif line[1] >= line[3] && line[2] <= line[4]
				for j in 0 :line[1] -  line[3]
					if ((line[3]+j, line[4] - j) in v )&& ((line[3]+j, line[4] - j) in visited) == false
						count+=1
						push!(visited, (line[3]+j, line[4] - j))
						continue
					else
						push!(v,(line[3]+j, line[4] - j))
					end
				end

			elseif line[1] <= line[3] && line[2] >= line[4]
				for j in  0: line[3] - line[1] 
					if ((line[3] - j, line[4]+j) in v )&& ((line[3] - j, line[4]+j) in visited) == false
						count+=1
						push!(visited, (line[3] - j, line[4]+j))
						continue
					else
						push!(v,(line[3] - j, line[4]+j))
					end
				end
			else
				for j in  0: line[3] - line[1] 
					if ((line[3] - j, line[4]-j) in v )&& ((line[3] - j, line[4]-j) in visited) == false
						count+=1
						push!(visited, (line[3] - j, line[4]-j))
						continue
					else
						push!(v,(line[3] - j, line[4]-j))
					end
				end

			end

	
		end

	end
	return count

end

end
