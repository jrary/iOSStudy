let N = Int(readLine()!)!
let score = readLine()!.split(separator: " ").map{Int(String($0))!}
let max_score = score.max()

var sum = 0
for s in score{
    sum += s
}

if let m = max_score{
    print(Double(sum)*(Double(100)/Double(N*m)))
}

