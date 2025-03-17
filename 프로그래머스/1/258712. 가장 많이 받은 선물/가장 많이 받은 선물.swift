import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    let F = Dictionary(uniqueKeysWithValues: friends.enumerated().map { ($1, $0) })
    let n = friends.count
    
    var G = Array(repeating: Array(repeating: 0, count: n), count: n)
    var S = Dictionary(uniqueKeysWithValues: friends.map { ($0, 0) })
    
    for gift in gifts {
        let AB = gift.split(separator: " ").map { String($0) }
        let (A, B) = (AB[0], AB[1])
        let (a, b) = (F[A]!, F[B]!)
        
        G[a][b] += 1
        S[A, default: 0] += 1
        S[B, default: 0] -= 1
    }
    
    var curGifts = Array(repeating: 0, count: n)
    
    for i in 0..<n {
        for j in i+1..<n {
            let (A, B) = (friends[i], friends[j])
            let (a, b) = (F[A]!, F[B]!)
            
            if G[a][b] > G[b][a] {
                curGifts[a] += 1
            } else if G[a][b] < G[b][a] {
                curGifts[b] += 1
            } else if S[A]! > S[B]! {
                curGifts[a] += 1
            } else if S[B]! > S[A]! {
                curGifts[b] += 1
            }
        }
    }
    
    return curGifts.max()!
}