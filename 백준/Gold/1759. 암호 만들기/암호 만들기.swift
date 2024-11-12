let LandC = readLine()!.split(separator: " ").compactMap { Int($0) }
let L = LandC[0]
let C = LandC[1]
let alpha = readLine()!.split(separator: " ").map { String($0) }.sorted() // 순서대로 후 선택
var arr = Array(repeating: 0, count: L)
var canAnswer = false

func canAnswer(text: String) -> Bool {
    var count = 0
    for char in text {
        if ["a", "e", "i", "o", "u"].contains(char) {
            count += 1
        }
    }
    return count > 0 && count + 2 <= L
}

func selectAtKth(_ k: Int) { // k번째 알파벳을 선택하는 함수
    if k == L { // 이미 0 ~ L-1까지 선택해 L개를 모두 선택했을 경우
        let text = arr.map { alpha[$0] }.reduce("", { "\($0)\($1)" })
        if canAnswer(text: text) {
            print(text)
        }
        return
    }
    
    var start = 0
    if k != 0 { start = arr[k-1] + 1 }
    
    for i in start..<C {
        arr[k] = i
        selectAtKth(k+1)
    }
}
selectAtKth(0)
