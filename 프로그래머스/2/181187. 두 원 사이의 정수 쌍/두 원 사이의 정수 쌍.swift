import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    print(count(5))
    print(countAtLine(5))
    return count(r2) - count(r1) + countAtLine(r1)
}

func count(_ r: Int) -> Int64 {
    
    if r == 1 { return 5 }
    
    let cnt: Int64 = Int64(r) * 2 + 1 + 2
    var side: Int64 = 0
    
    for i in 1...r-1 {
        var n2 = Double(r * r) - Double(i * i)
        side += 2 * Int64(sqrt(n2)) + 1
    }
    
    return cnt + side * 2
}

func countAtLine(_ r: Int) -> Int64 {

    if r == 1 { return 4 }
    
    var cnt: Int64 = 4
    var side: Int64 = 0
    
    for i in 1...r-1 {
        let n2 = Double(r * r) - Double(i * i)
        var n = round(sqrt(n2))
        if n2 == n * n { side += 2 }
    }
    
    return cnt + side * 2
    
}