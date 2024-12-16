// 시간 제한 2초
// 양수, +, -, 괄호
// 괄호를 모두 지움
// 괄호를 적절히 -> 값을 최소로

// 0~9, +, - 로만 구성
// 처음과 마지막은 숫자
// 5자리모다 많이 연속되는 숫자 없음 ~ 최대 99999
// 길이는 50 이하

// 1. +는 나와도 괄호 상관 없음
// 2. -이후를 최대한 괄호로 묶는 것이 좋음
// -가 나오면 다음 - 또는 마지막까지 괄호 쳐주는 게 좋음

let input = Array(readLine()!)

var ans = 0
var curNum = 0
var isMinus = false

for i in 0..<input.count {
    if input[i] == "+" || input[i] == "-" {
        ans += isMinus ? -curNum : curNum
        curNum = 0
        if input[i] == "-" { isMinus = true }
        continue
    }
    
    curNum = curNum * 10 + Int(String(input[i]))!
}
ans += isMinus ? -curNum : curNum
print(ans)
