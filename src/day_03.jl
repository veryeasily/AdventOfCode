using Pipe
using StatsBase

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

function get_gamma()
    inputs = read_input_03()
    gamma = BitVector()
    for i in 1:12
        result = @pipe (
            map(vec -> vec[i], inputs) |>
                StatsBase.mode(_)
        )
        push!(gamma, result)
    end
    return gamma
end

function get_epsilon()
    gamma = get_gamma()
    result = map(g -> g == 1 ? 0 : 1,  gamma)
    convert(BitVector, result)
end

# From https://discourse.julialang.org/t/parse-an-array-of-bits-bitarray-to-an-integer/42361
function bitarr_to_int(arr)
    return sum(arr .* (2 .^ collect(length(arr)-1:-1:0)))
end

function filter_list(list::Vector{BitVector}, oxygen::Bool=true, num::Int=1)
    ones = sum([x[num] for x in list])
    if ones >= length(list) / 2
        target = oxygen ? 1 : 0
        return [x for x in list if x[num] == target]
    else
        target = oxygen ? 0 : 1
        return [x for x in list if x[num] == target]
    end
end

function get_filtered(list::Vector{BitVector}, oxygen::Bool=true, num::Int=1)
    new_list = filter_list(list, oxygen, num)
    if length(new_list) == 1
        return list[1]
    else
        return get_filtered(new_list, oxygen, num+1)
    end
end

function day_03_a()
    gamma = get_gamma()
    epsilon = get_epsilon()
    @show gamma
    @show epsilon
    @show bitarr_to_int(gamma) * bitarr_to_int(epsilon)
end

function day_03_b()
    oxygen = get_filtered(read_input_03(), true)
    co_2 = get_filtered(read_input_03(), false)
    @show bitarr_to_int(oxygen) * bitarr_to_int(co_2)
end
