import Foundation

while true {
    var hist = readLine()!.split(separator: " ").map { Int($0)! }
    let n = hist.remove(at: 0)
    
    if n == 0 {
        break
    }
    
    var stack: [Int] = []
    var maxArea: Int = 0
    
    for i in 0..<n {
        while !stack.isEmpty && hist[stack.last!] > hist[i] {
            let remove = stack.popLast()!
            let width = stack.isEmpty ? i : i - stack.last! - 1
            maxArea = max(maxArea, width * hist[remove])
        }
        stack.append(i)
    }
    
    while !stack.isEmpty {
        let remove = stack.popLast()!
        let width = stack.isEmpty ? n : n - stack.last! - 1
        maxArea = max(maxArea, width * hist[remove])
    }
    
    print(maxArea)
}
