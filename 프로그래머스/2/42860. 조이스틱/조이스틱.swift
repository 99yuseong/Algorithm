import Foundation

func solution(_ name:String) -> Int {
    
    let n = name.count
    var upDown = 0
    for char in name {
        upDown += changeAlphabetCnt(of: char) 
    }

    var leftRight = n-1
    var arr = Array(name)
    for i in 0..<n {
        // 현재점부터 "A"가 아닌 문자가 오는 지점 next를 찾기
        // 0~i랑 n-next랑 더한다음, 그중 더 작은것을 더해야함
        var next = i+1
        while next < n && arr[next] == "A" {
            next += 1
        }
        
        // 최종적으로 계속 최솟값을 업데이트
        leftRight = min(leftRight, (i - 0) + (n - next) + min(i, n - next))
    }
    
    return upDown + leftRight
}

// 조이스틱으로 알파벳이름
// A

// AAAA -> NAME 이런식으로 바꿔라

// 위: 다음
// 아래: 이전 알파벳
// 왼: 커서 왼쪽으로
// 오: 커서 오른쪽으로

// JAZ
// 9번조작
// 위 아래 중 가까운 수만큼 아스키밸류 -> 차만큼 이동

// A가 나오냐 안나오냐의 싸움?
// name의 길이는 1~20

// 1. 우선 A와 가깝나, Z와 가깝나.
func changeAlphabetCnt(of char: Character) -> Int {
    if char <= "N" {
        return Int(char.asciiValue! - Character("A").asciiValue!)
    } else {
        return Int(Character("Z").asciiValue! - char.asciiValue! + 1)
    }
}