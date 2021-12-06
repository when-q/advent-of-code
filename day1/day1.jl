@time begin
input = parse.(Int, readlines("input.txt"))

# not so smart way of doing part 1
function part1()
	current = 0
	larger = 0
	for i = 1:length(input)
		if i == 1
			current = input[1]
		else
			if input[i] > current
				larger += 1
			end
			current = input[i]
		end
	end
	return larger
end

# smarter way of doing part 1
function part1_smart(input)

	solution = sum(next > prev for (prev, next) in zip(input, input[2:end]))
	return solution
end 

# smarter way of doing part 2
function part2(input)

	solution = sum(next > prev for (prev, next) in zip(input, input[4:end]))
	return solution
end


println(part2(input))
end
