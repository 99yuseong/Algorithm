// 1~N번까지 번호
// 자기자리 착석, but 왼쪽 오른쪽에 앉을 수 있다.
// VIP 반드시 자기 좌석에만
// 사람들이 좌석에 앉는 가짓수

func solution(_ N: Int, _ M: Int, _ seats: [Int]) -> Int {
    // 최대 가짓수는 20억 이하
    
    // 2. DP로 풀기
    // D[i]: i명 간 교체할 수 있는 가짓수
    // D[i] = D[i-1] + D[i-2]
    // D[1] = 1
    // D[2] = 2
    // D[3] = 3
    if N == 1 { return 1 }
    if N == 2 && M == 0 { return 2 }
    if N == 2 && M == 1 { return 1 }
    
    var D = Array(repeating: 0, count: N+1)
    D[1] = 1
    D[2] = 2
    for i in 3...N { D[i] = D[i-1] + D[i-2] }
    var ans = 1
    var cur = 1
    for seat in seats {
        let cnt = seat - cur
        cur = seat+1
        if cnt > 0 { ans *= D[cnt] }
    }
    if cur < N { ans *= D[N+1-cur] } // VIP가 마지막 좌석이 아닌 경우
    return ans
}

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var seats: [Int] = []
for _ in 0..<M { seats.append(Int(readLine()!)!) }
print(solution(N,M,seats))
