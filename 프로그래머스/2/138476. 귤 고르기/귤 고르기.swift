import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    
    var dict: [Int: Int] = [:]
    
    for t in tangerine {
        dict[t, default: 0] += 1
    }
    
    var kv: [(key: Int, cnt: Int)] = []
    
    for (key, cnt) in dict {
        kv.append((key, cnt))
    }
    
    kv.sort { $0.cnt < $1.cnt }
    
    var k = k
    var answer = 0
    
    while k > 0 {
        let (key, cnt) = kv.removeLast()
        answer += 1
        k -= cnt
    }
    
    return answer
}