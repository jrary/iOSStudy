var N = Int(readLine()!)!

for _ in 1 ... N{
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    print(input[0]+input[1])
}
