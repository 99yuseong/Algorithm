// 원소를 거꾸로 뒤집고, 오름차순으로 정렬
let input = readLine()!.split(separator: " ")
let N = Int(input[0])!
var arr: [Int] = []

for i in 1..<input.count {
    arr.append(Int(String(input[i].reversed()))!)
}

while arr.count < N {
    let input = readLine()!.split(separator: " ").map { Int(String($0.reversed()))! }
    for num in input { arr.append(num) }
}

arr.sort()
for num in arr { print(num) }
