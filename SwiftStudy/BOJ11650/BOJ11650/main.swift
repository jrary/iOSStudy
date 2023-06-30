let N = Int(readLine()!)!
var arr: [[Int]] = []

for _ in 0...N-1{
    let input = readLine()!.split(separator: " ")
    arr.append([Int(input[0])!, Int(input[1])!])
}

arr.sort(by: {$0[1] < $1[1]})
arr.sort(by: {$0[0] < $1[0]})

for i in arr{
    print(i[0], i[1])
}
