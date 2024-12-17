let N = Int(readLine()!)!
let pattern = readLine()!

// 패턴을 "*" 기준으로 나눈다.
let parts = pattern.split(separator: "*").map { String($0) }
let prefix = parts[0]  // "*" 앞부분
let suffix = parts[1]  // "*" 뒷부분

for _ in 0..<N {
    let word = readLine()!
    
    // 문자열의 길이가 prefix와 suffix 길이보다 작으면 무조건 NE
    if word.count < prefix.count + suffix.count {
        print("NE")
        continue
    }
    
    // 문자열의 앞부분과 뒷부분이 일치하는지 검사
    let startIndex = word.startIndex
    let endIndex = word.index(word.endIndex, offsetBy: -suffix.count)
    
    let wordPrefix = word[word.startIndex..<word.index(startIndex, offsetBy: prefix.count)]
    let wordSuffix = word[word.index(endIndex, offsetBy: 0)..<word.endIndex]
    
    if wordPrefix == prefix && wordSuffix == suffix {
        print("DA")
    } else {
        print("NE")
    }
}