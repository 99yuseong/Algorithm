// 2초
// 512MB

// N개의 좌표
// Xi좌표 압축 -> Xi' = Xi보다 작은 다른 좌표 Xj의 개수

// N: 좌표 1~100만개
// Xi: -10억 ~ 10억

// 우선 배열 A에 값을 정렬
// func upperBound(_ target: Int) -> Int 
// target과 처음 같은 수의 인덱스(없다면) target보다 큰 첫 수의 인덱스
// 이분탐색을 이용

// 중복 제거: O(2N) -> 200백만
// 배열 정렬: O(NlgN) -> 600백만
// N개를 이분탐색: O(NlgN) -> 600백만

func upperBound(_ target: Int) -> Int {
    var min = 0
    var max = sortedA.count
    
    while min < max {
        let mid = (min + max) / 2

        if sortedA[mid] < target { min = mid + 1 }
        else { max = mid }
    }
    
    return min
}

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }

// 중복 제거 & 정렬 
var sortedA = Array(Set(A)).sorted()

// upperBound(이분탐색) 값을 합쳐서 출력
print(A.map { String(upperBound($0)) }.joined(separator: " "))