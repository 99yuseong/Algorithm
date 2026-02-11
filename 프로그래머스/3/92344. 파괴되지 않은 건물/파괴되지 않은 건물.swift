import Foundation

// N * M

// 공격 - 내구도 0 이하 파괴
// 회복 - 내구도 상승

// 직사각형 모양 공격 회복

// 회복 - 복구
// 공격을 받으면 계속해서 내구도가 하락한다

// 내구도가 주어질때, skiil 사용 후 파괴되지 않은 건물의 개수

// N: 1~1000
// M: 1~1000 > 100만칸
// 내구도 1~1000
// skill 1~25만

// type 1 - 공격 / 2 - 회복
// degree - 1~500크기

// 25만 * 100만 터짐

// 25만개 -> 누적합처리하고 board에 합쳐야하나.
// 범위로 주니까. 이것도 똑같은데.

// 어짜피 배열에 loop로 합하는 방식은 안됨


// 중요한건 파괴되었나 여부 > 몇이냐는 중요하지 않다.
// 파괴 여부를 확인하려면 정확히 그 자리의 값에 연산이 필요
// skill에 조건은 if r1...r2 ~= x && c1...c2 ~= y { if type == 1 { + degree else - degree } }

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    
    let N = board.count
    let M = board[0].count
    
    var prefixSum = [[Int]](repeating: [Int](repeating: 0, count: M+1), count: N+1)
    
    for s in skill { // 25만개
        
        let type = s[0]
        let r1 = s[1]
        let c1 = s[2]
        let r2 = s[3]
        let c2 = s[4]
        let degree = s[5] * (type == 1 ? (-1) : 1)
        
        prefixSum[r1][c1] += degree
        prefixSum[r2+1][c1] += degree * (-1)
        prefixSum[r1][c2+1] += degree * (-1)
        prefixSum[r2+1][c2+1] += degree
    }
    
    for i in 0..<N {
       for j in 0..<M {
            if i > 0 { prefixSum[i][j] += prefixSum[i-1][j] }
            if j > 0 { prefixSum[i][j] += prefixSum[i][j-1] }
            if i > 0 && j > 0 { prefixSum[i][j] -= prefixSum[i-1][j-1] }
       }
    }
    
    var count = 0
    for i in 0..<N {
        for j in 0..<M {
            count += board[i][j] + prefixSum[i][j] > 0 ? 1 : 0
        }
    }
    return count
}