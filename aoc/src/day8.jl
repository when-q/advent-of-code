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
		if length(seg) ∈ [2,4,3,7]
			count += 1
		end
	end
	return count
end

function seg_comp(a, b)
	# refuse to elaborate
	# constraint: length(a) < length(b)
	return sum([!occursin(x, b) for x in a])
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
	for i in 1:size(input, 1)
		# indexing both table and display at the same time
		
		parse_table = Dict{String, String}()
		# parse
		while(length(parse_table) != 10)
			for seg in table[i, :]
				# 1, 7, 4, 8
				if length(seg) == 2
					parse_table["1"] = seg
				elseif length(seg) == 3
					parse_table["7"] = seg
				elseif length(seg) == 4
					parse_table["4"] = seg
				elseif length(seg) == 7
					parse_table["8"] = seg
				end

				# do advanced parsing
				if (length(values(parse_table)) >= 4 && seg ∉ values(parse_table))
					if length(seg) == 5
						if seg_comp(parse_table["1"], seg) == 0
							parse_table["3"] = seg
						elseif seg_comp(parse_table["4"], seg) == 1
							parse_table["5"] = seg
						else
							parse_table["2"] = seg
						end

					else
						if seg_comp(parse_table["4"], seg) == 1 
							if seg_comp(parse_table["1"],seg) == 0
								parse_table["0"] = seg
							else
								parse_table["6"] = seg
							end
						else
							parse_table["9"] = seg
						end
					end
				end

			end
		end

		rev_table = Dict(value => key for (key, value) in parse_table)
		temp = parse(Int, join([rev_table[x] for x in display[i, :]]))
		count += temp
	end
	return count
end

end
