import Foundation

let n = Int(readLine()!)!
var numbers: [Int] = []

for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}

// 배열 정렬
numbers.sort()

// 두 수의 합 저장
var twoSums = Set<Int>()
for i in 0..<n {
    for j in i..<n {
        twoSums.insert(numbers[i] + numbers[j])
    }
}

// 결과 값 계산
var result = Int.min
for k in stride(from: n - 1, through: 0, by: -1) {
    for c in 0..<k {
        if twoSums.contains(numbers[k] - numbers[c]) {
            result = max(result, numbers[k])
        }
    }
}

print(result)