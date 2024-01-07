//
//  0x03Array.swift
//  Algorithm
//
//  Created by 남유성 on 1/6/24.
//

import Foundation

func insert(idx: Int, num: Int, arr: inout [Int], len: Int) {
    arr.append(0)
    
    for i in stride(from: len - 1, through: idx, by: -1) {
        arr[i + 1] = arr[i]
    }
    
    arr[idx] = num
}

func erase(idx: Int, arr: inout [Int], len: Int) {
    for i in idx..<len - 1 {
        arr[i] = arr[i + 1]
    }
    arr.removeLast()
}

func insert_test() {
    print("***** insert_test *****")
    var arr = [10, 20, 30]
    insert(idx: 3, num: 40, arr: &arr, len: arr.count)
    printArr(arr: arr)
    insert(idx: 1, num: 50, arr: &arr, len: arr.count)
    printArr(arr: arr)
    insert(idx: 0, num: 15, arr: &arr, len: arr.count)
    printArr(arr: arr)
}

func erase_test() {
    print("***** erase_test *****")
    var arr = [10, 50, 40, 30, 70, 20]
    erase(idx: 4, arr: &arr, len: arr.count)
    printArr(arr: arr)
    erase(idx: 1, arr: &arr, len: arr.count)
    printArr(arr: arr)
    erase(idx: 3, arr: &arr, len: arr.count)
    printArr(arr: arr)
}

func printArr(arr: [Int]) {
    print("\(arr.map { String($0) }.joined(separator: " "))")
}
