import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    var numbers = numbers
    var resultSet = Set<Int>()
    
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            resultSet.insert(numbers[i] + numbers[j])
        }
    }
    
    return Array(resultSet).sorted()
}

// 정수 배열 numbers
// 서로 다른 인덱스 2개를 뽑아 더해 만들 수 있는 모든 수
// 배열에 오름차순으로 담기

// 백트래킹이다. 조합 - 더하는 수니까

// n: 2~100
// 결과 값은 0 ~ 200 사이 값 - 정렬용
