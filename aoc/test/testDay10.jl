module testDay10

using ..aoc
using ..Test

const DAY10=
"""
[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]
"""

@testset "aoc.day10" begin
	@test aoc.day10.part1(IOBuffer(DAY10)) == 26397
	@test aoc.day10.part2(IOBuffer(DAY10)) == 288957
end


end
