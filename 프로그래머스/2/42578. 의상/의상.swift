import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var D: [String: Int] = [:]
    
    clothes.forEach { D[$0[1], default: 0] += 1 }
    
    return D.values.reduce(1) { $0 * ($1+1) } - 1
}

// 옷의 조합
// 종류별 최대 1가지 의상
// 의상 종류
// [a,b] [c] [d] [e]
// 같은 의상 x
// 문자열의 길이는 1~20 자연수

// Dictionary -> [String: Int] 갯수 카운트
// Dictionary.keys.reduce(1) { $0 * ($1 + 1) } - 1