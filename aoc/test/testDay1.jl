module testDay1
using ..aoc
using ..Test

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
@testset "aoc.day1" begin
	@test aoc.day1.part1(IOBuffer(DAY1)) == 7
	@test aoc.day1.part2(IOBuffer(DAY1)) == 5

end


end
