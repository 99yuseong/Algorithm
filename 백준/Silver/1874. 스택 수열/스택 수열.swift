func solution(n: Int, arr: [Int]) -> String {
    // 1~n까지의 수 stack 넣기
    // push 순서는 오름차순
    // 수열을 만들 수 있는가?
    // 모두 다른 정수
    // N: 1~10만 - O(N) / O(NlgN)
    
    var stack: [Int] = []
    var ans = ""
    var curIdx = 0
    
    for i in 1...n {
        while !stack.isEmpty && curIdx < n && arr[curIdx] == stack.last! {
            stack.removeLast()
            ans += "-\n"
            curIdx += 1
        }
        
        stack.append(i)
        ans += "+\n"
    }
    
    while !stack.isEmpty && curIdx < n && arr[curIdx] == stack.last! {
        stack.removeLast()
        ans += "-\n"
        curIdx += 1
    }
    
    return stack.isEmpty ? ans : "NO"
}

let N = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<N { arr.append(Int(readLine()!)!) }

print(solution(n: N, arr: arr))
