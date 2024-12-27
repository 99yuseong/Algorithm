// 1초
// 512MB

// 음이 아닌 정수,
// 321 감소하는 수
// 950
// 수가 같으면 안된다.

// N번째 감소하는 수
// 0, 1, 2,
// 감소하는 수가 없다면 -1

// N 0~100만
import Foundation

let N = Int(readLine()!)!
var A: [String] = []
var Ans: [String] = []

func dfs(_ k: Int, _ a: [String]) {
    if k == 10 {
        Ans.append(a.sorted { $0 > $1 }.joined())
        return
    }
    
    dfs(k+1, a)
    var b = a
    b.append(String(k))
    dfs(k+1, b)
}
dfs(0, [])
Ans.sort { $0.count == $1.count ? $0 > $1 : $0.count > $1.count }

if N < 1023 {
    print(Ans.reversed()[N+1])
} else {
    print(-1)
}
