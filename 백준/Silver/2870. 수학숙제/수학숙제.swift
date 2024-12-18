// 1초

// 숫자와 소문자글자 N줄
// 숫자를 찾은 뒤, 비내림차순으로 정리
// 숫자 앞이 0이있다면 생략 가능
// 가능한 가장 큰 숫자

// 숫자 앞뒤에 문자 또는 맨앞/맨뒤가 숫자
// 항상 소문자와 숫자로만
// 최대 100글자

let N = Int(readLine()!)! // 1~100 줄
var Ans: [String] = []

for _ in 0..<N {
    let word = Array(readLine()!).map { String($0) } // [Character]
    var num = ""
    
    for i in 0..<word.count {
        if "a"..."z" ~= word[i] { // 소문자다!
            if !num.isEmpty {
                Ans.append(num)
                num = ""
            }
            continue
        }
        // 숫자다!
        if num.count == 1 && num == "0" {
            num = word[i]
        } else {
            num += word[i]
        }
    }
    // 마지막이 숫자일 경우
    if !num.isEmpty { Ans.append(num) }
}

Ans.sort {
    $0.count == $1.count ? $0 < $1 : $0.count < $1.count
}

print(Ans.joined(separator: "\n"))

