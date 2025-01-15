// N개의 포켓몬
// M개의 문제

// N: 1~10만
// 입력으로 숫자 -> 포켓몬 이름
// 포켓몬 이름 -> 숫자

// 배열 / set / Dict

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var dict1 = Dictionary<String, Int>()
var dict2 = Dictionary<Int, String>()

for i in 1...N {
    let input = readLine()!
    dict1[input] = i
    dict2[i] = input
}

for _ in 0..<M {
    let input = readLine()!
    
    if let num = Int(input) {
        print(dict2[num]!)
    } else {
        print(dict1[input]!)
    }
}
