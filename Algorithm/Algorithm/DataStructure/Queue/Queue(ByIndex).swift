//
//  Queue(ByIndex).swift
//  Algorithm
//
//  Created by 남유성 on 1/10/24.
//

import Foundation

struct Queue2<T> {
    private var queue: [T] = []
    private var index: Int = 0
    
    public var isEmpty: Bool {
        return queue.count == index
    }
    
    public var count: Int {
        return queue.count - index
    }
    
    mutating public func enqueue(_ data: T) {
        queue.append(data)
    }
    
    mutating public func dequeue() -> T? {
        if self.isEmpty {
            return nil
        }
        
        defer {
            index += 1
        }
        
        return queue[index]
    }
    
    public func front() -> T? {
        return self.isEmpty ? nil : queue[index]
    }
    
    public func back() -> T? {
        return queue.last
    }
}
