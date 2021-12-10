module day4

using ..DelimitedFiles
using ..Test

function parseIO(io::IO)
	input, header = readdlm(io, Int,header = true)
	boards = [input[i:i+4, 1:5] for i in 1:5:size(input, 1)]
	bingo = [parse(Int64, ss) for ss in split(string(header[1]), ",")]
	return boards, bingo
end

function part1(io::IO)
	
	boards, bingo = parseIO(io)	

	called, unmarked  = unmarkSum(bingo, boards)
	return called * unmarked
end

function unmarkSum(bingo::Vector{Int64}, boards::Vector{Matrix{Int64}})

	for num in bingo, board in boards
		for i in 1:5, j in 1:5
			if board[i, j] == num
				board[i, j] = -1
			end
			if sum(board[i, :]) == -5 || sum(board[:, j]) == -5
				return num, sum(board) + sum(k == -1 for k in board)
			end
		end
	end
end

function unmarkSum2(bingo::Vector{Int64}, boards::Vector{Matrix{Int64}})
	check = fill(0, length(boards))
	println(length(boards))
	for num in bingo, board in boards
		for i in 1:5, j in 1:5
			if board[i, j] == num
				board[i, j] = -1
			end
			if sum(board[i, :]) == -5 || sum(board[:, j]) == -5 
				check[findfirst(y -> y==board, boards)] = 1
			end
			if sum(check) == length(check)
				return num, sum(board) + sum(k == -1 for k in board)
			end
		end
	end
end


function part2(io::IO)
	boards, bingo = parseIO(io)
	called, unmarked = unmarkSum2(bingo, boards)
	return called * unmarked
end

end
