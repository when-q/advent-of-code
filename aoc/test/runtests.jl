using InlineTest
using aoc

const DAY1 = 
"""
	199
	200
	208
	210
	200
	207
	240
	269
	260
	263
"""
const DAY2 =
"""
forward 5
down 5
forward 8
up 3
down 8
forward 2
"""

@testset "day1" begin
	@test day1.part1(IOBuffer(DAY1)) == 7
	@test day1.part2(IOBuffer(DAY1)) == 5
end 

@testset "day2" begin
	@test day2.part1(IOBuffer(DAY2)) == 150
	@test day2.part2(IOBuffer(DAY2)) == 900
end 
