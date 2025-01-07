let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int($0)! }

var itemX = 1000000001
var itemY = 1000000001
var itemZ = 1000000001

A.sort()

for x in 0..<N {
    for y in (x+1)..<N {
        let lb = lowerBound(st: y+1, x: -A[x]-A[y])
        
        for k in -2...2 {
            let idx = lb + k
            if 0..<N ~= idx && x != idx && y != idx {
                let currentSum = abs(A[x] + A[y] + A[idx])
                let bestSum = abs(itemX + itemY + itemZ)
                if currentSum < bestSum {
                    itemX = A[x]
                    itemY = A[y]
                    itemZ = A[idx]
                }
            }
        }
    }
}

let result = [itemX, itemY, itemZ].sorted()
print(result.map(String.init).joined(separator: " "))

func lowerBound(st: Int, x: Int) -> Int {
    var min = st
    var max = N
    
    while min < max {
        let mid = (min + max) / 2
        
        if A[mid] < x { min = mid + 1 }
        else { max = mid }
    }
    return min
}