import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    // 이기려면 b는 a보다 크면서 최대한 작아야한다.
    // 안된다면 b는 가장 작아야한다.
    
    var a = a.sorted()
    var b = b.sorted()
    
    [1, 3, 5, 7]
    [2, 2, 6, 8]
    
    // b는 질때 가장 낮은 수로 지고, 이길때 가장 낮은 수로 이겨야한다.
    
    // b의 인원을 다 소모했을떄, a에게 이길 수 있는 횟수가 몇번인가
    
    var win = 0
    
    var aIdx = 0
    var bIdx = 0
    
    while bIdx < b.count {
        if b[bIdx] > a[aIdx] {
            win += 1
            bIdx += 1
            aIdx += 1
        } else {
            bIdx += 1
        }
    }
    
    return win
}