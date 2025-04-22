import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    // 0. 초기화
    // mySet
    // winSet
    // minRate
    let mySet = Set(lottos)
    let winSet = Set(win_nums)
    var minRate = 6
    var maxRate = 6

    // 1. minRate
    let sameCnt = mySet.intersection(winSet).count
    if sameCnt >= 2 { minRate = 7 - sameCnt }
    
    // 2. maxRate
    let leftCnt = winSet.subtracting(mySet).count
    let zeroCnt = lottos.filter { $0 == 0 }.count
    
    let moreCnt = sameCnt + min(zeroCnt, leftCnt)
    if moreCnt >= 2 { 
        maxRate = 7 - moreCnt 
    }
    
    // 3. return [minRate, minRate - more]
    return [maxRate, minRate]
}

// 구매한 로또번호 - lottos
// 당첨번호 - win_nums
// 가능한 최고 순위와 최저 순위를 배열로 리턴

// 일부가 가려져있다
// 0이 가려진것

// 44, 1, 0, 0, 31 25

// 31, 10, 45, 1, 6, 19


// 31, 1

// 10, 45, 6, 19 
