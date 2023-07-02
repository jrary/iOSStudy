let arr: [Int]
var dict: [Int: Int] = [:]

for _ in 0...9{
    let input = Int(readLine()!)!
    let mod = input % 42
    
    if let count = dict[mod] {
            dict[mod] = count + 1
        } else {
            dict[mod] = 1
    }
}

print(dict.count)
