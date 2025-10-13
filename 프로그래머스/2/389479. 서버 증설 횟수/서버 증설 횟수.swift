import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    
    var totalAddServer = 0
    var server = [Int](repeating: 0, count: 24)
    
    for i in 0..<24 { // O(24)
        
        var curlimit = (m - 1) + m * server[i]
        
        let need = max(0, (players[i] - curlimit + m - 1) / m)
        
        for j in i..<min(24, i+k) { // O(k)
            server[j] += need
        }
        
        totalAddServer += need
    }
    
    return totalAddServer
}