using Pipe

function from_string(str::String)
    chars = split(str, "")
    return BitArray(parse(Bool, chars[i]) for i in 1:12)
end

function read_input_03()
    strs = open("input3.txt", "r") do f
        readlines(f)
    end
    map(str -> from_string(str), strs)
end

function day_03_a()
    nums = read_input_03()
    @show nums
    println("Day 3, part 1")
end

function day_03_b()
    println("Day 3, part 2")
end
