module day7

using ..Test
using ..DelimitedFiles
using Statistics

function parseIO(io::IO)
	input = readdlm(io, ',', Int)	
	return vec(input)
end

function part1(io::IO)
	input = sort(parseIO(io))
	if  length(input) % 2 == 0
		s = input[convert(Int, length(input)/2+1)]
	else
		s = (input[floor(length(input)/2)] + input[ceil(length(input)/2)]) / 2
	end
	println(s)
	
	return sum([abs(i-s) for i in input])
end

function part2(io::IO)
	input = sort(parseIO(io))
	s = convert(Int,floor(mean(input)))
	println(s)
	
	return sum([sum([x for x in 1:abs(i-s)])   for i in input])
end
end

