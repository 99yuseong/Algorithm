import Foundation

func solution(_ name: String) -> Int {
    let n = name.count
    let arr = Array(name)
    
    // 세로 이동: 각 문자마다 A에서 원하는 문자까지 위/아래 이동 횟수
    var verticalMoves = 0
    for char in arr {
        verticalMoves += changeAlphabetCnt(of: char)
    }
    
    // 좌우 이동: 기본값은 오른쪽으로만 가는 경우
    var horizontalMoves = n - 1
    
    // 각 인덱스에서 연속 'A' 구간을 건너뛰는 경우를 고려
    for i in 0..<n {
        var next = i + 1
        while next < n && arr[next] == "A" {
            next += 1
        }
        // i까지 오른쪽으로 이동한 후, (n - next)만큼 남은 부분으로 돌아가는 경우를 고려
        horizontalMoves = min(horizontalMoves, i + n - next + min(i, n - next))
    }
    
    return verticalMoves + horizontalMoves
}

func changeAlphabetCnt(of char: Character) -> Int {
    // 'A'에서 목표 문자까지의 이동횟수: 위로 가는 경우와 Z에서 거꾸로 오는 경우 중 최소값 선택
    return min(Int(char.asciiValue! - Character("A").asciiValue!),
               Int(Character("Z").asciiValue! - char.asciiValue! + 1))
}