//현재 회사에 있는 모든 사람

// N: 출입기록 2~100만
// Set으로 확인

// 회사 사람의 이름을 사전 역순으로 한명씩 출력

let N = Int(readLine()!)!
var set = Set<String>()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    if input[1] == "enter" { set.insert(input[0]) }
    else { set.remove(input[0]) }
}

print(Array(set).sorted().reversed().joined(separator: "\n"))
