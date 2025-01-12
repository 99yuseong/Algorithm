// 1초
// 메모리 256MB

// 중복 가능
// k개의 접시를 연속해서 먹을 경우 할인
// 연속 먹음 -> 쿠폰 초밥 무료 제공 (없다면 만들어서 제공)

// N: 접시 수 2~3만 O(N^2)까지 가능 10억...정도
// d: 초밥 종류 2~3천
// k: 연속 접시 수 2~3만
// c:쿠폰 번호 1~3천

// 0..<N까지 k개원소를 Set요소 Set으로 만들고, k contains 여부 확인
// O(N^2)

//var NDKC = readLine()!.split(separator: " ").map { Int($0)! }
//let N = NDKC[0]
//let d = NDKC[1]
//let k = NDKC[2]
//let c = NDKC[3]
//var A: [Int] = []
//var isC: Bool = false
//
//for _ in 0..<N {
//    let num = Int(readLine()!)!
//    if num == c { isC = true }
//    A.append(num)
//}
//
//var ans = 0
//for i in 0..<N {
//    var j = i
//    var set = Set<Int>()
//    while j - i < k {
//        set.insert(A[j % N])
//        j += 1
//    }
//    
//    ans = max(ans, set.count + (!set.contains(c) && isC ? 1 : 0))
//}
//print(ans)

var NDKC = readLine()!.split(separator: " ").map { Int($0)! }
let N = NDKC[0]
let d = NDKC[1]
let k = NDKC[2]
let c = NDKC[3]
var A: [Int] = []
for _ in 0..<N { A.append(Int(readLine()!)!) }
for i in 0..<N { A.append(A[i]) }

var ateCnt = Array(repeating: 0, count: d+1)
ateCnt[c] += 1
var ateType = 1
var ans = 1

for i in 0..<2*N {
    if i >= k {
        ateCnt[A[i-k]] -= 1
        if ateCnt[A[i-k]] == 0 { ateType -= 1 }
    }
    
    if ateCnt[A[i]] == 0 {
        ateType += 1
        ans = max(ans, ateType)
    }
    ateCnt[A[i]] += 1
}
print(ans)
