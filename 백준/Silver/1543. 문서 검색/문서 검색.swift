var word = Array(readLine()!) // 최대 2500자
let keyword = readLine()! // 최대 50자

var idx = 0
var ans = 0
while idx <= word.count-keyword.count {
    if String(word[idx..<idx+keyword.count]) == keyword {
        ans += 1
        idx += keyword.count
    } else {
        idx += 1
    }
}
print(ans)
