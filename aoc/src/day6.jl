module day6

using ..Test
using ..DelimitedFiles

function parseIO(io::IO)::Vector{BigInt}
	input = readdlm(io, ',', Int)	
	return vec(input)
end

function fish(io::IO, day::Int)
	# idea: simulate the days

	input = parseIO(io)
	m = vec([0,0,0,0,0,0,0,0,0])
	counter = 0

	# set up inputs
	for e in input
		m[e] += 1
	end


	for d in 1:day-1
		count = m[1] # 0
		for i in 2:9 # from 1-8: current -1 / next  +1
			next = m[i]
			m[i-1]  = next
		end
		m[9] =  count	
		m[7] += count
	end
	return sum(m, dims=1)[1,1]
end

function part1(io::IO)
	return fish(io, 80)
end

function part2(io::IO)
	return fish(io, 256)
end

end
