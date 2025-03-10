// 크기가 3*3인 배열 A (1,1) 부터 시작한다.
// 1초마다 배열에 연산 적용
// R -> 모든 행에 대해 정렬 수행. 행 >= 열인 경우 적용
// C -> 모든 열에 대해 정렬 수행. 행 < 열인 경우 적용

// 1. 각 수가 몇번 나왔는 지 확인
// 2. 수의 등장 횟수가 커지는 순서로, 수가 커지는 순으로 정렬
//   1 1 2 2 2 3 3 3 4 4 4 4
// 수와 등장 횟수를 넣으며, 수, 등장횟수
// 3 1 1
// 3 1 1 2 - 3이 1번, 1이 2번
// 2 1 3 1 1 2 - 2가 1번, 3이 1번, 1이 2번

// 3. R연산 후에는 큰 행을 기준으로 모든 행의 크기가 변하고
// 4. C연산 후에는 큰 열을 기준으로 모든 열의 크기가 변한다.
// 커진 곳에는 0이 채워진다.
// 수를 정렬할 때 0은 무시해야한다.

// 행, 열이 100을 넘어가면 100개를 제외한 나머지는 버린다.
// A는 1~100 자연수 -> 3*3으로 주어지고, r과 c는 더 큰 수 일 수 있다.
// A[r][c] = k가 되기 위한 최소 시간
func solution(_ r: Int, _ c: Int, _ k: Int, _ A: [[Int]]) -> Int {
    // 1. 우선 101 * 101 배열 만들고 A 채우기
    // 2. R = 3, C = 3, time = 0
    // 3-0. r <= R. c <= C 여부 확인
    //     - true -> time 리턴
    //     - false -> loop
    // 3-1. R <= C -> 행 정렬
    //     - 배열로 카운트 & 정렬
    //     - flatMap으로 합치기
    //     - 배열 채우기
    // 3-2. R > C -> 열 정렬
    // 3-3. time += 1
    
    var Arr = Array(repeating: Array(repeating: 0, count: 100), count: 100)
    for i in 0..<3 {
        for j in 0..<3 {
            Arr[i][j] = A[i][j]
        }
    }
    
    var R = 3
    var C = 3
    var T = 0
    
    func operateR() {
        var maxC = 0
        var newArr = Array(repeating: Array(repeating: 0, count: 100), count: 100)
        
        for i in 0..<R {
            var cntDict: [Int:Int] = [:]
            
            for j in 0..<C {
                if Arr[i][j] == 0 { continue }
                if cntDict[Arr[i][j]] == nil { cntDict[Arr[i][j]] = 1 }
                else { cntDict[Arr[i][j]]! += 1 }
            }
            
            let sorted = cntDict.sorted {
                $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value
            }
            
            var j = 0
            for (num, cnt) in sorted {
                newArr[i][j] = num
                newArr[i][j+1] = cnt
                j += 2
                if j >= 100 { break }
            }
            
            maxC = max(maxC, j)
        }
        
        Arr = newArr
        C = min(100, maxC)
    }
    func operateC() {
        var maxR = 0
        var newArr = Array(repeating: Array(repeating: 0, count: 100), count: 100)
        
        for j in 0..<C {
            var cntDict: [Int:Int] = [:]
            
            for i in 0..<R {
                if Arr[i][j] == 0 { continue }
                if cntDict[Arr[i][j]] == nil { cntDict[Arr[i][j]] = 1 }
                else { cntDict[Arr[i][j]]! += 1 }
            }
            
            let sorted = cntDict.sorted {
                $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value
            }
            
            var i = 0
            for (num, cnt) in sorted {
                newArr[i][j] = num
                newArr[i+1][j] = cnt
                i += 2
                if i >= 100 { break }
            }
            
            maxR = max(maxR, i)
        }
        
        Arr = newArr
        R = maxR
    }
    
    while true {
        if T > 100 { return -1 }
        if Arr[r-1][c-1] == k { return T }
        
        if R >= C {
            operateR()
        } else {
            operateC()
        }
        
        T += 1
    }
}

let rck = readLine()!.split(separator: " ").map { Int($0)! }
let r = rck[0]
let c = rck[1]
let k = rck[2]
var A: [[Int]] = []
for _ in 0..<3 {
    A.append(readLine()!.split(separator: " ").map { Int($0)! })
}
print(solution(r, c, k, A))
