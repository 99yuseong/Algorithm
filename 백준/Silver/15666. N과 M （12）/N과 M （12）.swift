// N과 M이 주어졌을 때, 길이가 M인 수열을 모두 작성

func solution(_ arr: [Int], _ M: Int) -> [[Int]] {
    // arr의 요소 중 M개를 고른 수열
    // 출력은 사전에서 증가하는 순
    
    // 요소를 유일하게 만든뒤 중복조합
    func repeatedCombi(_ arr: [Int], _ r: Int) -> [[Int]] {

        let arr = Array(Set(arr)).sorted()

        var result: [[Int]] = []
        var cur: [Int] = []
        
        func select(_ k: Int, _ s: Int) {
            
            if k == r {
                result.append(cur)
                return
            }
            
            for i in s..<arr.count {
                cur.append(arr[i])
                select(k+1, i)
                cur.removeLast()
            }
        }
        select(0, 0)
        return result
    }
     
    return repeatedCombi(arr, M)
}

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0]
let M = NM[1]
let A = readLine()!.split(separator: " ").map { Int(String($0))! }
var ANS = ""
for r in solution(A, M) {
    ANS += r.map { String($0) }.joined(separator: " ")
    ANS += "\n" 
}
print(ANS)