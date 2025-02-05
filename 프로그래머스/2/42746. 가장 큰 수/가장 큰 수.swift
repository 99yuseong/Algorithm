import Foundation

func solution(_ numbers:[Int]) -> String {
    var nums = numbers.map { String($0) }.sorted { $0 + $1 > $1 + $0 }
    
    if nums[0] == "0" { return "0" }
    else { return nums.joined() }
}

// 0 또는 양의 정수
// 이어붙여 만드는 가장 큰수

// numbers: 1~10만개
// 원소: 0~1000
// 문자열로