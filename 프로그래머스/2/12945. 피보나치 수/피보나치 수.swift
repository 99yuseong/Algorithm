func solution(_ n:Int) -> Int {
    
    let mod = 1234567
    
    var fibo = [Int](repeating: 0, count: 100001)
    fibo[1] = 1
    
    for i in 2..<fibo.count {
        fibo[i] = (fibo[i-1] + fibo[i-2]) % mod
    }
    
    return fibo[n]
}