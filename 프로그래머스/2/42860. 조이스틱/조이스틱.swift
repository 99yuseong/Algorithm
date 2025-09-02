// A

// 좌우 - 커서 이동
// 위아래 - 알파벳 변경

// 최소 조작횟수

// 대문자로만, Name은 1~20

// 좌 -> 우
// 위 아래로 변경하면 되는거 아닌가?

// 아스키코드 값 차이

import Foundation

func solution(_ name:String) -> Int {
    
    let n = name.count
    let arr = Array(name)
    
    // 위 아래 이동
    var upDown = 0
    for char in arr {
        let diff = abs(Int(char.asciiValue!) - Int(Character("A").asciiValue!))
        upDown += min(diff, abs(26 - diff))
    }
    
    // 좌우 이동
    var leftRight = n - 1
    for i in 0..<n {
        
        var next = i + 1
        while next < n && arr[next] == "A" {
            next += 1
        }
        
        let left = i - 0
        let right = n - next
        
        leftRight = min(leftRight, left + right + min(left, right))
    }
    
    return upDown + leftRight
}