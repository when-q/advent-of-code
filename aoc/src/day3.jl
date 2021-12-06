module day3

using ..Test

function part1(io::IO)
	input = readlines(io)
	gamma = 0b0
	for i = size(input, 1):1
		ones = count_ones(input[i])
		zeros = count_zeros(input[i])

		gamma << 1
		if ones > zeros
			gamma += 1
		end
	end
	return convert(Int64, gamma)
end

end
