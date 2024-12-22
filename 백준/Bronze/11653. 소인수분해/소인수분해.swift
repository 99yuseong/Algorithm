// 1초
// 1 ~ 천만
// N을 소인수 분해해라
// N이 1인 경우 아무것도 출력하지 않는다.
// N을 입력 받으면 1 여부 확인
// 2이상이면 -> 계속 2로 나누고, 계속 3으로 나누고, ... 루트 N까지 나누기
// var ans += i \n

let N = Int(readLine()!)!

var n = N
var ans = ""

if N > 1 {
    var i = 2
    while i * i <= N {
        while n % i == 0 {
            ans += "\(i)\n"
            n /= i
        }
        i += 1
    }
    
    print(n == 1 ? ans : ans + "\(n)")
}
