import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {

    // 거리 측정함수
    // left = Set : 1,4,7
    // right = Set : 3,6,9

    // 0. 초기화
    // L = (x: 3, y: 0), R = (x: 3, y: 2)
    // leftSet, rightSet
    // ans
    
    func pressL(for number: Int) {
        ans += "L"
        L = loc["\(number)"]!
    }
    
    func pressR(for number: Int) {
        ans += "R"
        R = loc["\(number)"]!
    }
    
    let leftSet: Set<Int> = [1,4,7]
    let rightSet: Set<Int> = [3,6,9]
    
    let loc = [
        "1": (x: 0, y: 0),
        "2": (x: 0, y: 1),
        "3": (x: 0, y: 2),
        "4": (x: 1, y: 0),
        "5": (x: 1, y: 1),
        "6": (x: 1, y: 2),
        "7": (x: 2, y: 0),
        "8": (x: 2, y: 1),
        "9": (x: 2, y: 2),
        "0": (x: 3, y: 1),
    ]
    
    var L = (x: 3, y: 0)
    var R = (x: 3, y: 2)
    var ans = ""
    
    for number in numbers {
        
        let targetNum = loc["\(number)"]!
        let lToNum = distance(L, targetNum)
        let rToNum = distance(R, targetNum)
        
        if leftSet.contains(number) { 
            pressL(for: number)
            continue
        }
        
        if rightSet.contains(number) { 
            pressR(for: number)
            continue
        }
        
        if lToNum < rToNum {
            pressL(for: number)
            continue
        }
        
        if rToNum < lToNum {
            pressR(for: number)
            continue
        }
        
        if hand == "right" {
            pressR(for: number)
        } else {
            pressL(for: number)
        }
    }

    return ans
}

func distance(_ a: (x: Int, y: Int), _ b: (x: Int, y: Int)) -> Int {
    return abs(a.x - b.x) + abs(a.y - b.y)
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




