import Foundation

while true {
    var hist = readLine()!.split(separator: " ").map { Int($0)! }
    let n = hist.remove(at: 0)
    
    if n == 0 {
        break
    }
    
    var stack: [Int] = []
    var answer: Int = 0
    
    for i in 0..<n {
        while !stack.isEmpty && hist[stack.last!] > hist[i] {
            let tmp = stack.popLast()!
            let width = stack.isEmpty ? i : i - stack.last! - 1
            answer = max(answer, width * hist[tmp])
            
        }
        stack.append(i)
    }
    
    while !stack.isEmpty {
        let tmp = stack.popLast()!
        let width = stack.isEmpty ? n : n - stack.last! - 1
        answer = max(answer, width * hist[tmp])
    }
    
    print(answer)
}
