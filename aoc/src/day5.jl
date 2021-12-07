module day5

using ..Test
using LinearAlgebra
struct Lines
	x::Int64
	y::Int64
	z::Int64
	w::Int64
	Lines(x,y,z,w) = new(x, y, z, w)
end

function parseIO(io::IO)

	temp = [[replace(y, "->" => "", "," =>"")] for y in readlines(io)]
	input = [[parse(Int, ss) for ss in split(y)] for y in temp]

	return input
end

# sus
function isVents()
	
end

function part1(io::IO)
	input = parseIO(io)
end

end
