import Foundation

// 로봇 강아지가 산책
// 동쪽 5칸 이동
// 공원을 벗어나는지, 장애물을 만나는 지

// 최종위치를 리턴
// [x, y]

// park: 3~50
// S: 시작, 

// routes: 1~50

// 1. park 가공 > Char 2차원 배열로 : 2500칸
    // S 위치 추출
// 2. E, S, W, N으로 이동 routes 루프 처리
    // 조건 벽아님, 장애물 아님 시 1칸씩 While 이동처리
// 3. 최종 칸 리턴

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    
    let n = park.count
    let m = park[0].count
    
    var park = park.map { Array($0) }
    var start = (x: 0, y: 0)
    
    for i in 0..<n {
        for j in 0..<m {
            if park[i][j] == "S" {
                start = (i, j) 
                park[i][j] = "O"
            }
        }
    }
    
    for route in routes {
        let parts = route.split(separator: " ").map { String($0) }
        let op = parts[0]
        let mv_n = Int(parts[1])!
        
        var mv: (x: Int, y: Int) = (x: 0, y: 0)
        switch op {
        case "N": 
            mv = (x: -1, y: 0)
        case "S": 
            mv = (x: 1, y: 0)
        case "W": 
            mv = (x: 0, y: -1)
        case "E": 
            mv = (x: 0, y: 1)
        default: break
        }
        
        // 공원을 나가게 되는 경우 건너뜀
        if !(0..<n ~= start.x + (mv.x * mv_n) && 0..<m ~= start.y + (mv.y * mv_n)) { continue }
        
        var cnt = 0
        var cur = start
        
        while 0..<n ~= cur.x + mv.x 
        && 0..<m ~= cur.y + mv.y
        && park[cur.x + mv.x][cur.y + mv.y] == "O" {
            
            cnt += 1
            cur = (cur.x + mv.x, cur.y + mv.y)            
            
            if cnt == mv_n { // 장애물 없이 온 경우만 이동
                start = cur
                break 
            }
        }
    }
    
    return [start.x, start.y]
}
