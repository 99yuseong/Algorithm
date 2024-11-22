// N개의 수 수열
// N-1개의 연산자
// +,-,x,/

// 앞에서부터 진행
// 몫만
// 양수로 바꾼뒤 몫을 취하고, 그 몫을 음수로

// 최대와 최소

// 2 <= N <= 11

// 최대 10개 나열
// 10! 360만 정도

// 1 <= A <= 100
// -10억 ~ 10억

let N = Int(readLine()!)! // 수의 개수
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var oprs = readLine()!.split(separator: " ").map { Int($0)! }
// +, -, *, /

var minAns = 1000000000
var maxAns = -1000000000

func sol(_ k: Int, ans: Int) { // k번째 값을 연산해 ans를 만드는 함수
    if k == N {
        minAns = min(minAns, ans)
        maxAns = max(maxAns, ans)
        return
    }
    
    for i in 0..<4 {
        if oprs[i] > 0 {
            oprs[i] -= 1
            switch i {
            case 0: sol(k+1, ans: ans + nums[k])
            case 1: sol(k+1, ans: ans - nums[k])
            case 2: sol(k+1, ans: ans * nums[k])
            default:
                if ans < 0 {
                    sol(k+1, ans: -(-ans / nums[k]))
                } else {
                    sol(k+1, ans: ans / nums[k])
                }
            }
            oprs[i] += 1
        }
    }
}
sol(1, ans: nums.first!)
print(maxAns)
print(minAns)