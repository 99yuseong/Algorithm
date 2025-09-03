// n: 2~100만
// k: 1~100만
// k < n (무조건 1개는 남는다.)
// Int로 변환하면 무조건 터짐

// O(N) or O(NlgN) 안쪽으로

// 큰 수 = 맨 앞 자리가 크면 클수록

// 앞에 k개 중 max1
// k - max1의 idx를 하고 반복
// 최악의 경우, O(k^2)

// stack
// []
// []

// [1] 9 - 2 - 4
// 첫 값을 넣고, 
// number를 돌면서 자기보다 큰 가
// 자기보다 큰 값을 

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    
    let n = number.count
    var stack: [Int] = []
    var removeCnt = 0
    
    for num in number {
        let num = Int(String(num))!
        
        while !stack.isEmpty && num > stack.last! && k > removeCnt {
            stack.removeLast()
            removeCnt += 1
        }
        stack.append(num) 
    }
    
    return stack.prefix(n-k).map { String($0) }.joined()
}