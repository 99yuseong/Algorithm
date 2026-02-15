import Foundation

// 양의 정수 k, d

// k: 1~100만
// d: 1~100만

// for loop 0 ~ d 

func solution(_ k:Int, _ d:Int) -> Int64 {
    
    var points = 0
    
    for i in stride(from: 0, through: d, by: k) {
        let h = sqrt(Double(d*d-i*i))
        points += Int(h) / k + 1
    }

    return Int64(points)
}