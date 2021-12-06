module day3

using DelimitedFiles
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

end
