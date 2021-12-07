module day3

using ..Test

function part1(io::IO)
	input = readlines(io)
	count = fill(0, length(input[1]))
	gamma = "0b"
	epsilon = "0b"
	for i in 1:length(input)
		for (j, v) in enumerate(input[i])
			if v == '0'
				count[j] -= 1
			else
				count[j] += 1
			end
		end
	end

	for i in 1:length(input[1])
		if count[i] <= 0
			gamma *= "0"
		else
			gamma *= "1"
		end
	end
	shift = 64 - length(input[1])

	g = parse(UInt64, gamma)
	return Int(g*(~g << shift >>shift))
end


function part2(io::IO)
	input = readlines(io)
	m = [[parse(Int64, ss) for ss in split(y, "")] for y in input]
	n = copy(m)
	g = (part2_getValue ∘ part2_filter)(m, true)	
	e = (part2_getValue ∘ part2_filter)(n, false)

	return Int(g*e)
end

function part2_filter(m::Vector{Vector{Int64}}, gamma::Bool)::Vector{Int64}

	for current in 1:length(m[1])

		count = 0
		if length(m) == 1
			break
		end

		for i in 1:length(m)

			if m[i][current] == 0 
				count -= 1
			else
				count += 1
			end
		end
		
		if gamma == true
			if count >= 0 # keep 1
				keepat!(m, [v[current] == 1 for v in m]) 
			else
				keepat!(m, [v[current] == 0 for v in m]) 
			end
		else
			if count < 0
				keepat!(m, [v[current] == 1 for v in m]) 
			else
				keepat!(m, [v[current] == 0 for v in m]) 
			end
		end
	end

	return m[1]
end




function part2_getValue(g::Vector{Int64})

	result = "0b"
	for b in g
		result *= string(b)
	end
	result = parse(UInt64, result)
	return result
end

end
