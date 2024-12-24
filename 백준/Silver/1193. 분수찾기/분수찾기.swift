let N = Int(readLine()!)!

var num = 1
var cnt = 1

out: while true {
    for i in 1...num {
        if cnt == N {
            if num % 2 == 0 {
                print("\(i)/\(num-i+1)")
            } else {
                print("\(num-i+1)/\(i)")
            }
            break out
        }
        cnt += 1
    }
    num += 1
}
