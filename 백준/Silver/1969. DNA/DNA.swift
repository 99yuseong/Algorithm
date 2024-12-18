// 2초
// 4가지 DNA
// ATGC

// Hamming Distance -> 길이가 같은 DNA, 각 위치의 문자가 다른 개수
// AGCAT
// GGAAT
// HD = 2

// N개의 길이가 M인 DNA
// HD의 합이 가장 작은 DNA을 구하기

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0] // DNA 수 1~999
let M = NM[1] // 문자열 길이 1~49
var A = Array(repeating: Array(repeating: 0, count: M), count: 4)
    
for _ in 0..<N {
    let DNA = Array(readLine()!)
    
    for j in 0..<M {
        switch DNA[j] {
        case "A": A[0][j] += 1
        case "C": A[1][j] += 1
        case "G": A[2][j] += 1
        case "T": A[3][j] += 1
        default: break
        }
    }
}

func changeToDNA(of dna: Int) -> String {
    switch dna {
    case 0: return "A"
    case 1: return "C"
    case 2: return "G"
    case 3: return "T"
    default: return ""
    }
}

var dna = ""
var hm = N * M

for j in 0..<M {
    var maxIdx = 0

    for i in 1..<4 {
        if A[maxIdx][j] < A[i][j] {
            maxIdx = i
        }
    }
    
    dna += changeToDNA(of: maxIdx)
    hm -= A[maxIdx][j]
}

print(dna)
print(hm)
