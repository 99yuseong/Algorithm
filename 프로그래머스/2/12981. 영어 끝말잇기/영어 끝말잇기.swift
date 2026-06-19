import Foundation

// n명이 끝말잇기
// 2자리 이상, 기존 사용했던것 사용 불가

// 가장 먼저 탈락하는 사람의 번호

// set에 넣다가 idx % n으로 처리
// n

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var lastWords = ""
    var wordsSet = Set<String>()
    
    for i in 0..<words.count {
        
        let num = (i % n) + 1
        let word = words[i]
        
        if wordsSet.contains(word) {
            return [num, (i / n) + 1]
        } 
        
        if !lastWords.isEmpty && lastWords.suffix(1) != word.prefix(1) {
            return [num, (i / n) + 1]
        }
        
        lastWords = word
        wordsSet.insert(word)
    }
    
    
    return [0, 0]
}