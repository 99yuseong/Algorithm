import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }
let sorted = arr.sorted()
var visited = Set<[Int]>()
var queue: [[Int]] = []

if arr == sorted {
    print(0)
    exit(0)
}

for i in 0...N-K {
    let reversed = arr[0..<i] + arr[i..<i+K].reversed() + arr[i+K..<N]
    queue.append(reversed + [1])
    visited.insert(Array(reversed))
}

while !queue.isEmpty {
    let cur = queue.removeFirst()
    let curArr = Array(cur[0..<N])
    
    if curArr == sorted {
        print(cur[N])
        exit(0)
    }
    
    for i in 0...N-K {
        let reversed = Array(cur[0..<i] + cur[i..<i+K].reversed() + cur[i+K..<N])
        
        if !visited.contains(reversed) {
            queue.append(reversed + [cur[N] + 1])
            visited.insert(Array(reversed))
        }
    }
}
print(-1)
