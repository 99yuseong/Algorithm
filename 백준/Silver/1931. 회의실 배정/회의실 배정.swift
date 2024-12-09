// 2초
// 128MB

// N개의 회의에 대한 시간표
// 각 회의의 시작시간과 끝시간
// 겹치지 않게 회의실을 사용하는 회의 최대 개수

let N = Int(readLine()!)! // N 회의 수 1~10만
var times: [[Int]] = []
for _ in 0..<N {
    times.append(readLine()!.split(separator: " ").map { Int($0)! })
}
times.sort { $0[1] == $1[1] ? $0[0] < $1[0]: $0[1] < $1[1]  }

var t = 0
var ans = 0
for i in 0..<N {
    if t <= times[i][0] {
        ans += 1
        t = times[i][1]
    }
}
print(ans)
