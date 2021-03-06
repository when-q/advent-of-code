module day10

using ..Test
using Statistics

function parseIO(io::IO)::Vector{Vector{String}}
	input = readlines(io)
	m = [[string(ss) for ss in split(y, "")] for y in input]
	return m
end

function match(left::Vector{String}, bracket::String)::Bool
	if length(left) == 0
		return false
	end
	if bracket == ")" && last(left)== "("
		return true
	elseif bracket == "]" && last(left) == "["
		return true
	elseif bracket == ">" && last(left) == "<"
		return true
	elseif bracket == "}" && last(left) == "{"
		return true
	end
	return false
end

function score(bracket::String)::Int
	if bracket == ")"
		return 3
	elseif bracket == "]"
		return 57
	elseif bracket == "}"
		return 1197
	elseif bracket == ">"
		return 25137
	else
		return 11111111
	end
end

function part1(io::IO)::Int
	input = parseIO(io)
	result = 0
	for line in input
		left = Vector{String}()
		for bracket in line
			if bracket ∈ ["(", "<", "[","{"]
				push!(left, bracket)
			elseif bracket ∈ [")", ">", "]","}"]
				if match(left, bracket) == false
					result += score(bracket)
					break
				else
					pop!(left)
				end
			end
		end
	end
	return result
end

function complete(left::Vector{String})::Int
	result = 0
	for i in length(left):-1:1
		result *= 5
		b = left[i]
		if b == "("
			result += 1
		elseif b == "["
			result += 2
		elseif b == "<"
			result += 4
		else
			result += 3
		end
	end
	return result
end

function part2(io::IO)
	result = Vector{Int}()
	input = parseIO(io)
	noComplete = false
	for line in input
		left = Vector{String}()
		for bracket in line
			if bracket ∈ ["(", "<", "[","{"]
				push!(left, bracket)
			elseif bracket ∈ [")", ">", "]","}"]
				if match(left, bracket) == false
					noComplete = true
					break
				else
					noComplete = false
					pop!(left)
				end
			end
		end
		if (noComplete == false)
			push!(result, complete(left))
		end
	end
	return convert(Int, median(sort(result)))
end

end
