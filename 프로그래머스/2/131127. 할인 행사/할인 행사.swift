import Foundation

// 10일 회원권
// 매일 1개씩 할인 & 구매 가능

// 치킨, 사과, 사과, 바나나, 쌀
// 사과, 돼지고기, 바나나, 돼지고기, 쌀
// 냄비, 바나나, 사과, 바나나

// 슬라이딩 윈도우 문제

// 길이는 10 ~ 10만



func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    
    var wants: [String: Int] = [:]
    var canBuy: [String: Int] = [:]
    
    for i in 0..<want.count {
        wants[want[i]] = number[i]
    }
    
    for i in 0..<10 {
        canBuy[discount[i], default: 0] += 1
    }
    
    var canRegisterCount = canBuy == wants ? 1 : 0
    
    for i in 10..<discount.count {
        
        if canBuy[discount[i-10], default: 0] == 1 {
            canBuy[discount[i-10]] = nil
        } else {
            canBuy[discount[i-10], default: 0] -= 1    
        }
        
        canBuy[discount[i], default: 0] += 1
        
        if canBuy == wants { 
            canRegisterCount += 1 
        }
    }
    
    return canRegisterCount
}