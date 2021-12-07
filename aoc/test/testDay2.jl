module testDay2

using ..aoc
using ..Test

const DAY2 =
"""
forward 5
down 5
forward 8
up 3
down 8
forward 2
"""


@testset "aoc.day2" begin
	@test aoc.day2.part1(IOBuffer(DAY2)) == 150
	@test aoc.day2.part2(IOBuffer(DAY2)) == 900
end 


end
