module testDay5

using ..aoc
using ..Test

const DAY5=
"""
0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2
"""


@testset "aoc.day5" begin
	@test aoc.day5.part1(IOBuffer(DAY5)) == 5
	@test aoc.day5.part2(IOBuffer(DAY5)) == 12
end


end
