using Pipe

function readinput()
    strs = open("input1.txt", "r") do f
        readlines(f)
    end
    lines = map(x -> parse(Int, x), filter(x -> x != "", strs))
    return lines
end

function day_01_a()
    lines = readinput()
    return @pipe (
        zip(lines[1:end-1], lines[2:end]) |>
            map(x -> x[1] < x[2], _) |>
            sum(_)
    )
end

function day_01_b()
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
