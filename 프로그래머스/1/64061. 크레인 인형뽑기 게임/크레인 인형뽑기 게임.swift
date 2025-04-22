import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    let N = board.count
    
    // 0. 바구니 준비
    var board = board
    var stack: [Int] = []
    var cnt: Int = 0
    
    // 1000번
    for mv in moves {
    // 1. move되는 번째의 가장 높은 칸 -> 바구니 append, 0으로 교체
    //    [i][mv-1] N~0돌면서 0이 아니면 break
        
        // 30번
        for i in 0..<N {
            let item = board[i][mv-1]
            
            if item != 0 {
                
                // 2. 바구니 마지막과 같으면 cnt + 2   
                if !stack.isEmpty && stack.last! == item {
                    cnt += 2
                    stack.removeLast()
                } else {
                    stack.append(item)
                }
                board[i][mv-1] = 0
                break
            }
        }
    }

    // 3. cnt 리턴
    return cnt
}

// board와 moves
// 크레인을 작동시킨 후
// 터트려져 사라진 인형의 개수

// 연속해서 쌓이게 되면 터트려진다.

// 인형이 없는 경우, 크레인은 아무일도 x
// 바구니는 충분히 크다.

// board 5*5 ~ 30*30
// 0~100개
// moves는 1~1000

// [
//     [0, 0, 0, 0, 0], 
//     [0, 0, 1, 0, 3], 
//     [0, 2, 5, 0, 1], 
//     [0, 2, 4, 4, 0], 
//     [0, 0, 0, 0, 0]
// ]
