module AdventOfCode

using Pipe

function readinput()
    strs = open("input.txt", "r") do f
        readlines(f)
    end
    lines = map(x -> parse(Int, x), filter(x -> x != "", strs))
    return lines
end

function main()
    lines = readinput()
    return @pipe (
        zip(lines[1:end-1], lines[2:end]) |>
            map(x -> x[1] < x[2], _) |>
            sum(_)
    )
end

end # module
