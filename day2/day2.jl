using DelimitedFiles

input = readdlm("input.txt")

coord = [0, 0]

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
println(coord[1]*coord[2])

