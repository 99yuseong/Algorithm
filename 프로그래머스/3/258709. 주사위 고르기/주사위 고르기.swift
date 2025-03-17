import Foundation

func solution(_ dice:[[Int]]) -> [Int] {
    let n = dice.count
    var maxWin = -1
    var maxCombi: [Int] = []
    
    let allCombi = getCombinations(of: Array(0..<n), n/2)
    
    for combi in allCombi {
        
        let A = combi
        let B = Array(Set(0..<n).subtracting(A))
        
        let sumsA = getSum(of: A, dice: dice)
        let sumsB = getSum(of: B, dice: dice).sorted()
        
        var win = 0
        for sumA in sumsA {
            win += lowerBound(of: sumsB, target: sumA)
        }
        
        if win > maxWin {
            maxWin = win
            maxCombi = combi
        }
    }
    
    return maxCombi.map { $0 + 1 }
}

func lowerBound(of arr: [Int], target: Int) -> Int {
    var st = 0
    var en = arr.count
    
    while st < en {
        let mid = (st + en) / 2
        
        if arr[mid] < target { st = mid + 1 }
        else { en = mid }
    }
    
    return st
}

func getSum(of arr: [Int], dice: [[Int]]) -> [Int] {
    // arr: 선택한 주사위의 인덱스 배열
    var sums: [Int] = [] // 여기에 나올 수 있는 눈의 합의 모든 경우의 수
    
    var curDices: [[Int]] = []
    for idx in arr { curDices.append(dice[idx]) }
    
    var sum = 0
    func permu(_ n: Int) {
        if n == curDices.count {
            sums.append(sum)
            return
        }
        
        for i in 0..<6 {
            sum += curDices[n][i]
            permu(n+1)
            sum -= curDices[n][i]
        }
    }
    permu(0)
    
    return sums
}

func getCombinations<T>(of elements: [T], _ k: Int) -> [[T]] {
    var results: [[T]] = []
    
    var selected: [T] = []
    func comb(_ n: Int, _ start: Int) {
        if n == k {
            results.append(selected)
            return
        }
        
        for i in start..<elements.count {
            selected.append(elements[i])
            comb(n+1, i+1)
            selected.removeLast()
        }
    }
    comb(0,0)
    
    return results
}