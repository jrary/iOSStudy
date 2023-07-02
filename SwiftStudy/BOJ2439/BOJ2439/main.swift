let N = Int(readLine()!)!

for i in 0...N-1{
    for j in 0...N-1{
        if j < N-1-i{
            print(" ", terminator: "")
        }
        else{
            print("*", terminator: "")
        }
    }
    print()
}
