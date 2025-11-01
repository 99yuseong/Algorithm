import Foundation

// 목표 도달 = 최소 얼마의 거리?

// m: 가로
// n: 세로
// balls: 목표 좌표

// 적어도 1번 원쿠션으로 목표를 맞춘다.
// 굴러간 거리의 최솟값의 제곱을 배열로 리턴

// [제한사항]

// 가로,세로: 3~1000
// balls.count: 2~1000

// 목표는 공에 맞으면 바로 멈춘다.

// 1. balls를 돌면서 상하 / 좌우로 확장한다.
// 상하좌우로 넓히기
    // 상 = x * -1
    // 하 = x + n
    // 좌 = y * -1
    // 우 = y + m
// 상,하
    // 만약 y값과 목표y값이 같다면
    // x값이 목표x보다 작다면 -> 상
    // x값이 목표x보다 크다면 -> 하
// 좌,우
    // 만약 x값과 목표x값이 같다면
    // y값이 목표y보다 작다면 -> 좌
    // y값이 목표y보다 크다면 -> 우
// 2. x좌표 차 제곱 + y차 제곱의 최솟값을 구해 배열에 담아 리턴한다.
import Foundation

func solution(_ m: Int, _ n: Int, _ startX: Int, _ startY: Int, _ balls: [[Int]]) -> [Int] {
    func dist(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
        let dx = x1 - x2
        let dy = y1 - y2
        return dx * dx + dy * dy
    }
    
    var result: [Int] = []
    
    for ball in balls {
        let tx = ball[0]
        let ty = ball[1]
        var minDist = Int.max
        
        // 좌
        if !(startY == ty && startX > tx) {
            let nx = -tx
            let ny = ty
            minDist = min(minDist, dist(startX, startY, nx, ny))
        }
        
        // 우
        if !(startY == ty && startX < tx) {
            let nx = 2 * m - tx
            let ny = ty
            minDist = min(minDist, dist(startX, startY, nx, ny))
        }
        
        // 하
        if !(startX == tx && startY > ty) {
            let nx = tx
            let ny = -ty
            minDist = min(minDist, dist(startX, startY, nx, ny))
        }
        
        // 상
        if !(startX == tx && startY < ty) {
            let nx = tx
            let ny = 2 * n - ty
            minDist = min(minDist, dist(startX, startY, nx, ny))
        }
        
        result.append(minDist)
    }
    
    return result
}