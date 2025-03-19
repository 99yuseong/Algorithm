import Foundation
// s의 길이: 1~50
// 리턴값은 20억 이하의 정수만
func solution(_ s:String) -> Int {
    let N: [String: Int] = [
        "zero": 0,
        "one": 1,
        "two": 2,
        "three": 3,
        "four": 4,
        "five": 5,
        "six": 6,
        "seven": 7,
        "eight": 8,
        "nine": 9
    ]
    
    var ans = ""
    
    var cur = ""
    var idx = 0
    for char in s {
        cur += String(char)
        
        if let num = Int(cur) { 
            ans += cur
            cur = ""
        }
        
        if let num = N[cur] {
            ans += "\(num)"
            cur = ""
        }
    }
    
    return Int(ans)!
}

// 숫자 > 일부 자릿수를 영단어로 바꾼카드 > 원래 숫자를 찾는게임
// 바뀐 문자열 s -> 숫자를 리턴