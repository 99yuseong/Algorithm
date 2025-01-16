// 5초
// 256MB

// N: 저장된 사이트의 주소 수 1~10만
// M: 비밀번호 찾으려는 주소 수 1~10만

// Dictionary로 저장 / 출력

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var D = [String : String]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    D[input[0]] = input[1]
}

var ans = ""
for _ in 0..<M {
    ans += D[readLine()!]! + "\n"
}
print(ans)
