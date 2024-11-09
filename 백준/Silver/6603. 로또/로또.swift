var k: Int = 0
var arr: [Int] = []
var isUsed: [Bool] = []
var ans: [Int] = []

while true {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    
    guard input[0] != 0 else { break }
    
    k = input[0]
    arr = Array(input[1..<input.count])
    isUsed = Array(repeating: false, count: k)
    ans = Array(repeating: 0, count: k)
    
    sol(0)
    print("")
}

func sol(_ n: Int) { // n번째로 뽑은 수
    if n == 6 {
        print(ans.prefix(6).map { String(arr[$0]) }.joined(separator: " "))
        return
    }
    
    var start = 0
    if n != 0 { start = ans[n-1] + 1 }
    
    for i in start..<k {
        ans[n] = i
        sol(n+1)
    }
}
