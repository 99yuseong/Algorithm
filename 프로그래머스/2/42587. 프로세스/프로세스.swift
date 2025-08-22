// 특정 프로세스가 몇번째로 실행?

// 큐 -> 선입선출
// 우선순위큐 - 우선순위(location)

// N = 100
// 우선순위 1 ~ 9, 숫자가 클수록 우선순위 높음
// location - index

// location(index)에 위치하는 우선순위(priorities[index])가 언제 실행되는가?

// 1. 반복문을 돌면서 맨 처음값보다 우선순위가 높은게 있는 지 찾음
// 2. 없으면 빼서 맨뒤로 보냄
// 3. 있으면 제거

// Deck

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var queue: [Int] = []
    var result = 1
    var target = location
    
    queue.append(contentsOf: priorities)
    
    while !queue.isEmpty {
        print(queue)
        let cur = queue.first!
        
        if let p = queue.firstIndex(where: { cur < $0 }) {
            queue.removeFirst()
            queue.append(cur)
            target = target == 0 ? queue.count - 1 : target - 1  
        } else {
            queue.removeFirst()
            if target == 0 { return result } 
            target -= 1
            result += 1
        }
    }
    
    return result
}

