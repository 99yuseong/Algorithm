// 1초
// 256MB

// 숫자카드 N개: 정수
// 정수 M개에서 상근이는 몇개나 가지고 있나.

// 상근 소유 카드 N장: 1~50만
// -1000만~1000만 사이 (정수 범위)

// 찾을 정수 M개 1~50만
// M개의 정수 중 상근이는 몇개를 가지고 있나.

// M개의 정수에 대해 N개의 카드에 포함되는 지 여부 확인 + 1
// 50만 * 50만 -> 2500억
// MlogN -> 125만회
// 이분 탐색으로 카드 포함 여부 체크 -> M번 반복

// 정렬, [num, count]배열로 변경
// NlogN + N + MlogN

//func binarySearch(_ x: Int) -> Int {
//    var min = 0
//    var max = A.count - 1
//    
//    while min <= max {
//        let mid = (min + max) / 2
//        
//        if A[mid][0] == x { return A[mid][1] }
//        
//        if A[mid][0] < x {
//            min = mid + 1
//        } else {
//            max = mid - 1
//        }
//    }
//    
//    return 0
//}
//
//let N = Int(readLine()!)!
//var _A = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
//var A: [[Int]] = []
//
//A.append([_A[0], 1])
//for i in 1..<_A.count {
//    if A.last![0] == _A[i] {
//        A[A.count-1][1] += 1
//    } else {
//        A.append([_A[i],1])
//    }
//}
//
//let M = Int(readLine()!)!
//var Ms = readLine()!.split(separator: " ").map { Int($0)! }
//print(Ms.map { String(binarySearch($0)) }.joined(separator: " "))


let N = Int(readLine()!)!
var _A = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let M = Int(readLine()!)!
var Ms = readLine()!.split(separator: " ").map { Int($0)! }

print(Ms.map { String(upperIndex($0) - lowerIndex($0)) }.joined(separator: " "))

func lowerIndex(_ x: Int) -> Int {
    var min = 0
    var max = _A.count
    
    while min < max {
        let mid = (min + max) / 2
        
        if x <= _A[mid] { max = mid }
        else { min = mid + 1 } // _A[mid] < x
    }
    
    return min
}

func upperIndex(_ x: Int) -> Int {
    var min = 0
    var max = _A.count
    
    while min < max {
        let mid = (min + max) / 2
        
        if x < _A[mid] { max = mid }
        else { min = mid + 1 }
    }
    
    return min
}
