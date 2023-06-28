var L = readLine()!.uppercased()
var cnt = [Int](repeating: 0, count: 26)

for c in L{
    let asc = Int(UnicodeScalar(String(c))!.value)
    cnt[asc-65] += 1
}

var max_num = 0
var max_char: [Int] = []

for i in 0...25{
    if cnt[i] > max_num{
        max_num = cnt[i]
        max_char = []
        max_char.append(i)
    }
    else if cnt[i] == max_num{
        max_char.append(i)
    }
}

if max_char.count > 1{
    print("?")
}
else{
    print(UnicodeScalar(max_char[0]+65)!)
}
