import Foundation

func solution(_ chicken:Int) -> Int {
    var curChicken = chicken
    var result = 0
    
    while  curChicken >= 10 {
        result += curChicken / 10
        curChicken = curChicken / 10 + curChicken % 10
    }
    
    return result
}