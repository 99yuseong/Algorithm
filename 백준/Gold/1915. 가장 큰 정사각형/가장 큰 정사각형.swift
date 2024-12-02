// 1초
// 128MB

// 0과 1로된 배열
// n * m 중 1로된 가장 큰 정사각형의 크기

// n,m 1~1000 -> O(N^3)

// 1로 된 정사각형의 넓이
// 정사각형 -> []

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var A = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)
var D = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)

for i in 1...N {
    let line = [0] + Array(readLine()!).map { Int(String($0))! }
    for j in 1...M {
        A[i][j] = line[j]
    }
}

// 가장 큰 정사각형
// 두 변의 길이가 같다.
// BFS?

// D[i][j], i, j를 꼭짓점으로 하는 정사각형의 크기
// D[i][j] = max(D[i-1][j], D[i][j-1], D[i][j]) + 1

var ans = 0
for i in 1...N {
    for j in 1...M {
        if A[i][j] == 1 {
            let area = min(D[i-1][j-1], D[i-1][j], D[i][j-1]) + 1
            D[i][j] = area
            ans = max(area, ans)
        } else {
            D[i][j] = 0
        }
    }
}
print(ans*ans)
