// 가장 큰 정사각형
// N * M 배열
// 0과 1

// 1로 된 가장 큰 정사각형의 크기

// [문제 제한]
// 1000 * 1000 크기의 맵
// 정사각형 -> 모서리로부터 동일한 지점에 떨어져있는 도형
// 1000 * 1000이 정사각형인지 알려면 1000 * 1000칸을 모두 순회해야한다.
// [i][i]칸이 우측하단 모서리인 정사각형인지 알려면 크기는?

// DP로 순회한 정보를 담는다.
// DP[i][j]: MAP[i][j]가 우측하단 모서리인 최대 정사각형의 모서리 길이

// DP[i][j] = min(DP[i-1][j-1], DP[i-1][j], DP[i][j-1])
// DP[i][j] = MAP[i][j]

func solution(_ map: [[Int]]) -> Int {
    
    let n = map.count
    let m = map.first!.count

    var DP = map
    var maxL = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 1 {
                maxL = 1
            }
        }
    }
    
    for i in 1..<n {
        for j in 1..<m {
            if map[i][j] == 1 {
                DP[i][j] = min(DP[i-1][j], DP[i][j-1], DP[i-1][j-1]) + 1
                maxL = max(DP[i][j], maxL)
            }
        }
    }
    
    return maxL * maxL
}

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0]
let M = NM[1]
var MAP: [[Int]] = []
for _ in 0..<N {
    let line = Array(readLine()!).map { Int(String($0))! }
    MAP.append(line)
}
print(solution(MAP))
