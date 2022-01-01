module testDay12

using ..aoc
using ..Test

const DAY12=
"""
start-A
start-b
A-c
A-b
b-d
A-end
b-end
"""

const DAY12_1=
"""
fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW
"""

const DAY12_2 =
"""
dc-end
HN-start
start-kj
dc-start
dc-HN
LN-dc
HN-end
kj-sa
kj-HN
kj-dc
"""

@testset "aoc.day12" begin
	@test aoc.day12.part1(IOBuffer(DAY12_1)) == 226
	@test aoc.day12.part2(IOBuffer(DAY12_2)) == 103
	@test aoc.day12.part2(IOBuffer(DAY12)) == 36
	@test aoc.day12.part2(IOBuffer(DAY12_1)) == 3509
end

end
