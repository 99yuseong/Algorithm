// 집합
// 합집합 / 포함 여부

// n, m
// m: 입력 연산의 개수

// 합집합: 0 a b -> a가 포함된 집합과 b가 포함된 집합을 합친다.
// 확인 연산 : 1 a b -> a가 포함된 집합과 b가 포함된 집합이 동일한가? "YES" : "NO"

// [제한사항]
// n: 1~100만
// m: 10만

// union - find

func solution(_ n: Int, _ command: [[Int]]) -> String {
    var ans = ""
    var parent = [Int](repeating: -1, count: n+1)
    func find(_ a: Int) -> Int { 
        if parent[a] < 0 { return a }
        parent[a] = find(parent[a])
        return parent[a]
    }
    
    func union(_ a: Int, _ b: Int) {
        var x = find(a)
        var y = find(b)
        if x == y { return }
        if parent[y] < parent[x] { swap(&x, &y) }
        if parent[x] == parent[y] { parent[x] -= 1 }
        parent[y] = x
    }
    
    for cmd in command {
        if cmd[0] == 0 {
            union(cmd[1], cmd[2])
        }
        
        if cmd[0] == 1 {
            ans += find(cmd[1]) == find(cmd[2]) ? "YES\n" : "NO\n"
        }
    }
    
    return ans
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var command: [[Int]] = []
for _ in 0..<m {
    let cmd = readLine()!.split(separator: " ").map { Int(String($0))! }
    command.append(cmd)
}
print(solution(n, command))
