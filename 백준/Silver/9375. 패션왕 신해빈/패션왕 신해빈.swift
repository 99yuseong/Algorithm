// 1초
// 128MB -> 1600만 Int 배열

// 테스트 케이스 100개
// 의상 수 n: 0~30종류
// 이름, 종류 (같은 종류의 의상 1개만 입을 수 있다.)

// Dictionary에 D[input] = D[input] ?? 0 + 1

// 100 * 30개의 의상
let T = Int(readLine()!)!

for _ in 0..<T {
    let N = Int(readLine()!)!
    var D = [String: Int]()
    
    for _ in 0..<N {
        let input = readLine()!.split(separator: " ").map { String($0) }
        D[input[1]] = (D[input[1]] ?? 0) + 1
    }
    
    var ans = 1
    for (_, cnt) in D {
        ans *= (cnt + 1)
    }
    print(ans - 1)
}
