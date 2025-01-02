// 1초
// 128MB

// N개의 자연수 집합: 5~1000개
// 3개의 수를 골랐을때, 3개 수의 합 d도 집합에 포함되는 경우
// 가장 큰 d 찾기

// 무조건 다른 수가 입력됨
// 항상 답이 존재
// 1~2억 사이의 값

// A[x] + A[y] + A[z] = A[k]
// 새로운 배열 T: A의 원소를 2개씩 묶어서 합이 존재하는 Set
// O(N^2)
// for a in A
//     for b in A
//         insert(a+b)

// O(N^2lgN)
// 반복문 후 이분 탐색
// T[x] + A[z] = A[k]
import Foundation

let N = Int(readLine()!)!
var A: [Int] = []
for _ in 0..<N { A.append(Int(readLine()!)!) }

// A 배열 정렬
A.sort()

// T 배열 생성: T: A[i] + A[j]
var T: [Int] = []
for i in 0..<A.count {
    for j in i..<A.count {
        T.append(A[i] + A[j])
    }
}

// T 배열 정렬
T.sort()

// T[x] = A[k] - A[z]

for k in stride(from: A.count-1, to: 0, by: -1) {
    for z in 0..<k {
        if binarySearch(A[k]-A[z]) {
            print(A[k])
            exit(0)
        }
    }
}

func binarySearch(_ target: Int) -> Bool {
    var min = 0
    var max = T.count-1
    
    while min <= max {
        let mid = (min + max) / 2
        
        if T[mid] == target { return true }
        
        if T[mid] < target { min = mid + 1 }
        else { max = mid - 1 }
    }
    
    return false
}




//// T 배열 생성: O(N^2)
//for a in A {
//    for b in A {
//        T.append(a+b)
//    }
//}
//
//// T[x] + A[z] = A[k]
//func binarySearch(_ target: Int) -> Int { // A[k] 값 리턴
//    var min = 0
//    var max = A.count-1
//    
//    while min <= max {
//        let mid = (min + max) / 2
//        
//        if A[mid] == target { return A[mid] }
//        
//        if A[mid] < target { min = mid + 1 }
//        else { max = mid - 1 }
//    }
//    
//    return -1
//}
//
//var k = 0
//for x in 0..<T.count {
//    for z in 0..<A.count {
//        let newK = binarySearch(T[x] + A[z])
//        
//        k = max(k, newK)
//    }
//}
//print(k)
//
