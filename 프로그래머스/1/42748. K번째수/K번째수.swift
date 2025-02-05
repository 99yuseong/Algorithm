import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var result: [Int] = []
    
    for cmd in commands { // 50번
        var arr = array[cmd[0]-1...cmd[1]-1].sorted() // (100) * 100lg100
        result.append(arr[cmd[2]-1])    
    }
    
    return result
}

// array: 1~100이하
// 원소 1~100이하
// commands: 1~50이하

// cmd[0] ~ cmd[1]까지 배열 슬라이싱
// sort
// k번째 요소 result에 주입