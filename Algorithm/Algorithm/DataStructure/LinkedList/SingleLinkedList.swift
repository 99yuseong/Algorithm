//
//  LinkedList.swift
//  Algorithm
//
//  Created by 남유성 on 1/7/24.
//

import Foundation

class SingleNode<T>: CustomStringConvertible, Equatable {
    public var value: T
    public var next: SingleNode?
    
    var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> " + String(describing: next)
    }
    
    init(value: T, next: SingleNode? = nil) {
        self.value = value
        self.next = next
    }
    
    static func == (lhs: SingleNode, rhs: SingleNode) -> Bool {
        return lhs.next == rhs.next
    }
}

class SingleLinkedList<T>: CustomStringConvertible {
    public var head: SingleNode<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    var description: String {
        guard let head = head else { return "Empty list" }
        return String(describing: head)
    }
}

extension SingleLinkedList {
    /// 연결리스트의 특정 인덱스의 노드를 리턴
    /// - Parameter index: 리턴할 인덱스
    /// - Returns: Optional(노드)
    func node(at index: Int) -> SingleNode<T>? {
        if isEmpty {
            return nil
        }
        
        var curNode: SingleNode? = head
        var curIdx: Int = 0
    
        while curNode != nil && curIdx < index {
            curNode = curNode?.next
            curIdx += 1
        }
        
        return curNode
    }
    
    /// 연결리스트의 노드 개수를 구하는 함수
    /// - Returns: 노드 개수
    func count() -> Int {
        var count: Int = 0
        var curNode = head
        
        while curNode != nil {
            curNode = curNode?.next
            count += 1
        }
        
        return count
    }
    
    /// 연결리스트의 맨 앞에 노드 추가
    /// - Parameter value: 추가할 노드의 value
    func push(_ value: T) {
        let newNode = SingleNode(value: value, next: head)
        head = newNode
    }
    
    /// 연결리스트의 맨 뒤에 노드 추가
    /// - Parameter value: 추가할 노드의 value
    func append(_ value: T) {
        if isEmpty {
            head = SingleNode(value: value)
            return
        }
        
        var curNode = head
        while curNode?.next != nil {
            curNode = curNode?.next
        }
        
        curNode?.next = SingleNode(value: value)
    }
    
    /// 연결리스트의 특정 인덱스에 노드 추가
    /// - Parameters:
    ///   - value: 추가할 노드의 value
    ///   - index: 추가할 인덱스의 값
    func insert(_ value: T, after index: Int) {
        if index < 0 || index > count() {
            return
        }
        
        if isEmpty {
            head = SingleNode(value: value)
            return
        }
        
        if let prevNode = node(at: index) {
            prevNode.next = SingleNode(value: value, next: prevNode.next)
        } else {
            push(value)
        }
    }
    
    /// 연결리스트의 맨 앞 노드를 제거
    @discardableResult
    func pop() -> T? {
        defer { // 함수 종료 직전에 실행
            head = head?.next
        }
        return head?.value
    }
    
    /// 연결리스트의 맨 뒤 노드를 제거
    @discardableResult
    func removeLast() -> T? {
        if isEmpty {
            return nil
        }
        
        if head?.next == nil {
            return pop()
        }
        
        var prevNode = head
        var curNode = head
        
        while curNode?.next != nil {
            prevNode = curNode
            curNode = curNode?.next
        }
        
        prevNode?.next = nil
        
        return curNode?.value
    }
    
    /// 연결리스트에서 특정 인덱스의 노드를 삭제합니다.
    /// - Parameter index: 삭제할 노드의 인덱스
    /// - Returns: 삭제한 노드의 값
    @discardableResult
    func remove(after index: Int) -> T? {
        if index < 0 || index >= count() {
            return nil
        }
        
        if isEmpty {
            return pop()
        }
        
        let prevNode = node(at: index)
        defer {
            prevNode?.next = prevNode?.next?.next
        }
        
        return prevNode?.next?.value
    }
    
    
    /// 연결리스트에서 전체 노드를 삭제합니다.
    func removeAll() {
        head = nil
    }
}
