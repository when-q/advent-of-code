module day2

using DelimitedFiles
using ..Test

function part1(io::IO)
	input = readdlm(io)
	coord = [0, 0]
	p = 0;
	for i = 1:size(input, 1)
		movement = input[i, 1]
		moves    = input[i, 2]
		if movement == "forward"
			coord[1] += moves
		elseif movement == "up"
			coord[2] -= moves
		else
			coord[2] += moves
		end
	end
	return coord[1]*coord[2]
end

function part2(io::IO)
	input = readdlm(io)
	coord = [0, 0]
	aim = 0
	for i = 1:size(input, 1)
		movement = input[i, 1]
		moves    = input[i, 2]
		if movement == "forward"
			coord[1] += moves
			coord[2] += aim * moves 
		elseif movement == "up"
			aim -= moves
		else
			aim += moves
		end
	end
	return coord[1]*coord[2]
end

end
