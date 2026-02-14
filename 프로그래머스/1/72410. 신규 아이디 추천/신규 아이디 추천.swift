import Foundation

// 아이디 생성
// 신규 유저 -> 규칙X 아이디 추천

// 추천 아이디를 리턴

// 1. 규칙이 맞는가?
// 2. 신규 아이디 추천

// 1~1000자리
// 특수문자는 한정

let mark: [Character] = Array("-_.~!@#$%^&*()=+[{]}:?,<>/")
let bannedMark: [Character] = mark.filter { !onlyUse.contains($0) } 
let onlyUse: [Character] = ["-", "_", "."]
let num: [Character] = (0...9).map { Character(String($0)) }

func solution(_ new_id:String) -> String {
    
    if canUse(new_id) { return new_id }
    
    return makeRecommend(new_id)
}

func canUse(_ new_id: String) -> Bool {
    
    // 3~15자
    // 알파벳, 숫자, -, _, .
    // 마침표는 처음, 끝, 연속 사용 불가    
    
    guard (3...15) ~= new_id.count else { return false }
    
    let id = Array(new_id).filter { num.contains($0) || onlyUse.contains($0) || ($0 >= "a" && $0 <= "z") }

    guard new_id.count == id.count else { return false }
    
    guard new_id.first! != "." && new_id.last! != "." else { return false }
    
    guard !new_id.contains("..") else { return false }
    
    return true
}

func makeRecommend(_ new_id: String) -> String {
    
    // 1. 대문자 > 소문자
    var id = new_id.lowercased()
    
    // 2. 모든 불가능 문자 제거
    id = id.filter { !bannedMark.contains($0) }
    
    // 3. 마침표 2번 연속 > 1개로
    var newId = ""
    for char in Array(id) {
        if char == "." {
            if newId.count == 0 {
                newId += String(char)
                continue
            }
            
            if newId.last! != "." { 
                newId += String(char) 
            }
            
            continue
        } 
        newId += String(char)
    }
    id = newId
    
    // 4. 처음, 끝 마침표 제거
    if let first = id.first, first == "." { id = String(id.suffix(id.count-1)) }
    if let last = id.last, last == "." { id = String(id.prefix(id.count-1)) }
    
    // 5. 빈 문자열 > a
    if id.isEmpty { id = "a" }
    
    // 6. 16자 이상 > 15개만 자르기 > 마침표가 맨 마지막 > 맨끝 마침표 제거
    if id.count > 15 { 
        id = String(id.prefix(15)) 
        if let last = id.last, last == "." { id = String(id.prefix(id.count-1)) }
    }
    
    // 7. 2자이하 > 마지막 문자를 3이 될때까지 반복
    while id.count < 3 {
        id += String(id.last!)
    }
    
    return id
}