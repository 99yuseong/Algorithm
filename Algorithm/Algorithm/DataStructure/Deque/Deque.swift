//
//  Deque.swift
//  Algorithm
//
//  Created by 남유성 on 1/11/24.
//

import Foundation

struct Deque<T> {
    private var enqueue: [T] = []
    private var dequeue: [T] = []
    
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    var first: T? {
        return dequeue.isEmpty ? enqueue.first : dequeue.last
    }
    
    var last: T? {
        return enqueue.isEmpty ? dequeue.first : enqueue.last
    }
    
    public mutating func pushFirst(_ n: T) {
        dequeue.append(n)
    }
    
    public mutating func pushLast(_ n: T) {
        enqueue.append(n)
    }
    
    public mutating func popFirst() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
    public mutating func popLast() -> T? {
        if enqueue.isEmpty {
            enqueue = dequeue.reversed()
            dequeue.removeAll()
        }
        return enqueue.popLast()
    }
}
