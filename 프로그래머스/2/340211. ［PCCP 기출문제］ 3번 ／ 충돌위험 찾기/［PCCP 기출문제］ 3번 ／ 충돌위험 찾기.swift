import Foundation

// 자동 운송

// 2차원 n개의 운송 포인트
// 1~n번

// x대 로봇 - m개의 운송경로를 순서대로 방문

// 0초 동시 출발, 1초마다 상하좌우로 이동
// 최단 경로로 이동, r좌표가 변하는 이동을 c좌표가 변하는 이동보다 먼저
// 도착 시 제거

// 같은 좌표에 2대 이상의 로봇 = 위험 상황

// 위험 상황은 총 몇번?

// n개의 2차원 좌표 : points
// let n = points.count
// 로봇 x의 경로: routes
// let x = routes.count

// [제한사항]

// n: 2~100개 포인트
// 전체 배열 -> 1~1만칸

// x: 2~100대 로봇
// routes: 2~100개의 경로

// 1. 최단 경로를 체크
    // 1. 순열로 [a, b]를 구하기 = O(nC2)
    // 2. [a, b]의 BFS로 최단 경로를 2차원 배열에 저장 = O(1만)
    
    // -> O(100C2 * 1만)
    
// 2. 매초마다 로봇을 이동. 현재 겹치는 위치 체크
    // 100대 로봇 이동
    // 100대 로봇 중 겹치는 경로 count++

    // O(T * (100 + 100))

// 최단 경로를 구하는 게 문제가 아님
// 퍼져나가는 경우를 알아야하는데.

// 경로를 알아야함. 그래야 시간 흐름에 따라서 겹침을 확인할 수 있지.

// n개의 point -> [a, b]의 최단 경로를 찾아.

// 최단 거리 = 유클리드거리 (세로 먼저, 가로는 이후)

// m개의 로봇을 매초 이동시키는 것.

// 매초 100개의 로봇을 move - O(100)
    // 세로먼저, 가로먼저로 연산 O(1)
// 겹침을 확인
    // Dict을 매초 만들고, cnt++
    // 2이상인 것 카운트

func solution(_ points:[[Int]], _ routes:[[Int]]) -> Int {
    
    let n = points.count
    let x = routes.count
    let m = routes.first!.count    
    var r = routes.map { (x: points[$0[0]-1][0], y: points[$0[0]-1][1], to: 0)  }
    
    var warningCount = 0
    var finished = Set<Int>()
    
    while finished.count < x { // 매초 반복
        
        var zone: [String: Int] = [:] // "r,c" : 1
        
        for i in 0..<x {
            if finished.contains(i) { continue }
            
            var to = points[routes[i][r[i].to]-1]
            
            if to[0] < r[i].x { r[i].x -= 1 }
            else if to[0] > r[i].x { r[i].x += 1 }
            else if to[1] > r[i].y { r[i].y += 1 }
            else if to[1] < r[i].y { r[i].y -= 1 }
            else {
                if r[i].to == m-1 { 
                    finished.insert(i) 
                    continue
                } else if r[i].to > 0 { 
                    r[i].to += 1
                    to = points[routes[i][r[i].to]-1]
                    if to[0] < r[i].x { r[i].x -= 1 }
                    else if to[0] > r[i].x { r[i].x += 1 }
                    else if to[1] > r[i].y { r[i].y += 1 }
                    else if to[1] < r[i].y { r[i].y -= 1 }
                } else {
                    r[i].to += 1
                }
            }
            
            zone["\(r[i].x),\(r[i].y)", default: 0] += 1
        }
        
        warningCount += zone.values.filter { $0 > 1 }.count
    }
    
    return warningCount
}