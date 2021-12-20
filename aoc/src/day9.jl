module day9

using ..Test
function parseIO(io::IO)
	input = readlines(io)
	m = [[parse(Int64, ss) for ss in split(y, "")] for y in input]
	return convert_vectors(m)
end

function convert_vectors(input::AbstractVector{T}) where T <: AbstractVector
	# Thanks to this stackoverflow thread:
	# https://stackoverflow.com/questions/63892334/using-broadcasting-julia-for-converting-vector-of-vectors-to-matrices 
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

function get_low_points(input)

	low_points = Dict{Tuple{Int, Int}, Int}()
	
	for i in 1:size(input, 1)
		for j in 1:size(input, 2)
			isLow = true
			if i == 1 
				if input[i, j] < input[i+1, j]
					isLow = isLow && true
				else
					isLow = isLow && false
				end
			elseif i == size(input, 1)
				if input[i, j] < input[i-1, j]
					isLow = isLow && true
				else
					isLow = isLow && false
				end
			else
				if input[i, j] < input[i+1, j]
					isLow = isLow && true
				else
					isLow = isLow && false
				end

				if input[i, j] < input[i-1, j]
					isLow = isLow && true
				else
					isLow = isLow && false
				end
			end

			if j == 1 
				if input[i, j] < input[i, j+1]
					isLow = isLow && true
				else
					isLow = isLow && false
				end
			elseif j == size(input, 2)
				if input[i, j] < input[i, j-1]
					isLow = isLow && true
				else
					isLow = isLow && false
				end
			else
				if input[i, j] < input[i, j+1]
					isLow = isLow && true
				else
					isLow = isLow && false
				end

				if input[i, j] < input[i, j-1]
					isLow = isLow && true
				else
					isLow = isLow && false
				end
			end

			if isLow == true
				low_points[(i, j)] = input[i, j]
			end

		end
	end
	return low_points
end

function expand_basin(input)
	# Note: this can be reduced but im too lazy to reduce it
	# details: flood fill algorithm
	dim1 = size(input, 1)
	dim2 = size(input, 2)
	low_points = get_low_points(input)
	b = Vector{Int}()

	result = Vector{Int}()
	for (y, x) in keys(low_points)
		basin = Vector{Tuple{Int, Int}}()
		visited = Vector{Tuple{Int, Int}}()
		push!(basin, (y, x))
		basin_size = 0
		while length(basin) != 0

			(b, a) = pop!(basin)
			basin_size += 1
			if b == 1
				if (input[b, a] < input[b+1, a] 
					&& input[b+1, a] != 9
					&& (b+1, a) ∉ visited)

					push!(basin, (b+1, a))
					push!(visited,(b+1, a))
				end
			elseif b == dim1
				if (input[b, a] < input[b-1, a] 
					&& input[b-1, a] != 9
					&& (b-1, a) ∉ visited)

					push!(basin, (b-1, a))
					push!(visited, (b-1, a))
				end
			else
				if (input[b, a] < input[b+1, a] 
					&& input[b+1, a] != 9
					&& (b+1, a) ∉ visited)
					push!(basin, (b+1, a))
					push!(visited,(b+1, a))
				end
				if (input[b, a] < input[b-1, a] 
					&& input[b-1, a] != 9
					&& (b-1, a) ∉ visited)

					push!(basin, (b-1, a))
					push!(visited, (b-1, a))
				end
			end

			if a == 1
				if (input[b, a] < input[b, a+1] 
					&& input[b, a+1] != 9
					&& (b, a+1) ∉ visited)

					push!(basin, (b, a+1))
					push!(visited, (b, a+1))
				end
			elseif a == dim2
				if (input[b, a] < input[b, a-1] 
					&& input[b, a-1] != 9
					&& (b, a-1) ∉ visited)

					push!(basin, (b, a-1))
					push!(visited, (b, a-1))
				end
			else
				if (input[b, a] < input[b, a+1] 
					&& input[b, a+1] != 9
					&& (b, a+1) ∉ visited)

					push!(basin, (b, a+1))
					push!(visited, (b, a+1))
				end
				if (input[b, a] < input[b, a-1] 
					&& input[b, a-1] != 9
					&& (b, a-1) ∉ visited)

					push!(basin, (b, a-1))
					push!(visited, (b, a-1))
				end
			end
		end
		push!(result, basin_size)

	end
	return sort(result, rev=true)
end

function part1(io::IO)
	input = parseIO(io)
	low_points = get_low_points(input)
	return sum(values(low_points)) + length(values(low_points))
end

function part2(io::IO)
	input = parseIO(io)
	result = expand_basin(input)
	return result[1] * result[2] * result[3]	
end

end
