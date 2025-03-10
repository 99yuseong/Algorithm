import Foundation

func solution() {
    var arr = Array(repeating: Array(repeating: 0, count: 100), count: 100)
    var rck = readLine()!.split(separator: " ").map { Int($0)! }
    let (r, c, k) = (rck[0] - 1, rck[1] - 1, rck[2]) // 0-based index로 변환
    
    var rowSize = 3
    var colSize = 3
    var time = 0
    
    // 초기 배열 입력
    for i in 0..<3 {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        for j in 0..<input.count {
            arr[i][j] = input[j]
        }
    }
    
    func operateR() {
        var maxCol = 0
        var newArr = Array(repeating: Array(repeating: 0, count: 100), count: 100)
        
        for i in 0..<rowSize {
            var countDict = [Int: Int]()
            
            for j in 0..<colSize {
                if arr[i][j] == 0 { continue }
                countDict[arr[i][j], default: 0] += 1
            }
            
            var sortedArr = countDict.sorted { 
                if $0.value == $1.value { return $0.key < $1.key }
                return $0.value < $1.value
            }
            
            var idx = 0
            for (num, cnt) in sortedArr {
                newArr[i][idx] = num
                newArr[i][idx + 1] = cnt
                idx += 2
                if idx >= 100 { break }
            }
            
            maxCol = max(maxCol, idx)
        }
        
        arr = newArr
        colSize = maxCol
    }
    
    func operateC() {
        var maxRow = 0
        var newArr = Array(repeating: Array(repeating: 0, count: 100), count: 100)
        
        for j in 0..<colSize {
            var countDict = [Int: Int]()
            
            for i in 0..<rowSize {
                if arr[i][j] == 0 { continue }
                countDict[arr[i][j], default: 0] += 1
            }
            
            var sortedArr = countDict.sorted {
                if $0.value == $1.value { return $0.key < $1.key }
                return $0.value < $1.value
            }
            
            var idx = 0
            for (num, cnt) in sortedArr {
                newArr[idx][j] = num
                newArr[idx + 1][j] = cnt
                idx += 2
                if idx >= 100 { break }
            }
            
            maxRow = max(maxRow, idx)
        }
        
        arr = newArr
        rowSize = maxRow
    }
    
    while time <= 100 {
        if r < rowSize && c < colSize && arr[r][c] == k {
            print(time)
            return
        }
        
        if rowSize >= colSize {
            operateR()
        } else {
            operateC()
        }
        
        time += 1
    }
    
    print(-1)
}

solution()