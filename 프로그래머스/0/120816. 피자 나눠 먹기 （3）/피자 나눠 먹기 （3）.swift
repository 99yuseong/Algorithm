import Foundation

func solution(_ slice:Int, _ n:Int) -> Int {
    var count = 1
    
    while count * slice < n {
        count += 1
    }
    
    return count
}