import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    // n개의 송전탑이 연결된 상태
    // 1개만 끊어서 최대한 비슷한 수가 되도록 2그룹으로 나누자
    // 차이의 절댓값을 리턴
    
    // n: 2~100개의 송전탑
    // wires: 1~99개의 선
    
    // 연결된 송전탑 수 세기 -> BFS 이용 O(n)
    // 어떤 걸 잘라야 차이가 최소가 되는가...? -> n-1개를 돌아가면서 잘라봐야할 듯
    // BFS를 n-1번 체크한 최솟값 -> O(n^2)
    
    var graph: [[Int]] = Array(repeating: [], count: n+1)
    var result = n-1
    
    for wire in wires {
        graph[wire[0]].append(wire[1])
        graph[wire[1]].append(wire[0])
    }
    
    // 1개를 잘랐을때 연결된 송전탑의 개수를 리턴하는 함수
    func bfs(_ st: Int, _ wire: [Int]) -> Int {
        var visited = Set<Int>()
        var queue = [st]
        visited.insert(st)
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            
            for near in graph[cur] {
                if (near == wire[0] && cur == wire[1]) || (near == wire[1] && cur == wire[0]) { continue }
                
                if !visited.contains(near) {
                    queue.append(near)
                    visited.insert(near)
                }
            }
        }
        
        return visited.count
    }
    
    for wire in wires {
        let cntA = bfs(wire[0], wire)
        let cntB = n - cntA
        
        result = min(result, abs(cntA - cntB))
    }
    
    return result
}