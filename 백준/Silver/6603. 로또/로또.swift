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
        print(ans.prefix(6).map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 0..<k {
        if !isUsed[i] && (n == 0 || ans[n-1] < arr[i]) {
            isUsed[i] = true
            ans[n] = arr[i]
            sol(n+1)
            isUsed[i] = false
        }
    }
}
