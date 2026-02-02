import Foundation

// 다양한 선수 우승

// 라이언이 불리하게

// 어피치 n발 > 라이언 n발

// k(1~10)점을 어피치 a발, 라이언 b발 > 더 큰 쪽이 딱 k점을 가져감. (비기면 어피치)


// 라이언이 가장 큰 점수 차이로 이기려면? 

// n: 화살의 개수
// 10점 ~ 0점 배열 info

// 10 ~ 0점 배열을 리턴 - 우승할 수 없는 경우 [-1]


// 제한 사항
// n: 1~10
// info.count: 11

// [!]
// 가장 큰 점수차 방법 여러가지 => 가장 낮은 점수를 더 많이 맞힌 경우를 return
// 우승 불가능 => [-1]

// [2,3,1,0,0,0,0,1,3,0,0]
// [2,1,0,2,0,0,0,2,3,0,0] - 리턴
//                *

// [0,0,2,3,4,1,0,0,0,0,0]
// [9,0,0,0,0,0,0,0,1,0,0] - 리턴
//                  *

// 풀이

// 이건 백트래킹인데.
// 해당 과녁을 이김(k+1발을 쏨) vs 해당 과녁을 짐 (0발)

// func dfs(_ k: Int, _ n: Int, _ score: Int) - k는 과녁, n은 남은 화살, score는 점수


func solution(_ n:Int, _ info:[Int]) -> [Int] {
    
    func dfs(_ k: Int, _ n: Int, _ scoreA: Int, _ scoreL: Int) {
        
        if k == 11 { 
            // 스코어 비교, 배열 업데이트
            // 가능한 배열 추가
            if scoreL > scoreA {
                let diff = scoreL - scoreA
                var curArr = arr
                curArr[10] += n
                
                if diff > maxDiff {
                    maxDiff = diff
                    ans = curArr
                
                } else if diff == maxDiff {
                    for i in (0...10).reversed() {
                        if curArr[i] > ans[i] { 
                            ans = curArr
                            return        
                        } else if curArr[i] < ans[i] {
                            return
                        }
                    }
                }
            }
            return
        }
        
        // 해당 과녁을 이김
        if n >= info[k]+1 {
            arr.append(info[k]+1)
            dfs(k+1, n-(info[k]+1), scoreA, scoreL+10-k)
            arr.removeLast()
        }
        
        // 해당 과녁을 안이김
        arr.append(0)
        if info[k] > 0 {
            dfs(k+1, n, scoreA+10-k, scoreL)
        } else {
            dfs(k+1, n, scoreA, scoreL)   
        }
        arr.removeLast()
    }
    
    var maxDiff = 0
    var arr: [Int] = []
    var ans: [Int] = [-1]
    dfs(0, n, 0, 0)
    
    return ans
}
