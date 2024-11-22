// N * N 지도
// 높이가 적혀짐
// 지나갈 수 있는 길은 몇개인가 가로 / 세로
// 한쪽 끝에서 다른 쪽 끝까지 지나가는 것

// 높이가 모두 같거나 경사로

// 경사로는 낮은 칸에
// L개의 연속된 칸에 경사로 바닥이 모두 접할 것
// 높이 차는 1
// 낮은 칸 모두 동일
// L개의 칸 연속

// 경사로 못 두는 경우
// 중첩 경사로
// 높이차이가 1 이상
// 낮은 칸의 높이가 모두 같지 않거나, L개가 연속되지 않은 경우
// 범위 벗어나는 경우

let NL = readLine()!.split(separator: " ").map { Int($0)! }
let N = NL[0]
let L = NL[1]
var map: [[Int]] = []
for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var cnt = 0

// 가로
for i in 0..<N {
    // [value, start, end]
    var step: [[Int]] = [[map[i][0], 0, 0]]
    var maxVal = map[i][0]
    
    // Step 분리
    for j in 1..<N {
        maxVal = max(maxVal, map[i][j])
        if map[i][j] == step.last![0] { // 같은 높이
            step[step.count-1][2] = j
        } else { // 다른 높이
            step.append([map[i][j], j, j])
        }
    }
    
    // 높이가 모두 같은 경우 cnt + 1
    if step.count == 1 {
        cnt += 1
        continue
    }
    
    // 높이가 다른 경우
    var canSlide = true
    for i in 0..<step.count {
        if step[i][0] == maxVal { continue }
        
        let len = step[i][2] - step[i][1] + 1
        
        // 왼쪽 끝
        if i == 0 {
            let dR = step[i][0] - step[i+1][0]
            
            // 높이 차가 1이 아닌 경우
            if dR != 1 && dR != -1 {
                canSlide = false
                break
            }
            
            // 낮은 데, 짧은 경우
            if dR == -1 && len < L {
                canSlide = false
                break
            }

        } else if i == step.count-1 { // 오른쪽 끝
            
            let dL = step[i-1][0] - step[i][0]
            
            // 높이 차가 1이 아닌 경우
            if dL != 1 && dL != -1 {
                canSlide = false
                break
            }
            
            // 낮은 데, 짧은 경우
            if dL == 1 && len < L {
                canSlide = false
                break
            }
            
        } else {
            let dL = step[i-1][0] - step[i][0]
            let dR = step[i][0] - step[i+1][0]
            
            // 높이 차가 1이 아닌 경우
            if (dR != 1 && dR != -1) || (dL != 1 && dL != -1) {
                canSlide = false
                break
            }
            
            // 경사로 2개를 못 놓는 경우 둘다 낮음
            if dL == 1 && dR == -1 && len < 2 * L {
                canSlide = false
                break
            }
            
            // 내려가고 내려가고 -> 짧은 경우
            if dL == 1 && dR == 1 && len < L {
                canSlide = false
                break
            }
            
            // 올라가고 올라가고 -> 짧은 경우
            if dL == -1 && dR == -1 && len < L {
                canSlide = false
                break
            }
        }
    }
    
    if canSlide { cnt += 1 }
}

// 세로
for j in 0..<N {
    // [value, start, end]
    var step: [[Int]] = [[map[0][j], 0, 0]]
    var maxVal = map[0][j]
    
    // Step 분리
    for i in 1..<N {
        maxVal = max(maxVal, map[i][j])
        if map[i][j] == step.last![0] { // 같은 높이
            step[step.count-1][2] = i
        } else { // 다른 높이
            step.append([map[i][j], i, i])
        }
    }
    
    // 높이가 모두 같은 경우 cnt + 1
    if step.count == 1 {
        cnt += 1
        continue
    }
    
    // 높이가 다른 경우
    var canSlide = true
    for i in 0..<step.count {
        if step[i][0] == maxVal { continue }
        
        let len = step[i][2] - step[i][1] + 1
       
        // 왼쪽 끝
        if i == 0 {
            let dR = step[i][0] - step[i+1][0]
            
            // 높이 차가 1이 아닌 경우
            if dR != 1 && dR != -1 {
                canSlide = false
                break
            }
            
            // 낮은 데, 짧은 경우
            if dR == -1 && len < L {
                canSlide = false
                break
            }

        } else if i == step.count-1 { // 오른쪽 끝
            
            let dL = step[i-1][0] - step[i][0]
            
            // 높이 차가 1이 아닌 경우
            if dL != 1 && dL != -1 {
                canSlide = false
                break
            }
            
            // 낮은 데, 짧은 경우
            if dL == 1 && len < L {
                canSlide = false
                break
            }
            
        } else {
            let dL = step[i-1][0] - step[i][0]
            let dR = step[i][0] - step[i+1][0]
            
            // 높이 차가 1이 아닌 경우
            if (dR != 1 && dR != -1) || (dL != 1 && dL != -1) {
                canSlide = false
                break
            }
            
            // 경사로 2개를 못 놓는 경우 둘다 낮음
            if dL == 1 && dR == -1 && len < 2 * L {
                canSlide = false
                break
            }
            
            // 내려가고 내려가고 -> 짧은 경우
            if dL == 1 && dR == 1 && len < L {
                canSlide = false
                break
            }
            
            // 올라가고 올라가고 -> 짧은 경우
            if dL == -1 && dR == -1 && len < L {
                canSlide = false
                break
            }
        }
    }
    
    if canSlide {
        cnt += 1
    }
}

print(cnt)
