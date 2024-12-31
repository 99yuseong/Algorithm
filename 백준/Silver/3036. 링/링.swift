// 1초
// 128MB

// N: 링의 개수 3개~100개
// 반지름 1~1000

// 출력 N-1
// 기약분수

// 각 링을 처음 링의 반지름으로 나눈 수 -> 돌아간건 2*pi*r

// gcd를 구해서 각 수를 나눈 후 출력
// gcd(12, 8) = gcd(8, 4) = gcd(4, 4) = gcd(4, 0)
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }

for i in 1..<A.count {
    let d = gcd(A[0], A[i])
    print("\(A[0]/d)/\(A[i]/d)")
}

// TestCase
// Input:
// 3
// 222 333 555
// Output:
// 2/3
// 2/5
