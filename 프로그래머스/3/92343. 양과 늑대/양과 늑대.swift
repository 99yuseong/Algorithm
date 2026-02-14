import Foundation

// 늑대와 양
// BFS/ DFS
    // 늑대 >= 양 = 모두 먹어버린다.
// 잡아먹지 않으면서 최대한 많은 양을 모아 루트로 돌아와라

// 루트는 항상 양
// 0 1 4 

// info
// edges

// 모을수 있는 양은 최대 몇마리인가?

// 2~17
// 0: 양, 1: 늑대
// info[0] = 양

// [부모, 자식]
// 중복 X
// graph: [부모: [자식]]

// BFS가 아니라 DFS로 깊게 들어갔다 나오기로 처리해야함
// 모든 경로를 방문하지 못할 수 있음
// 최댓값을 찾아야함

// Stack으로 처리

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    
    // 1. graph 변환: [부모: [자식]]
    var graph: [Int: [Int]] = [:]
    for edge in edges {
        graph[edge[0], default: []].append(edge[1])
    }
    
    var maxLamb: Int = 1
    var stack: [(lamb: Int, wolf: Int, next:[Int])] = []
    stack.append((lamb: 1, wolf: 0, next: graph[0]!))
    
    // 2. DFS
    while !stack.isEmpty {
        let cur = stack.removeLast()
        
        for child in cur.next {
            let nextNode = child
            let nextLamb = cur.lamb + (info[nextNode] == 0 ? 1 : 0)
            let nextWolf = cur.wolf + (info[nextNode] == 0 ? 0 : 1)
                
            if nextLamb > nextWolf {
                var next = cur.next
                next.removeAll { $0 == nextNode }
                next.append(contentsOf: graph[nextNode, default: []])        
                stack.append((lamb: nextLamb, wolf: nextWolf, next: next))
                if nextLamb > maxLamb { maxLamb = nextLamb }
            }
        }
    }
    
    return maxLamb
}

