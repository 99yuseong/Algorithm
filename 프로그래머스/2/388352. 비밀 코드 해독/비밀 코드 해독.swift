import Foundation

// 해독

// 서로 다른 자연수 오름차순 비밀코드
// m번의 시도
// 몇개가 비밀코드에 포함되어 있는지

// 3 5 7 9 10
// 1 2 3 4 5
// 응답 2

// 정수 n: 10~30
// 입력 q: count: 1~10
// 응답 ans

// return 가능한 조합 개수

// m: 1~10

// 5가지 숫자를 10번

// q를 돌면서
    // selectedSet 포함된 것 카운트
    // 포함되지 않은 것 중 ans - selectedSet.count를 선택

func combi(_ arr: [Int], _ k: Int) -> [[Int]] {
    
    var allCases = [[Int]]()
    var selected = [Int]()
    
    func dfs(_ a: Int, _ start: Int) {
        
        if a == k { 
            allCases.append(selected)
            return
        }
        
        for i in start..<arr.count {
            selected.append(arr[i])
            dfs(a+1, i+1)
            selected.removeLast()
        }
    }
    dfs(0, 0)
    
    return allCases
}

func solution(_ n:Int, _ q:[[Int]], _ ans:[Int]) -> Int {
    
    let m = q.count
    let allCombi = combi(Array(1...n), 5)
    var allCases = 0
    
    out: for combi in allCombi {
        
        for i in 0..<m {
            let curTry = Set(q[i])
            var ans = ans[i]
            
            for item in combi { 
                if curTry.contains(item) { 
                    ans -= 1 
                } 
            }
            
            if ans != 0 {
                continue out
            }
        }
        
        allCases += 1
    }
    
    return allCases
}