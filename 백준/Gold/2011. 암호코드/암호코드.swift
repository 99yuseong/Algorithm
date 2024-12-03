// 2초
// 128MB

// 대화 암호화
// 암호 해석이 나올 수 있는 가짓수
// 5000자리 이하 암호
// 가짓수

// 1 ~ 26
// D[i]: i번째까지 나올 수 있는 암호 가짓수
// D[i] = D[i-2] + D[i-1] if A[i] != 0 && A[i-1] = 1, 2
// D[i] = D[i-1] if A[i-1] != 1, 2
// D[i] = Error if A[i] == 0 && (A[i-1] != 1 && A[i-1] != 2)

import Foundation

let A = [0] + readLine()!.map { Int(String($0))! }
var D = Array(repeating: 0, count: A.count)

D[0] = 1

for i in 1...A.count-1 {
    if A[i] > 0 {
        D[i] = (D[i] + D[i-1]) % 1000000
    }
    
    if 10...26 ~= A[i-1] * 10 + A[i] {
        D[i] = (D[i] + D[i-2]) % 1000000
    }
}

print(D.last!)
