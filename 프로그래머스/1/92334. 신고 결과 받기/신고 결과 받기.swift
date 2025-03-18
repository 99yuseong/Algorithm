import Foundation

// 불량 이용자를 신고, 처리 결과를 메일로 발송
// 1. 각 유저는 1번에 1명의 유저를 신고
// 2. 횟수 제한 X
// 3. 동일한 유저 신고는 1회로 처리

// 4. k번 이상 신고시 정지
// 5. 정지된 유저를 신고한 모든 유저에게 메일로 발송
// 6. 메일은 한꺼번에 발송

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    // id_list: 사용자 ID - 2~1000명, 중복되지 않음, id: 1~10자 문자열
    // report: "A B" A가 B를 신고 - 1~20만, 공백처리, 자신 신고하는 경우 X
    // k: 신고 정지 횟수: 1~200
    
    // 1. report > set > array > 중복 제거 -> O(20만) + O(20만)
    // 2. 신고배열[당한사람] = [신고자], report를 돌면서 배열 채우기 -> O(20만)
    // 3. 다시 신고배열[당한사람].count >= k -> report 돌면서 횟수 비교 -> O(1000만)
        // 신고배열[당한사람]의 신고자를 돌면서 -> 메일[신고자] += 1 -> O(20만)
    let n = id_list.count
    var ID: [String: Int] = [:]
    for i in 0..<n { ID[id_list[i]] = i } // O(1000)

    // 신고 배열
    var record: [[Int]] = Array(repeating: [], count: n)
    // 메일 수
    var mail: [Int] = Array(repeating: 0, count: n)
    
    let report = Array(Set(report)) // O(20만) + O(20만)
    for rp in report { // O(20만)
        let AB = rp.split(separator: " ").map { String($0) }
        let (a, b) = (ID[AB[0]]!, ID[AB[1]]!)
        // a: 신고자, b: 당한사람
        record[b].append(a)
    }
    
    for i in 0..<n { // O(n * n) = O(100만)
        if record[i].count >= k { 
            for reporter in record[i] {
                mail[reporter] += 1    
            }
        }
    }
    
    return mail // 처리 결과 메일을 받은 횟수
}