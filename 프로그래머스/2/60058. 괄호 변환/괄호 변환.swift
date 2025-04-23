import Foundation

func solution(_ p:String) -> String {
    return convert(p)
}

// 1. 빈문자열이면 반환, 분리시키는 함수을 수행하는 함수
func convert(_ input: String) -> String {
    if input.isEmpty { return "" }
    
    let u = firstBalanced(input)
    let v = String(input.dropFirst(u.count))
    
    if isRightString(u) {
        return u + convert(v)
    } else {
        let trimmed = u.dropFirst().dropLast().map { $0.toggle() }
        return "(" + convert(v) + ")" + String(trimmed)
    }
}

// 2. 가장 먼저 나오는 균형잡힌 문자열을 리턴하는 함수
func firstBalanced(_ string: String) -> String {
    var lcnt = 0
    var rcnt = 0
    var str = ""
    
    for char in string {
        if char == "(" { 
            lcnt += 1 
            str += "("
        } else { 
            rcnt += 1 
            str += ")"
        }
        
        if lcnt != 0 && lcnt == rcnt { return str }
    }
    
    return string
}

// 3. 올바른 문자열을 확인하는 함수
func isRightString(_ string: String) -> Bool {
    var stack: [Character] = []
    
    for char in string {
        if char == "(" { 
            stack.append(char) 
        } else {
            if !stack.isEmpty && stack.last == "(" {
                stack.removeLast()
            } else {
                return false
            }
        }
    }
    
    return stack.isEmpty
}

// 4. 뒤집는 함수
extension Character {
    func toggle() -> Self {
        if self == "(" { return ")" }
        else { return "(" }
    }
}

// 균형잡힌 괄호 문자열 p
// 올바른 괄호 문자열로 변환 결과를 리턴

// 작성된 괄호가 개수는 맞지만 짝이 맞지 않은 형태
// 작성된 모든 괄호를 뽑아서 올바른 순서대로 배치된 괄호 문자열

// '(' 의 개수와 ')' 의 개수가 같다면 이를 균형잡힌 괄호 문자열
//  '('와 ')'의 괄호의 짝도 모두 맞을 경우에는 이를 올바른 괄호 문자열

// 1. 빈 문자열 -> 빈 문자열 반환
// 2. w -> u, v로 분리
//    u는 더이상 분리할 수 없어야함. v는 빈 문자열이 될 수 있다.

// 3. u가 올바른 문자열 -> v에 대해 1을 다시 수행
//    u에 이어붙여 반환

// 4-1. 빈 문자열에 첫 번째 문자로 '('를 붙입니다. 
//   4-2. 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙입니다. 
//   4-3. ')'를 다시 붙입니다. 
//   4-4. u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다. 
//   4-5. 생성된 문자열을 반환합니다.


