// 1초
// 백만 * 100개
// 100C2 -> 4950개

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    }
    
    return gcd(b, a % b)
}

let N = Int(readLine()!)!

for _ in 0..<N {
    var ans = 0
    
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    
    for i in 1..<arr.count-1 {
        for j in i+1..<arr.count {
            ans += arr[i] > arr[j] ? gcd(arr[i],arr[j]) : gcd(arr[j], arr[i])
        }
    }
    
    print(ans)
}
