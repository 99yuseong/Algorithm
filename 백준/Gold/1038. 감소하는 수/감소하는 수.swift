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

// 여기서 나올 수 있는 최소 감소하는 수는 0이다.
// 여기서 나올 수 있는 최대 감소하는 수는 9876543210이다.
// 구성된 숫자는 반드시 달라야하며,
// 구성된 숫자가 동일하면 반드시 1개의 값을 가진다.
// [0,1,2,3,4,5,6,7,8,9] 배열의 부분집합이 곧 감소하는 수의 개수가 된다.

// 그래서 총 감소하는 수의 개수는 2^10 - 1 = 1023개
// 1022를 초과하는 Input은 -1을 출력한다.

// Input: 0, Output: 0
// Input: 1022, Output: 9876543210
// Input: 1023, Output: -1

// 코드 전략

// O(2^n) -> O(1024)
// 1. 재귀를 이용한 DFS로 부분집합을 구한다.

// 최대 O(10 + 10) = O(20)
// 2. 부분집합의 값을 이용해 String으로 변환한다. (왜냐하면 최대 값은 98억이다.)
    // 감소하는 수로 변환
    // sorted { $0 > $1 }.joined()를 이용

// Ans 배열에 String 감소하는 수를 담고, sort한다.
    // 이때 자리 수를 기준으로 증가하도록 문자열을 정렬한다.
    // Ans.sort { $0.count == $1.count ? $0 < $1 : $0.count < $1.count }

let N = Int(readLine()!)!
var A: [String] = []
var Ans: [String] = []

func dfs(_ k: Int, _ a: [String]) {
    if k == 10 {
        if !a.isEmpty { Ans.append(a.sorted { $0 > $1 }.joined()) }
        return
    }
    
    dfs(k+1, a)
    dfs(k+1, a + [String(k)])
}
dfs(0, [])

Ans.sort { $0.count == $1.count ? $0 < $1 : $0.count < $1.count }
// Ans: ["0", "1", "2", ... "9876543210"] 1023개의 원소가 담긴다.

if N < 1023 {
    print(Ans[N]) // Ans[1022] = 9876543210
} else {
    print(-1) // 1023번째 감소하는 수는 존재하지 않는다.
}

// TestCase
// Input: 0, Output: 0
// Input: 10, Output: 10
// Input: 11, Output: 20
// Input: 1022, Output: 9876543210
// Input: 1023, Output: -1
// Input: 1000000, Output: -1

