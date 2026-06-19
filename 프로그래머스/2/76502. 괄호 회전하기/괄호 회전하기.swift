import Foundation

func isSame(_ s1: Character, _ s2: Character) -> Bool {
    return 
        s1 == "(" && s2 == ")"
        || s1 == "[" && s2 == "]"
        || s1 == "{" && s2 == "}"
}

func isRight(_ arr: [Character]) -> Bool {
    
    var arr = arr
    var stack: [Character] = []
    
    while !arr.isEmpty {
        if !stack.isEmpty && isSame(arr.last!, stack.last!) {
            stack.removeLast()  
            arr.removeLast()
        } else {
            stack.append(arr.popLast()!)
        }
    }
    
    
    
    return stack.isEmpty
}

func solution(_ s:String) -> Int {
    
    let arr = Array(s) + Array(s)
    var answer = 0
    
    for i in 0..<s.count {
        let isRight = isRight(Array(arr[i..<i+s.count]))
        print(isRight)
        answer += isRight ? 1 : 0
    }
    
    return answer
}