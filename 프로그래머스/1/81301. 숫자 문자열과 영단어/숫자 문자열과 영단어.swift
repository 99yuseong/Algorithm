import Foundation

func solution(_ s:String) -> Int {
    var ans = ""
    var temp = ""
    
    // 2. string을 돌면서 숫자 여부 확인
    for str in s {
        
        if Number.check(str) {
            ans += String(str)
        } else {
            temp += String(str)
            
            if let num = Number.convert(temp) {
                ans += num
                temp = ""
            }
        }
    }
    
    if !temp.isEmpty {
        if let num = Number.convert(temp) { ans += num }
    }
    
    return Int(ans)!
}

enum Number {
static func check(_ char: Character) -> Bool {
    return Int(String(char)) != nil
}
        
static func convert(_ string: String) -> String! {
    switch string {
    case "zero": return "0"
    case "one": return "1"
    case "two": return "2"
    case "three": return "3"
    case "four": return "4"
    case "five": return "5"
    case "six": return "6"
    case "seven": return "7"
    case "eight": return "8"
    case "nine": return "9"
    default: return nil
    }
}
}
// 일부 자리를 영단어로 바꾼카드 -> 원래 숫자를 찾는 게임
// 원래 숫자를 리턴
// 영단어 -> 숫자로 변경