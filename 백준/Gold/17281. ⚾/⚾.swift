import Foundation

func solution(_ N: Int, _ iningRecords: [[Int]]) -> Int {
    var result = 0
    var players = Array(repeating: 0, count: 9)
    var isUsed = Array(repeating: false, count: 9)

    func backtracking(_ k: Int) {
        if k == 9 {
            result = max(result, playGame())
            return
        }
        
        if k == 3 { // 4번 타자는 1번 선수 고정
            players[k] = 0
            backtracking(k + 1)
            return
        }
        
        for i in 1..<9 {
            if !isUsed[i] {
                isUsed[i] = true
                players[k] = i
                backtracking(k + 1)
                isUsed[i] = false
            }
        }
    }
    
    func playGame() -> Int {
        var score = 0
        var curIdx = 0 // 현재 타순 유지
        
        for ining in 0..<N {
            var bases = [false, false, false, false] // 0: 홈, 1루, 2루, 3루
            var outCount = 0

            while outCount < 3 {
                bases[0] = true // 타자가 타석에 섬
                let playerNum = players[curIdx]
                let move = iningRecords[ining][playerNum] // 선수의 타격 결과
                
                curIdx = (curIdx + 1) % 9 // 타순 이동

                if move == 0 { 
                    outCount += 1
                    continue
                }

                // 기존 주자 이동 처리
                for i in stride(from: 3, through: 0, by: -1) {
                    if bases[i] {
                        if i + move >= 4 {
                            score += 1
                        } else {
                            bases[i + move] = true
                        }
                        bases[i] = false
                    }
                }
            }
        }
        return score
    }

    backtracking(0)
    return result
}

// 입력 처리
let N = Int(readLine()!)!
var iningRecords: [[Int]] = []
for _ in 0..<N {
    iningRecords.append(readLine()!.split(separator: " ").map { Int($0)! })
}
print(solution(N, iningRecords))