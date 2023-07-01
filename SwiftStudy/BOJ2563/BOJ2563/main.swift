import Foundation
let N = Int(readLine()!)!

var paper: [[Int]] = Array(repeating: [Int](repeating: 0, count: 100), count: 100)
for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let x = line[0]
    let y = line[1]
    for i in x..<x+10{
        for j in y..<y+10{
            paper[i][j] = 1
        }
    }
}
var res = 0
for row in paper where row.contains(1){
    for i in 0..<row.count{
        if row[i] == 1{
            res += 1
        }
    }
}
print(res)
