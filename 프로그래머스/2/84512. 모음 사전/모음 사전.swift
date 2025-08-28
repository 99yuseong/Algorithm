// 리턴 - 몇번째 단어?
// 모든 경우의 수를 넣고, 정렬 -> 3000개 정도

import Foundation

func solution(_ word:String) -> Int {
    
    let n = word.count
    let chars: [String] = ["A", "E", "I", "O", "U"]
    var dict = Set<String>()
    
    func dfs(_ char: String) {
        if char.count == 5 { return }
        
        for c in chars {
            let newChar = char + c
            dict.insert(newChar)
            dfs(newChar)
        }
    }
    dfs("")
    
    let arr = Array(dict).sorted()
    
    for i in 0..<arr.count {
        if arr[i] == word { return i + 1 }
    }
    
    return 0
}


