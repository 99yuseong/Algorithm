// 2초
// 256MB

// 숫자카드 N장
// 정수 M개가 주어졌을때
// 이 숫자가 상근이 것인가?

// N: 1~50만장
// 숫자는 -1000만 < x < 1000만
// 같은 수는 없다!

// M: 1~50만장
// 숫자는 -1000만 < x < 1000만

// 가지고 있다면 1, 없다면 0

// O(N)이나 O(NlgN)으로 풀어야한다.
// 상근이 덱에서 이분탐색 O(lgN) * M번
// O(MlgN)으로 풀이 가능

// 상근이 덱 정렬 + 이분 탐색 함수 구현

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int($0)! }
let M = Int(readLine()!)!
let B = readLine()!.split(separator: " ").map { Int($0)! }

A.sort() // O(NlgN)
print(
    B.map { String(binarySearch($0)) } // O(MlgN) + O(M)
     .joined(separator: " ")
)


func binarySearch(_ x: Int) -> Int { // 있으면 1, 없으면 0을 리턴
    var min = 0
    var max = A.count-1
    
    while min <= max {
        let mid = (min + max) / 2
        
        if A[mid] == x { return 1 }
        
        if A[mid] < x { min = mid + 1 }
        else { max = mid - 1 }
    }
    
    return 0
}


