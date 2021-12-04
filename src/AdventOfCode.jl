module AdventOfCode

using Pipe

function readinput()
    strs = open("input.txt", "r") do f
        readlines(f)
    end
    lines = map(x -> parse(Int, x), filter(x -> x != "", strs))
    return lines
end

function day_01_1()
    lines = readinput()
    return @pipe (
        zip(lines[1:end-1], lines[2:end]) |>
            map(x -> x[1] < x[2], _) |>
            sum(_)
    )
end

function day_01_2()
    lines = readinput()
    sums = @pipe (
        zip(lines[1:end-2], lines[2:end-1], lines[3:end]) |>
            map(x -> sum(x), _)
    )
    return @pipe (
        zip(sums[1:end-1], sums[2:end]) |>
            map(x -> x[1] < x[2], _) |>
            sum(_)
    )
end

end # module
