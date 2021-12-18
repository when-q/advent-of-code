module testDay9

using ..aoc
using ..Test

const DAY9=
"""
2199943210
3987894921
9856789892
8767896789
9899965678
"""

@testset "aoc.day9" begin
	@test aoc.day9.part1(IOBuffer(DAY9)) == 15
#	@test aoc.day9.part2(IOBuffer(DAY9)) == 61229
end


end
