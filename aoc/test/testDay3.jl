module testDay3

using ..aoc
using ..Test

const DAY3 = 
"""
00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010
"""

@testset "aoc.day3" begin
	@test aoc.day3.part1(IOBuffer(DAY3)) == 198
	@test aoc.day3.part2(IOBuffer(DAY3)) == 230
end


end
