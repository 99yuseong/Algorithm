// 1초
// 256MB

// 나무 M 미터 필요
// 높이 H 기준으로 자른다.

// 20 15 10 17
// H = 15라면
// 15 15 10 15 (남은 나무)
// 5  0  0  2  (얻은 나무)

// H: 0 ~ 자연수
// 필요한 만큼의 M만 가져가고 싶다. (최소값)

// N: 나무의 수 1~100만
// M: 필요한 나무 1~20억

// 나무의 높이는 0~10억

// parametric search
// 이분 탐색
// H를 선언하면 필요한 M만큼이 충족되는 가?

func isEnough(_ h: Int) -> Bool {
    var amount = 0
    for a in A {
        amount += max(a - h, 0)
    }
    return amount >= M
}

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var A = readLine()!.split(separator: " ").map { Int($0)! }

var minH = 0
var maxH = 1000000000

while minH < maxH {
    let midH = (minH + maxH + 1) / 2
    
    if isEnough(midH) { minH = midH } // 더 적게 잘라도 돼
    else { maxH = midH - 1 } // 조금 더 필요해
}
print(minH)
