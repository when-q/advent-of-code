module testDay7

using ..aoc
using ..Test

const DAY7=
"""
16,1,2,0,4,2,7,1,2,14
"""

@testset "aoc.day7" begin
	@test aoc.day7.part1(IOBuffer(DAY7)) == 37
	@test aoc.day7.part2(IOBuffer(DAY7)) == 168
end


end
