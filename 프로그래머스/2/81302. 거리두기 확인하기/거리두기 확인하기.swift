import Foundation

func solution(_ places:[[String]]) -> [Int] {
    
    let N = places.count
    
    // 1. i번째 place를 BFS를 돌면서 1 또는 0을 리턴하는 함수
    func BFS(_ i: Int) -> Int {
        let dx = [0,0,-1,1]
        let dy = [-1,1,0,0]
        // ["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"]
        var place: [[String]] = places[i].map { Array($0).map { String($0) } }
        
        var queue: [[Int]] = []
        
        for i in 0..<N {
            for j in 0..<N {
                if place[i][j] == "P" {
                    
                    place[i][j] = "0"
                    queue.append([i, j])
                    
                    while !queue.isEmpty {
                        let cur = queue.removeFirst()
                        
                        for k in 0..<4 {
                            let x = cur[0] + dx[k]
                            let y = cur[1] + dy[k]
                            
                            if 0..<N ~= x && 0..<N ~= y && place[x][y] != "X" {
                                if place[x][y] == "O" { place[x][y] = "\(Int(place[cur[0]][cur[1]])! + 1)" }
                                else { return 0 }
                            }
                        }
                    }
                }
            }
        }
        
        return 1        
    }
    
    // 2. places를 loop를 돌면서 리턴 값 생성
    return (0..<5).map { BFS($0) }
}

// 각 응사자들이 거리두기를 잘 하고 있는 지
// 응지자 정보 & 대기실별 정보 -> places
// 거리두기 O -> 1
// 거리두기 X -> 0
// [1, 0, 1, 1, ...]

// X: 파티션
// P: 응시자
// O: 빈테이블

// BFS를 5번 돌아라는 문제
// O(25) * 5
// 1, 2까지 전파하고, 만약 1, 또는 2를 BFS로 전파를 하다가 만난다면, -> False