@time begin
input = parse.(Int, readlines("input.txt"))

current = 0;
larger = 0;
for i = 1:length(input)
	if i == 1
		global current = input[1]
	else
		if input[i] > current
			global larger += 1
		end
		global current = input[i]
	end
end

println(larger)
end
