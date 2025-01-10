import Foundation

// 연속된 소수의 합으로 나타낼 수 있는 경우의 수
let N = Int(readLine()!)!

// 소수 배열 -> 부분 합으로 N이 될 수 있는가?
if N == 1 {
    print(0)
    exit(0)
}

// 1. 소수 배열 -> 에라토스테네스의 체
var isPrime = Array(repeating: true, count: N+1)
isPrime[0] = false
isPrime[1] = false

for i in 0..<isPrime.count {
    if !isPrime[i] { continue }
    
    // i의 배수를 모두 false처리
    var j = i * 2
    while j <= N {
        isPrime[j] = false
        j += i
    }
}

var A = (2...N).filter { isPrime[$0] } // N과 같거나 작은 소수의 배열

// 2. 소수 배열의 부분합으로 N이 되는 경우의 수 찾기
var st = 0
var en = 0
var sum = A[0]
var cnt = 0

while st < A.count {
		
		while sum < N && en < A.count {
				en += 1
				if en != A.count { sum += A[en] }
		}
		
		if en == A.count { break }
		
		if sum == N { cnt += 1 }
		sum -= A[st]
		st += 1
}

print(cnt)
