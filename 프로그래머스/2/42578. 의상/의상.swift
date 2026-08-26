import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var d: [String: Int] = [:]
    
    for cloth in clothes {
        d[cloth[1], default: 0] += 1
    }
    
    var answer = 1
    
    for v in d.values {
        answer *= v + 1
    }
    
    return answer - 1
}