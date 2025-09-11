import Foundation

// N: 1~9
// number: 32000
// + - * /
// 8이상이면 -1을 리턴

// SET[1]과 SET[1]의 사칙연산

// D[i]: i개의 N으로 만들 수 있는 경우의 수
// D[i] = 1 + SET[D[1] +-*/D[i-1]] ... + SET[D[i-1] +-*/ D[1]]

func solution(_ N:Int, _ number:Int) -> Int {
    
    var D = [Set<Int>](repeating: [], count: 9)
    
    // 초기값 입력
    D[1].insert(N)
    
    for i in 2...8 {
        // 1. N이 i번 연속
        D[i].insert(repeating(N, cnt: i))
        
        // 2. 1부터 i-1까지의 조합
        for j in 1..<i {
            D[i].insertCombi(D[j], D[i-j])
        }
    }
    
    for i in 1...8 {
        if D[i].contains(number) { return i }
    }
    
    return -1
}

func repeating(_ N: Int, cnt: Int) -> Int {
    var num = (0..<cnt)
        .map { _ in "1" }
        .joined()
    
    return Int(num)! * N
}

extension Set where Element == Int {
    mutating func insertCombi(_ setA: Set<Int>, _ setB: Set<Int>) {
        for a in setA {
            for b in setB {
                self.insert(a + b)
                self.insert(a - b)
                self.insert(a * b)
                if b != 0 {
                    self.insert(a / b)   
                }
            }
        }
    }
}
