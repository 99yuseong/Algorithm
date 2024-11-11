let N = Int(readLine()!)!
var eggs = Array(repeating: [0,0], count: N)
var answer = 0
var cnt = 0

for i in 0..<N {
    eggs[i] = readLine()!.split(separator: " ").compactMap { Int($0) }
}

func beat(_ k: Int) { // k번째 달걀을 들고 치는 함수
    if k == N {
        answer = max(answer, cnt)
        return
    }
    
    if eggs[k][0] <= 0 || cnt == N-1 {
        beat(k+1)
        return
    }
    
    for i in 0..<N {
        if i == k || eggs[i][0] <= 0 { continue }
        
        eggs[k][0] -= eggs[i][1]
        eggs[i][0] -= eggs[k][1]
        if eggs[i][0] <= 0 { cnt += 1 }
        if eggs[k][0] <= 0 { cnt += 1 }
        beat(k+1)
        if eggs[i][0] <= 0 { cnt -= 1 }
        if eggs[k][0] <= 0 { cnt -= 1 }
        eggs[k][0] += eggs[i][1]
        eggs[i][0] += eggs[k][1]
    }
}
beat(0)
print(answer)
