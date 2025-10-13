import Foundation

// m명마다 서버1대
// n ~ (n+1) > n대 운영
// k시간 운영후 반납

// 최소 몇번 증설?

// m-1명짜리 기본 서버 + m짜리 추가 서버

// 0~23시 유저 수
// 최대 이용자수 
// 운영시간 k

// 최소 증설 횟수

// m: 1~1천
// k: 1~24시간

// players 돌면서 체크 = cnt++ 
    // loop - 

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    
    var totalAddServer = 0
    var server = [Int](repeating: 0, count: 24)
    
    for i in 0..<24 {
        
        let curPlayer = players[i]
        
        var curServer = server[i] * m + m-1
        var addServer = 0
        
        while curPlayer > curServer { // O(1000)
            curServer += m
            addServer += 1
        }
        
        for j in i..<min(24, i+k) {
            server[j] += addServer
        }
        
        totalAddServer += addServer
    }
    
    return totalAddServer
}