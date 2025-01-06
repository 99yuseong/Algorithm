// 3명 팀
// 팀워크 / 실력

// A 코딩 실력 : -만~만
// 세 팀원의 코딩 실력의 합이 0이 되는 팀

// A[x] + A[y] + A[z] = 0
// N: 1~10000
// 팀의 수
// 사람은 중복될 수도 있다.

// 4초
// O(N^2lgN)언더로 구현, O(N^3)는 불가능

// 1. 3중 for문으로 x, y, z 찾기 -> 시간 초과
// 2. T[x'] = A[x] + A[y] -> 1억 길이의 배열
// -A[z] 가 되는 수를 T[x']에서 이분 탐색
// O(N * lg(N^8)) + O(N^2)

//let N = Int(readLine()!)!
//let A = readLine()!.split(separator: " ").map { Int($0)! }

//var T: [Int] = []
//for i in 0..<N {
//    for j in (i+1)..<N { T.append(A[i] + A[j]) }
//}
//
//var count = 0
//T.sort()
//for z in 0..<N {
//    if binarySearchT(-A[z]) { count += 1 }
//    if binarySearchA(-2 * A[z]) { count -= 1 }
//    if binarySearchT(0) { count += 1 }
//}
//print(count)
//
//func binarySearchT(_ x: Int) -> Bool { // T안에 -A[z]가 존재하는 가?
//    var min = 0
//    var max = T.count-1
//    
//    while min <= max {
//        let mid = (min + max) / 2
//        
//        if T[mid] == x { return true }
//        
//        if T[mid] < x { min = mid + 1 }
//        else { max = mid - 1 }
//    }
//    return false
//}
//
//func binarySearchA(_ x: Int) -> Bool { // A안에 -A[z]가 존재하는 가?
//    var min = 0
//    var max = A.count-1
//    
//    while min <= max {
//        let mid = (min + max) / 2
//        
//        if A[mid] == x { return true }
//        
//        if A[mid] < x { min = mid + 1 }
//        else { max = mid - 1 }
//    }
//    return false
//}
//

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int($0)! }

func lowerBound(st: Int, end: Int, target: Int) -> Int {
    var min = st
    var max = end
    
    while min < max {
        let mid = (min + max) / 2
        
        if A[mid] < target { min = mid + 1 }
        else { max = mid }
    }
    
    return min
}

func upperBound(st: Int, end: Int, target: Int) -> Int {
    var min = st
    var max = end
    
    while min < max {
        let mid = (min + max) / 2
        
        if A[mid] <= target { min = mid + 1 }
        else { max = mid }
    }
    
    return min
}

var count = 0
A.sort()
for i in 0..<N {
    for j in (i+1)..<N {
        let ub = upperBound(st: j+1, end: N, target: -A[i]-A[j])
        let lb = lowerBound(st: j+1, end: N, target: -A[i]-A[j])
        count += ub - lb
    }
}
print(count)
