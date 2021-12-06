module day1

using ..Test

function part1(io::IO)
	input = readlines(io)
	solution = sum(next > prev for (prev, next) in zip(input, input[2:end]))
	return solution
end 

function part2(io::IO)
	input = readlines(io)
	solution = sum(next > prev for (prev, next) in zip(input, input[4:end]))
	return solution
end

# test




end
