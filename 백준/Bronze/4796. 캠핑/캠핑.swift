// 1초
// 128MB

// 연속하는 20일 중 10일 동안만
// 연속하는 P일 중 L일 동안 사용, V일짜리 휴가
// 1 < L < P < V Int 정수 범위

// 000이 나올때까지 Loop

var cnt = 1
while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }

    if input == [0,0,0] { break }
    let L = input[0]
    let P = input[1]
    let V = input[2]
    
    print("Case \(cnt): \(V / P * L + min(V % P, L))")
    cnt += 1
}
