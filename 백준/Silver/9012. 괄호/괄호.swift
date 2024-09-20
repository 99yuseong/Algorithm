let T = Int(readLine()!)!
out: for _ in 0..<T {
    var stack: [Character] = []
    let line = readLine()!
    for char in line {
        switch char {
        case "(":
            stack.append("(")
        case ")":
            if !stack.isEmpty && stack.last! == "(" {
                _ = stack.popLast()
            } else {
                print("NO")
                continue out
            }
        default:
            break
        }
    }
    print(stack.isEmpty ? "YES" : "NO")
}
