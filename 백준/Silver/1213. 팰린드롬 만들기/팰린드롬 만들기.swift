import Foundation

func solution(_ input: String) -> String {
    var charCount = [Character: Int]()
    
    // 1. 문자 개수 카운팅
    for char in input {
        charCount[char, default: 0] += 1
    }
    
    // 2. 홀수 개수 문자 확인
    var oddChar: Character? = nil
    var oddCount = 0
    
    for (char, count) in charCount {
        if count % 2 == 1 {
            oddCount += 1
            oddChar = char
        }
    }
    
    // 3. 홀수 개수 문자가 2개 이상이면 팰린드롬 불가능
    if oddCount > 1 {
        return "I'm Sorry Hansoo"
    }
    
    // 4. 팰린드롬 생성
    var halfString = ""
    
    // 사전순 정렬 후 절반 만들기
    for char in charCount.keys.sorted() {
        halfString += String(repeating: char, count: charCount[char]! / 2)
    }
    
    // 5. 완전한 팰린드롬 조합
    let reversedHalf = String(halfString.reversed())
    if let middle = oddChar {
        return halfString + String(middle) + reversedHalf
    } else {
        return halfString + reversedHalf
    }
}

print(solution(readLine()!))
