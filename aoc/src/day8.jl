module day8

using ..Test
using ..DelimitedFiles

function parseIO(io::IO)
	# sort the wires so it's easier to set up a lookup table
	input = [(String ∘ sort ∘ collect)(x) for x in readdlm(io)]
	return input[:,(1:end).∉11]
end

function part1(io::IO)
	# length == 2 → 1 {c, f}
	# length == 3 → 7 {a, c, f}
	# length == 4 → 4 {b, c, d, f}
	# length == 7 → 8 {a, b, c, d, e, f, g}
	
	input = parseIO(io)[:, (11:end)]
	count = 0
	for seg in input
		if length(seg) == 2
			count += 1
		elseif length(seg) == 4
			count += 1
		elseif length(seg) == 3
			count += 1
		elseif length(seg) == 7
			count += 1
		end
	end
	return count
end



function part2(io::IO)

	# length == 2 → 1 {c, f}
	# length == 3 → 7 {a, c, f}
	# length == 4 → 4 {b, c, d, f}
	# length == 7 → 8 {a, b, c, d, e, f, g}
	# get frequency of each seg
	# if seg 
	input =  parseIO(io)

	table = input[:, (1:11)]
	display = input[:, (11:end)]
	
	count = 0
end

end
