// 암호화
// N글자
// R <= C
// R * C = N
// R과 C를 선택. 가장 큰 R을 선택
import Foundation

let word: [String] = Array(readLine()!).map { String($0) }
let N = word.count

var R = 1
for i in 1...Int(sqrt(Double(N))) {
    if N % i == 0 { R = i }
}
var C = N / R
var A = Array(repeating: Array(repeating: "", count: C), count: R)

var ans = ""
for i in 0..<R {
    for j in 0..<C {
        ans += word[j*R+i]
    }
}
print(ans)
