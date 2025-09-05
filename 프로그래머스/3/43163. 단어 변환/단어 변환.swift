// begin -> target 변환 
// 몇단계 과정을 거쳐 변환할 수 있는 지를 리턴

// 알파벳 소문자
// 단어: 3~10 길이
// words: 3~50개의 단어, 중복 X
// begin != target
// 변환 불가 시 0을 리턴

// 1. target이 words안에 존재? -> 없으면 0을 리턴
// 2. words를 돌면서 visited가 아닌 상태에서, 1개가 차이나는 지 확인
// 3. 1개 차이나면 진입. count+1
// 4. target과 같으면 return

// -> 단어 2개를 비교해서 다른거 개수가 1개인지를 리턴하는 함수
// -> DFS를 돌아야하네

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    // 1. 변환 조건이 성립이 안되는 경우
    guard words.contains(target) else { return 0 }
    
    // 2. 변환 시도 -> 최소값 카운트
    let N = words.count
    var visited = Array(repeating: false, count: N)
    var result = Int.max
    
    func bfs() {
        var queue: [(Int, String)] = []
        
        queue.append((0, begin))
        
        while !queue.isEmpty {
            
            let cur = queue.removeFirst()
            let curK = cur.0
            let curWord = cur.1
            
            if curWord == target {
                result = curK
                return
            } 
            
            for i in 0..<N {
                if !visited[i] && curWord.canChange(to: words[i]) {
                    queue.append((curK+1, words[i]))
                    visited[i] = true
                }
            }
        }
    }
    
    func dfs(_ k: Int, _ word: String) {
        
        if k > result { return }
        
        if word == target { 
            result = min(result, k)
            return
        }
        
        for i in 0..<N {
            if !visited[i] && word.canChange(to: words[i]) {
                visited[i] = true
                dfs(k+1, words[i])
                visited[i] = false
            }
        }
    }
    
    // dfs(0, begin)
    bfs()
    
    // 3. 변환 가능여부 확인
    return result == Int.max ? 0 : result
}

extension String {
    // 다른 것 개수가 1개인지를 리턴하는 함수 O(N)
    func canChange(to str: String) -> Bool {
        var diff = 0
        let arrA = Array(self)
        let arrB = Array(str)
        
        for i in 0..<self.count {
            diff += arrA[i] != arrB[i] ? 1 : 0
            if diff > 1 { return false }
        }
        
        return diff == 1
    }
}














