import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    
    var d = 0
    var p = 0
    var move = 0
    
    for i in stride(from: n-1, through: 0, by: -1) {
        
        d += deliveries[i]
        p += pickups[i]
        
        while d > 0 || p > 0 {
            
            d -= cap
            p -= cap
            
            move += (i+1) * 2
        }
    }
    
    return Int64(move)
}