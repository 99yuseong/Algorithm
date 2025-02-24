func solution(N: Int, cmds: [String]) -> [Int] {
    var stack: [Int] = []
    var ans: [Int] = []
    
    for cmd in cmds {
        let _cmd = cmd.split(separator: " ")
        
        switch _cmd[0] {
            case "push":
                stack.append(Int(_cmd[1])!)
            case "pop":
                ans.append(stack.isEmpty ? -1 : stack.removeLast())
            case "size":
                ans.append(stack.count)
            case "empty":
                ans.append(stack.isEmpty ? 1 : 0)
            case "top":
                ans.append(stack.isEmpty ? -1 : stack.last!)
            default: break
        }
    }
    
    return ans
}

let N = Int(readLine()!)!
var cmds: [String] = []
for _ in 0..<N { cmds.append(readLine()!) }

var ans = ""
for num in solution(N: N, cmds: cmds) {
    ans += "\(num)\n"
}
print(ans)
