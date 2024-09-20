let line = readLine()!
var stack: [Character] = []
var layer = 0
var num = 0
var isL = false

for char in line {
    switch char {
    case "(":
        stack.append("(")
        layer += 1
        isL = true
    case ")":
        if !stack.isEmpty && stack.last! == "(" && isL{
            _ = stack.popLast()
            layer -= 1
            num += layer
        } else {
            layer -= 1
            num += 1
        }
        isL = false
    default:
        break
    }
}
print(num)
