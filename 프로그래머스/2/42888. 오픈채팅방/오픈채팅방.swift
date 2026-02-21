import Foundation

// 가상의 닉네임
// 관리자

// 들어옴, 나감
// 닉네임 변경 - 나가고 다시 or 변경

// 중복 닉네임 허용
// 최종 결과를 배열로 리턴

// n: 1~10만
// Enter [유저아이디] [닉네임]
// Leave [유저아이디]
// Chage [유저아이디] [닉네임]

// 대문자, 소문자, 숫자

// 들어가고 나감만 기록, 최종 닉네임으로 설정

// [아이디: 닉네임] 
// [String] = ["e", "아이디"]로 쌓고, 최종에 아이디 > 닉네임 치환

func solution(_ record:[String]) -> [String] {
    
    // 1. arr과 dict 
    var arr: [[String]] = []
    var nicks: [String: String] = [:]
    
    for r in record {
        
        let parts = r.split(separator: " ").map { String($0) }
        
        let cmd = parts[0]
        let id = parts[1]
        
        switch cmd {
        case "Enter":
            arr.append(["e", id])
            nicks[id] = parts[2]
        
        case "Leave":
            arr.append(["l", id])
        
        case "Change":
            nicks[id] = parts[2]
        
        default: 
            break
        }
    }
    
    return arr.map {
        if $0[0] == "e" {
            return "\(nicks[$0[1]]!)님이 들어왔습니다."
        } else {
            return "\(nicks[$0[1]]!)님이 나갔습니다."
        }
    }
}