module testDay6

using ..aoc
using ..Test

const DAY6=
"""
3,4,3,1,2
"""


@testset "aoc.day6" begin
	@test aoc.day6.part1(IOBuffer(DAY6)) == 5934
	@test aoc.day6.part2(IOBuffer(DAY6)) == 26984457539
end


end
