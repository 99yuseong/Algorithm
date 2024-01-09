//
//  0x05Stack.swift
//  Algorithm
//
//  Created by 남유성 on 1/9/24.
//

import Foundation

// 사실 굳이 구현할 필요 없이
// 배열의 append와 popLast()!를 이용해서 사용해도 무방

struct _Stack<T> {
    var data: [T] = []
    var pos: Int = -1
    
    var isEmpty: Bool {
        return pos == -1
    }
    
    mutating func push(_ item: T) {
        data.append(item)
        pos += 1
    }
    
    mutating func pop() -> T? {
        if isEmpty {
            return nil
        }
        
        defer {
            pos -= 1
        }
        
        return data.removeLast()
    }
    
    func top() -> T? {
        if isEmpty {
            return nil
        }
        
        return data[pos]
    }
    
}
