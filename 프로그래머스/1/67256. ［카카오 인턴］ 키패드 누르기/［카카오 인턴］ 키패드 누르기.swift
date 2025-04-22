import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {

    // 거리 측정함수
    // left = Set : 1,4,7
    // right = Set : 3,6,9

    // 0. 초기화
    // L = (x: 3, y: 0), R = (x: 3, y: 2)
    // leftSet, rightSet
    // ans
    
    func distance(_ a: (Int, Int), _ b: (Int, Int)) -> Int {
        return abs(a.0 - b.0) + abs(a.1 - b.1)
    }
    
    func pressL(for number: Int) {
        ans += "L"
        L = keypad[number]!
    }
    
    func pressR(for number: Int) {
        ans += "R"
        R = keypad[number]!
    }
    
    let leftSet: Set<Int> = [1,4,7]
    let rightSet: Set<Int> = [3,6,9]
    
    let keypad = [
        1: (0, 0), 2: (0, 1), 3: (0, 2),
        4: (1, 0), 5: (1, 1), 6: (1, 2),
        7: (2, 0), 8: (2, 1), 9: (2, 2),
       -1: (3, 0), 0: (3, 1),-2: (3, 2)
    ]
    
    var L = keypad[-1]!
    var R = keypad[-2]!
    var ans = ""
    
    for number in numbers {
        
        if leftSet.contains(number) { 
            pressL(for: number)
            continue
        }
        
        if rightSet.contains(number) { 
            pressR(for: number)
            continue
        }
        
        let target = keypad[number]!
        
        let dL = distance(L, target)
        let dR = distance(R, target)
        
        if dL < dR {
            pressL(for: number)
            
        } else if dR < dL {
            pressR(for: number)
            
        } else { // dL == dR
            
            if hand == "right" {
                pressR(for: number)
            } else {
                pressL(for: number)
            }   
        }
    }

    return ans
}

// 순서대로 누를 번호 numbers
// 왼손/오른손 잡이
// 각 번호를 누른 엄지가 왼손인지 오른손인지 나타내는 문자열


// 왼 엄지 *
// 오른 엄지 #

// 엄지 - 상하좌우 이동, 거리 1
// 1, 4, 7은 왼 엄지
// 3, 6, 9는 오른 엄지
// 2, 5, 8, 0은 키패드에서 더 가까운 엄지 손가락
// 거리가 같다면 오른 손잡이는 오른 엄지, 왼손잡이는 왼 엄지

// numbers: 1~1000
// 값 0~9

// 왼손 L, 오른R


// 1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5




