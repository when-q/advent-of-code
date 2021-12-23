module testDay11

using ..aoc
using ..Test

const DAY11=
"""
5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526
"""
const DAY11_TEST=
"""
11111
19991
19191
19991
11111
"""

@testset "aoc.day11" begin
	@test aoc.day11.part1(IOBuffer(DAY11),100) == 1656
	@test aoc.day11.part1(IOBuffer(DAY11_TEST),10) == 9
#	@test aoc.day11.part2(IOBuffer(DAY11)) == 288957
end


end
