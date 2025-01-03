// 2초
// 256MB

// 자연수 집합 A, B
// A에는 속하면서 B에는 속하지 않는 원소

// 1 <= n(A) <= n(B) <= 50만
// 원소는 2^31-1 이하 자연수
// 집합 내 원소의 값은 모두 다르다

// A에는 속하지만 B에 속하지 않는 원소의 개수
// 증가하는 순서대로 출력
// 없다면 0만 출력

// 50만 -> O(NlgN) or O(N)

// A, B -> set.substract + sort

let NaNb = readLine()!.split(separator: " ").map { Int($0)! }
let Na = NaNb[0]
let Nb = NaNb[1]

var setA = Set(readLine()!.split(separator: " ").map { Int($0)! })
var setB = Set(readLine()!.split(separator: " ").map { Int($0)! })

setA.subtract(setB)

if setA.isEmpty {
    print(0)
} else {
    print(setA.count)
    print(Array(setA).sorted().map { String($0) }.joined(separator: " "))
}
