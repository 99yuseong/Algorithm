// 수 N개 i번째 수 부터 j번째 수의 합

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0] // 수의 개수
let M = NM[1] // 합을 구해야하는 횟수
var nums = [0] + readLine()!.split(separator: " ").map { Int($0)! }

for i in 1...N {
    nums[i] = nums[i-1] + nums[i]
}

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let from = input[0]
    let to = input[1]
    print(nums[to]-nums[max(0, from-1)])
}
