import Foundation

func solution(_ line:[[Int]]) -> [String] {
    
    var points: [(Int, Int)] = []
    
    for line1 in line {
        for line2 in line {
            if line1 == line2 { continue }
            
            if let (x, y) = point(line1, line2) {
                points.append((x, y))
            }
        }
    }
    
    let minX = points.map { $0.0 }.min()!
    let minY = points.map { $0.1 }.min()!
    let maxX = points.map { $0.0 }.max()!
    let maxY = points.map { $0.1 }.max()!
    
    var ans = [[String]](repeating: [String](repeating: ".", count: maxX - minX + 1), count: maxY - minY + 1)
    
    for (x, y) in points {
        ans[y-minY][x-minX] = "*"
    }
    
    return ans.map { $0.joined(separator: "") }.reversed()
}


// 교점 중 정수 좌표에 별


// n: 2~1000
// [A, B, C] 형태
// 무조건 1개 이상 그려진다.

// 직선은 반드시 1개의 교차점에서만 만난다. (평행하지 않다면)

// A = line[i][0], B = line[i][1], E = line[i][2]
// C = line[i][0], D = line[i][1], F = line[i][2]

// x = ()
func point(_ line1: [Int], _ line2: [Int]) -> (Int, Int)? {
    
    let A = line1[0]
    let B = line1[1]
    let E = line1[2]
    let C = line2[0]
    let D = line2[1]
    let F = line2[2]
    
    if A*D == B*C { return nil } // 평행
    
    if (B*F - E*D) % (A*D - B*C) != 0 || (E*C - A*F) % (A*D - B*C) != 0 { return nil } // 정수 점만 리턴
    
    return ((B*F - E*D) / (A*D - B*C), (E*C - A*F) / (A*D - B*C))
}
