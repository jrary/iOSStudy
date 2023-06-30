var I = readLine()!.split(separator: " ")
let N = Int(I[0])!
let M = Int(I[1])!

var pack = [Int](1...N)
var sw: [[Int]] = []
for _ in 0...M-1 {
    var arr = readLine()!.split(separator: " ")
    sw.append([Int(arr[0])!, Int(arr[1])!])
}

for c in sw{
    let temp = pack[c[0]-1]
    pack[c[0]-1] = pack[c[1]-1]
    pack[c[1]-1] = temp
}

for i in pack{
    print(i, terminator: " ")
}
