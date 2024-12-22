let N = Int(readLine()!)!
// 1~1000이하의 자연수 -> 100개 이하
// N개의 수 중에서 소수가 몇개인가?
// 소수 -> 2~루트 n까지 나눠지는 수가 없으면 소수
// 배열에서 체크 후 + 1
// 체크함수 func isPrime(_ num) { 소수 ? 1 : 0 }

func isPrime(_ num: Int) -> Int {
    if num == 1 {
        return 0
    }
    
    var i = 2
    while i * i <= num {
        if num % i == 0 {
            return 0
        }
        i += 1
    }
    
    return 1
}

print(readLine()!
      .split(separator: " ")
      .map { isPrime(Int($0)!) }
      .reduce(0, +))
