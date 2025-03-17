import Foundation

// 주어진 주사위 배열 dices: 각 주사위는 [Int] (6면의 값)입니다.
func solution(_ dices: [[Int]]) -> [Int] {
    let n = dices.count
    let half = n / 2
    var bestWins = -1
    var bestCombination: [Int] = []
    
    // 0부터 n-1까지 dice 인덱스 중, n/2개를 선택하는 모든 조합 생성
    let allCombinations = getCombinations(Array(0..<n), half)
    
    for combination in allCombinations {
        // A가 선택한 주사위 인덱스: combination
        // B는 나머지 주사위 인덱스
        let setA = combination
        let setB = Array(Set(0..<n).subtracting(setA))
        
        // A와 B가 선택한 주사위로 나올 수 있는 모든 합 계산
        let sumsA = getSums(for: setA, dices: dices)
        let sumsB = getSums(for: setB, dices: dices).sorted()
        
        // A의 각 합에 대해, B의 합 중 A의 합보다 작은 값의 개수를 이분 탐색으로 찾기
        var wins = 0
        for sumA in sumsA {
            let count = lowerBound(in: sumsB, target: sumA)
            wins += count
        }
        
        // 최대 승리 경우를 갱신
        if wins > bestWins {
            bestWins = wins
            bestCombination = combination
        }
    }
    
    // 문제에서 요구하는 출력은 1-indexed이므로 변환하여 반환
    return bestCombination.map { $0 + 1 }
}

// MARK: - 조합 생성 (elements 배열에서 k개를 뽑는 모든 조합)
func getCombinations<T>(_ elements: [T], _ k: Int) -> [[T]] {
    var result: [[T]] = []
    func comb(_ start: Int, _ current: [T]) {
        if current.count == k {
            result.append(current)
            return
        }
        for i in start..<elements.count {
            comb(i + 1, current + [elements[i]])
        }
    }
    comb(0, [])
    return result
}

// MARK: - 주어진 dice 인덱스들에 대해 모든 가능한 주사위 합을 구하는 함수
func getSums(for indices: [Int], dices: [[Int]]) -> [Int] {
    var sums: [Int] = []
    func helper(_ index: Int, _ currentSum: Int) {
        if index == indices.count {
            sums.append(currentSum)
            return
        }
        let dieIndex = indices[index]
        // 각 주사위의 6면에 대해 재귀적으로 합 계산
        for face in dices[dieIndex] {
            helper(index + 1, currentSum + face)
        }
    }
    helper(0, 0)
    return sums
}

// MARK: - 이분 탐색: 정렬된 배열에서 target보다 작은 원소의 개수를 찾는 함수
func lowerBound(in array: [Int], target: Int) -> Int {
    var lo = 0, hi = array.count
    while lo < hi {
        let mid = (lo + hi) / 2
        if array[mid] < target {
            lo = mid + 1
        } else {
            hi = mid
        }
    }
    return lo
}