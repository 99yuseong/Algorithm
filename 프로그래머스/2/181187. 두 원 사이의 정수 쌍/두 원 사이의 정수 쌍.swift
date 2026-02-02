import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    return countInCircle(r2) - countInCircle(r1) + countAtLine(r1)
}

func countInCircle(_ r: Int) -> Int64 {
    
    if r == 1 { return 5 }
    
    let center = r * 2 + 1
    var side = 0
    
    for i in 1...r-1 {
        var n2 = Double(r * r) - Double(i * i)
        side += 2 * Int(sqrt(n2)) + 1
    }
    side += 1
    
    return Int64(center + side * 2)
}

func countAtLine(_ r: Int) -> Int64 {

    if r == 1 { return 4 }
    
    var center = 2
    var side = 0
    
    for i in 1...r-1 {
        let n2 = Double(r * r) - Double(i * i)
        var n = Int(sqrt(n2))
        if Int(n2) == n * n { side += 2 }
    }
    side += 1
    
    return Int64(center + side * 2)
    
}