import Foundation
var X = Int(readLine()!)
var Y = Int(readLine()!)
var res = 0

var y_arr: [Int] = []
y_arr.append(Y!/100)
y_arr.append((Y!%100)/10)
y_arr.append((Y!%100)%10)
y_arr.reverse()

for i in 0...2{
    let mul = X!*y_arr[i]
    print(mul)
    res += mul*NSDecimalNumber(decimal: pow(10, i)).intValue
}
print(res)
