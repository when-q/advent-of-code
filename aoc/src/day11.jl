module day11
using ..Test
function parseIO(io::IO)
	input = readlines(io)
	m = [[parse(Int64, ss) for ss in split(y, "")] for y in input]
	return convert_vectors(m)
end

function convert_vectors(input::AbstractVector{T}) where T <: AbstractVector
	# reusing day9 function
    dim1 = length(input)
    dim2 = length(input[1])
    arr = Array{eltype(input[1]), 2}(undef, dim1, dim2)
    Threads.@threads for i in 1:dim1
        for j in 1:dim2
            arr[i,j] = input[i][j]
        end
    end
    return arr
end

function adjacent_flash(m, i, j)
	# it only calculates the adjacent
	# it does not add the value to the original m[i,j] 
	return sum(m[x, y] > 9 
			   for x = i-1:i+1 for y = j-1:j+1 
			   if in_range(x, size(m, 1)) 
			   && in_range(y, size(m,2)) 
			   && (x, y) != (i, j))
end

function in_range(value::Int, range::Int)::Bool
	if value <=range && value>=1
		return true
	end
	return false
end

function trim(value::Int)
	if value > 9
		value = 0
	end
	return value
end

function part1(io::IO, iterations::Int)
	input = parseIO(io)
    dim1 = size(input, 1)
    dim2 = size(input, 2)
	count = 0
	for iter in 1:iterations
		input .+= 1
		for i in 1:dim1
			for j in 1:dim2
				input[i, j] += adjacent_flash(input, i, j)
			end
		end

		input = broadcast(trim, input)
		count += sum(k == 0 for k in input)
		println(input)
	end
	return count
end

end