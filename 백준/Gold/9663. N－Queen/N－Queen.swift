let N = Int(readLine()!)!
var isUsed1 = Array(repeating: false, count: 40)
var isUsed2 = Array(repeating: false, count: 40)
var isUsed3 = Array(repeating: false, count: 40)
var count = 0

func sol(_ cur: Int) {
    if cur == N {
        count += 1
        return
    }
    
    for i in 0..<N {
        if isUsed1[i] || isUsed2[i+cur] || isUsed3[cur-i + N-1] {
            continue
        }
        
        isUsed1[i] = true
        isUsed2[i+cur] = true
        isUsed3[cur-i + N-1] = true
        sol(cur+1)
        isUsed1[i] = false
        isUsed2[i+cur] = false
        isUsed3[cur-i + N-1] = false
    }
}

sol(0)
print(count)
