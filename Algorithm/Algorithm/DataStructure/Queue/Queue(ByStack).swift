//
//  Queue.swift
//  Algorithm
//
//  Created by 남유성 on 1/10/24.
//

import Foundation

struct Queue<T> {
    private var inBox: [T] = []
    private var outBox: [T] = []
    
    public var isEmpty: Bool {
        return inBox.isEmpty && outBox.isEmpty
    }
    
    public var count: Int {
        return inBox.count + outBox.count
    }
    
    mutating public func enqueue(_ data: T) {
        inBox.append(data)
    }
    
    mutating public func dequeue() -> T? {
        if outBox.isEmpty {
            outBox = inBox.reversed()
            inBox.removeAll()
        }
        return outBox.popLast()
    }
    
    public func front() -> T? {
        return outBox.isEmpty ? inBox.first : outBox.last
    }
    
    public func back() -> T? {
        return inBox.isEmpty ? outBox.first : inBox.last
    }
}
