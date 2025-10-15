import Foundation

// 흔적을 최소화

// info: 흔적 정보
// n: A 최소 검거 흔적 개수
// m: B 최소 검거 흔적 개수

// return: 둘다 안잡힐때, A의 흔적 개수의 최솟값 or -1

// 흔적 1~3
// info: 1~40
// n: 1~120
// m: 1~120

// A와 B가 팀이 되어 훔친다.

// 1. 모든 경우의 수 - 시간 초과
// i: 0~39까지 A or B -> 2^40
// 1099,511,627,776 -> 시간 초과


// 2. 그리디 or dp

// DP - O(40)

// D[i][0]: i번째 물건을 훔쳤을때, A의 흔적 최솟값
// D[i][1]: i번째 물건을 훔쳤을때, B의 흔적 

// D[i][0] = D[i-1][1] + info[i][1] >= m ? D[i-1][0] : D[i-1][0] + info[i][0]
// D[i][1] = D[i][0] == D[i-1][0] ? D[i-1][1] + info[i][1] : D[i-1][1]

// 어떤걸 먼저해야 좋을까 (그리디)
// [A, B] 
// - 우선 B가 작을수록 좋지. B한테 넘길 수 있으니까.
// - A가 클수록 좋지. 더 적어지니까.

func solution(_ info:[[Int]], _ n:Int, _ m:Int) -> Int {
    let info = info.sorted { 
        $0[0] - $0[1] == $1[0] - $1[1] 
        ? $0[0] / $0[1] > $1[0] / $1[1] : $0[0] - $0[1] > $1[0] - $1[1] 
    }
    var D = [[Int]](repeating: [-1, -1], count: info.count)
    
    if info[0][1] >= m 
    && info[0][0] >= n {
        return -1
    }
    
    D[0][0] = info[0][1] >= m ? info[0][0] : 0
    D[0][1] = info[0][1] >= m ? 0 : info[0][1]

    for i in 1..<info.count {
        
        if (D[i-1][1] + info[i][1]) >= m 
        && (D[i-1][0] + info[i][0]) >= n { 
            return -1 
        }
        
        D[i][0] = (D[i-1][1] + info[i][1]) < m ? D[i-1][0] : D[i-1][0] + info[i][0]
        D[i][1] = D[i][0] == D[i-1][0] ? D[i-1][1] + info[i][1] : D[i-1][1]
    }
    
    return D[info.count-1][0]
}