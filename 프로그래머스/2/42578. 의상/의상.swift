import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict: [String: Int] = [:]

    for cloth in clothes {
        dict[cloth[1], default: 0] += 1
    }
    
    var result = 1
    
    for value in dict.values {
        result *= value + 1
    }
    
    return result - 1
}


// 각 종류별 최대 1가지
// 최소 1가지 이상 의상
// 서로 다른 옷의 조합 수 리턴

// 이름, 종류
// N: 1~30
// 모든 원소는 문자열 - 소문자 or _

// (2 + 1) * (1 + 1) - 1
// (3 + 1) - 1

// 1. dictionary에 해당 원소를 종류를 key로 + 1로 카운트
// 2. values()에 1을 더한후 모두 곱한다.
// 3. 최종적으로 1을 뺀다. (모두 0인 케이스)












// 옷의 조합
// 종류별 최대 1가지 의상
// 의상 종류
// [a,b] [c] [d] [e]
// 같은 의상 x
// 문자열의 길이는 1~20 자연수

// Dictionary -> [String: Int] 갯수 카운트
// Dictionary.keys.reduce(1) { $0 * ($1 + 1) } - 1