// 1초
// 128MB

// N개의 정수
// X라는 정수가 존재하는 가?

// N: 1~10만개의 정수
// M: 1~10만개의 X

// 모든 입력은 Int 범위 내에 존재

// 일단 배열에 등록 N개
// M번을 탐색

// 순차 탐색 N개 원소 탐색을 M번 -> O(NM) -> 100억
// 이분 탐색 N개 원소 탐색을 M번 -> O(NlogN) + O(MlogN) -> 최대 50만

// 1. N개의 수를 정렬
// 2. 이분 탐색으로 Bool 값 리턴 함수
//     func binarySearch(_ x: Int) -> Bool

func binarySearch(_ x: Int) -> Bool {
    var min = 0
    var max = A.count-1
    var mid = (A.count-1) / 2
    
    while min <= max {
        if A[mid] == x { return true }
        
        if x < A[mid] {
            max = mid - 1
            mid = (max + min) / 2
        } else {
            min = mid + 1
            mid = (max + min) / 2
        }
    }
    
    return false
}

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let M = Int(readLine()!)!
let ms = readLine()!.split(separator: " ").map { Int($0)! }

for m in ms {
    print(binarySearch(m) ? 1 : 0)
}



