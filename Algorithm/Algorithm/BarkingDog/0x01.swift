//
//  main.swift
//  Algorithm
//
//  Created by 남유성 on 2023/08/28.
//

import Foundation

// 문제 1
// N이하의 자연수 중에서 3의 배수이거나 5의 배수인 수를 모두 합한 값을 반환하는
// func1(int N)을 작성하라. N은 5만 이하의 자연수이다.

//for (i, arr) in [16,34567,27639].enumerated() {
//    let test = [60, 278812814, 178254968]
//    print("\(chap1Func1(arr) == test[i])")
//}

func chap1Func1(_ n: Int) -> Int {
    var result = 0
    
    for i in 1...n {
        if i % 15 == 0 {
            result += i
        } else if i % 5 == 0 {
            result += i
        } else if i % 3 == 0 {
            result += i
        }
    }
    return result
}

// 문제 2
// 주어진 길이 N의 int 배열 arr에서 합이 100인 서로 다른 위치의 두 원소가 존재하면 1을,
// 존재하지 않으면 0을 반환하는 함수 func2(_ arr: [Int]) -> Int를 작성하라.
// arr의 각 수는 0이상 100이하이고 N은 1000이하다.

//for arr in [[1,52,48], [50,42], [4,13,63,87]] {
//    print("\(chap1Func2(arr))")
//}

func chap1Func2(_ arr: [Int]) -> Int {
//    for i in 0..<arr.count {
//        for j in i + 1..<arr.count {
//            if arr[i] + arr[j] == 100 {
//                return 1
//            }
//        }
//    }
//    return 0
    var arr2 = [Int](repeating: 0, count: 101)
    for i in arr {
        if arr2[100 - i] == 1 {
            return 1
        } else {
            arr2[i] += 1
        }
    }
    return 0
}

// 문제 3
// N이 제곱수이면 1을 반환하고 제곱수가 아니면 0을 반환하는 함수 func3(_ n: Int) -> Int를 작성하라
// N은 10억 이하의 자연수이다.

//for n in [9, 693953651, 756580036] {
//    print("\(chap1Func3(n))")
//}

func chap1Func3(_ n: Int) -> Int {
    let sqrtN: Int = Int(sqrt(Double(n)))
    for i in 1...sqrtN {
        if i * i == n {
            return 1
        }
    }
    return 0
}

// 문제 4
// N이하의 수 중에서 가장 큰 2의 거듭제곱수를 반환하는 함수 func4(_ n: Int) -> Int를 작성하라.
// N은 10억 이하의 자연수이다.

//for n in [5, 97615282, 1024] {
//    print("\(chap1func4(n))")
//}

func chap1func4(_ n: Int) -> Int {
    var result: Int = 0
    
    while Int(pow(2.0, Float(result))) <= n / 2 {
        result += 1
    }
    
    return Int(pow(2.0, Float(result)))
}
