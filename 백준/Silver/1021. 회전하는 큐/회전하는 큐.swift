import Foundation

struct Deque {
    var inBox: [Int] = []
    var outBox: [Int] = []
    var count: Int { inBox.count + outBox.count }
    var isEmpty: Bool { inBox.isEmpty && outBox.isEmpty }
    var front: Int? { inBox.isEmpty ? outBox.first : inBox.last }
    var back: Int? { outBox.isEmpty ? inBox.first : outBox.last }
    mutating func pushFront(_ value: Int) { inBox.append(value) }
    mutating func pushBack(_ value: Int) { outBox.append(value) }
    mutating func popFront() -> Int? {
        if inBox.isEmpty {
            inBox = outBox.reversed()
            outBox.removeAll()
        }
        return inBox.popLast()
    }
    mutating func popBack() -> Int? {
        if outBox.isEmpty {
            outBox = inBox.reversed()
            inBox.removeAll()
        }
        return outBox.popLast()
    }
    func firstIndex(of num: Int) -> Int? {
        let newArr = inBox.reversed() + outBox
        return newArr.firstIndex(of: num)
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let nums = readLine()!.split(separator: " ").map { Int($0)! }

let N = input.first!
let M = input.last!
var deq = Deque()
for i in 1...N {
    deq.pushBack(i)
}
var result = 0

for num in nums {
    let targetIdx = deq.firstIndex(of: num)!
    
    if targetIdx * 2 <= deq.count { // 왼쪽
        for _ in 0..<targetIdx {
            deq.pushBack(deq.popFront()!)
            result += 1
        }
    } else {
        for _ in 0..<deq.count-targetIdx {
            deq.pushFront(deq.popBack()!)
            result += 1
        }
    }
    _ = deq.popFront()
}
print(result)