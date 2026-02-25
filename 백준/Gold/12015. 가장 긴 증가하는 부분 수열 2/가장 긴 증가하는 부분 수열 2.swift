import Foundation

func solution(_ A: [Int]) -> Int {
    var tails: [Int] = []

    for x in A {
        var st = 0
        var en = tails.count

        // lower_bound: first index where tails[idx] >= x
        while st < en {
            let mid = (st + en) / 2
            if tails[mid] >= x {
                en = mid
            } else {
                st = mid + 1
            }
        }

        if st == tails.count {
            tails.append(x)
        } else {
            tails[st] = x
        }
    }

    return tails.count
}

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
print(solution(A))