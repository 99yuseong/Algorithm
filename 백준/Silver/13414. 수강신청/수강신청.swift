// 빨리누른 학생 대기목록
// 대기열 -> 수강신청시 맨뒤로
// 비활성화 -> 순서대로 수강신청 / 무시

// K: 1~10만명 정원
// L: 1~10만 대기목록의 길이 -> O(N) / O(NlgN)
// 학번은 8자리 숫자

// Dict: [Int:Int] [학번:카운트]
// 중복되면 카운트를 업데이트 -> 자동으로 이전 데이터가 사라진다.

let KL = readLine()!.split(separator: " ").map { Int($0)! }
let K = KL[0]
let L = KL[1]
var D = [String: Int]()
for i in 0..<L { D[readLine()!] = i }

// O(NlgN)으로 정렬
D.sorted { $0.value < $1.value }.prefix(K).forEach { print($0.key) }
