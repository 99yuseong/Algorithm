let NandS = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = NandS[0] // N개의 정수
let S = NandS[1] // 합이 S가 되도록
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

// N개의 정수 중 0~N개를 뽑아서 합이 S가 되는 경우의 수를 달라
var cnt = 0

func sol(_ k: Int, tot: Int) { // k개의 원소를 선택!
    if k == N {
        if tot == S { cnt += 1 }
        return
    }
    
    sol(k+1, tot: tot)
    sol(k+1, tot: tot + arr[k])
}
sol(0, tot: 0)
if S == 0 { cnt -= 1 }
print(cnt)
