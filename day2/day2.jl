using DelimitedFiles

input = readdlm("input.txt")

coord = [0, 0]
p = 0;

function part1(coord, move)
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
end

function part2(coord, aim)
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
end
part2(coord, p)
println(coord[1]*coord[2])

