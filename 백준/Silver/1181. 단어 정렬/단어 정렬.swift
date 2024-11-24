let N = Int(readLine()!)! // 1 <= N <= 20000 -> N^2 LogN
var arr: [String] = []

for _ in 0..<N {
    arr.append(readLine()!)
}

arr = Array(Set(arr)).sorted() // 1개씩 사전순으로 정렬
arr.sort(by: { $0.count < $1.count })

for item in arr {
    print(item)
}

// 길이가 짧은 순 부터
// 길이가 같다면 사전 순
// 중복은 1개만
