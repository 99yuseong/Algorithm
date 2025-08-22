// 올바른 괄호
// (, ) 로만 구성된 문자열

// s: 1~10만
// O(N^2)까지 가능

import Foundation

func solution(_ s:String) -> Bool {
    
    var stack: [Character] = []
    
    for c in s {
        if c == "(" {
            stack.append(c)
        } else {
            if stack.isEmpty { return false } 
            else { stack.popLast() }
        }
    }

    return stack.isEmpty
}