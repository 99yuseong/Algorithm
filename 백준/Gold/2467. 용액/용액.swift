// 산성 1~10억
// 알칼리성 -10억~-1

// 두 용액을 섞어서 그나마 0에 가까운 용액

// 정렬된 순서로 주어졌을 때,
// 두 용액을 찾는 프로그램

// N개의 용액: 2~10만
// 오름차순
// -10억 ~ 10억

// 만 * 만 -> O(N^2)
// 첫 용액 ~ min = abs(A[i], A[j]), minI = i, minJ = j

//let N = Int(readLine()!)!
//var A = readLine()!.split(separator: " ").map { Int($0)! }
//
//var min = 2000000000
//var minI = 0
//var minJ = 0
//
//for i in 0..<A.count {
//    for j in i..<A.count {
//        let val = abs(A[i]+A[j])
//        if val < min && i != j {
//            min = val
//            minI = i
//            minJ = j
//        }
//    }
//}
//
//print("\(A[minI]) \(A[minJ])")

// 왜 시간초과가 날까...?



// 시간 복잡도 낮추자
// O(N^2) -> O(NlgN)
// 연산 편의를 위해 일단 10억씩 더해

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int($0)! }

func lowerBound(_ x: Int) -> Int { // lowerBound를 리턴
    var min = 0
    var max = A.count-1
    
    while min < max {
        let mid = (min + max) / 2
        
        if A[mid] < x { min = mid + 1 }
        else { max = mid }
    }
    
    return min
}

var minA = 1000000000
var minB = 1000000000

for i in 0..<A.count {
    let idx = lowerBound(-A[i]) // -A[i]보다 같거나 큰 수의 인덱스
    
    if i != idx && abs(A[idx] + A[i]) < abs(minA+minB) {
        minA = A[idx]
        minB = A[i]
    }
    
    if 0..<A.count ~= idx-1 && idx-1 != i && abs(A[idx-1] + A[i]) < abs(minA+minB) {
        minA = A[idx-1]
        minB = A[i]
    }
    
    if 0..<A.count ~= idx+1 && idx+1 != i && abs(A[idx+1] + A[i]) < abs(minA+minB) {
        minA = A[idx+1]
        minB = A[i]
    }
}

if minA < minB {
    print("\(minA) \(minB)")
} else {
    print("\(minB) \(minA)")
}

