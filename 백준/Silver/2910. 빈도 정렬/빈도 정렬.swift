// 숫자 N개로 이뤄진 수열
// 숫자는 C보다 작거나 같다.
// 빈도순으로 정렬
// StableSort를 해라

// 1 <= N <= 1000
// 1 <= C <= 1,000,000,000 10억 이하
// 1초
// 128MB

let NC = readLine()!.split(separator: " ").map { Int($0)! }
let N = NC[0]
let C = NC[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }
// 횟수가 많으면 앞으로,
// CountingSort는 빡세고, -> 10억의 배열
var cntArr: [[Int]] = []
var set = Set<Int>()

var cur = arr[0]
var cnt = 0

for i in 0..<N {
    let cur = arr[i]
    var cnt = 0
    
    if set.contains(cur) { continue }
    else { set.insert(cur) }
    
    for k in i..<N {
        if arr[k] == cur { cnt += 1 }
    }
    
    cntArr.append([cur, cnt])
}
cntArr.sort(by: { $0[1] > $1[1] })

var ans = ""
for num in cntArr {
    ans += Array(repeating: num[0], count: num[1]).map { String($0) }.joined(separator: " ")
    ans += " "
}
print(ans)

