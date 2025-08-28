// 리턴 - 몇번째 단어?
// 모든 경우의 수를 넣고, 정렬 -> 3000개 정도

import Foundation

func solution(_ word: String) -> Int {
    let chars = ["A", "E", "I", "O", "U"]
    let weights = [781, 156, 31, 6, 1]  // 각 자리의 가중치
    
    var answer = 0
    
    for (i, ch) in word.enumerated() {
        if let idx = chars.firstIndex(of: String(ch)) {
            answer += idx * weights[i] + 1
        }
    }
    
    return answer
}

// func solution(_ word:String) -> Int {
    
//     let n = word.count
//     let chars: [String] = ["A", "E", "I", "O", "U"]
//     var dict = Set<String>()
    
//     func dfs(_ char: String) {
//         if char.count == 5 { return }
        
//         for c in chars {
//             let newChar = char + c
//             dict.insert(newChar)
//             dfs(newChar)
//         }
//     }
//     dfs("")
    
//     let arr = Array(dict).sorted()
    
//     for i in 0..<arr.count {
//         if arr[i] == word { return i + 1 }
//     }
    
//     return 0
// }


