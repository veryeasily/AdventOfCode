using Pipe

mutable struct Position
    depth::Int
    horizontal::Int
end

mutable struct PositionTwo
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

function process_command(position::Position, command::String)
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

function process_command(position::PositionTwo, command::String)
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
    pos = Position(0, 0)
    for command in cmds
        process_command(pos, command)
    end
    @show pos
    @show pos.depth * pos.horizontal
end

function day_02_b()
    cmds = read_input_02()
    pos = PositionTwo(0, 0, 0)
    for command in cmds
        process_command(pos, command)
    end
    @show pos
    @show pos.depth * pos.horizontal
end
