let N = Int(readLine()!)! // 1~100개
let pattern = readLine()!.split(separator: "*").map { String($0) } // 3~100자
let left = pattern[0]
let right = pattern[1]

for _ in 0..<N {
    let input = Array(readLine()!)
    
    if input.count < left.count + right.count {
        print("NE")
        continue
    }
    
    if String(input[0..<left.count]) == left && String(input[input.count-right.count..<input.count]) == right {
        print("DA")
    } else {
        print("NE") // 불일치
    }
}