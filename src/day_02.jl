using Pipe

mutable struct PositionA
    depth::Int
    horizontal::Int
end

mutable struct PositionB
    aim::Int
    depth::Int
    horizontal::Int
end

function read_input_02()
    strs = open("input2.txt", "r") do f
        readlines(f)
    end
    return strs
end

function process_command(position::PositionA, command::String)
    (first, second) = split(command, " ")
    num = parse(Int, second)
    if first == "forward"
        position.horizontal += num
    elseif first == "down"
        position.depth += num
    elseif first == "up"
        position.depth -= num
    end
end

function process_command(position::PositionB, command::String)
    (first, second) = split(command, " ")
    num = parse(Int, second)
    if first == "forward"
        position.horizontal += num
        position.depth += position.aim * num
    elseif first == "down"
        position.aim += num
    elseif first == "up"
        position.aim -= num
    end
end

function day_02_a()
    cmds = read_input_02()
    pos = PositionA(0, 0)
    for command in cmds
        process_command(pos, command)
    end
    @show pos
    @show pos.depth * pos.horizontal
end

function day_02_b()
    cmds = read_input_02()
    pos = PositionB(0, 0, 0)
    for command in cmds
        process_command(pos, command)
    end
    @show pos
    @show pos.depth * pos.horizontal
end
