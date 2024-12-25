// 2초
// 4MB -> ? 연산인가

// 3개의 수로 연도 지구, 태양, 달
// E 1~15
// S 1~28
// M 1~19

// 정답이 음수인 경우는 없다.

// 나머지가 E인 15의 배수 (E가 15의 배수면 0)
// 나머지가 M인 19의 배수 (M이 19의 배수면 0)
// 나머지가 S인 28의 배수 (S가 28의 배수면 0)

let ESM = readLine()!.split(separator: " ").map { Int($0)! }

let E = ESM[0]
let S = ESM[1]
let M = ESM[2]

var num = E

while true {
    if num % 19 == M || (M == 19 && num % 19 == 0) {
        if num % 28 == S || (S == 28 && num % 28 == 0) {
            print(num)
            break
        }
    }
    num += 15
}


