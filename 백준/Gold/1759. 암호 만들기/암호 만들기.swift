let LandC = readLine()!.split(separator: " ").compactMap { Int($0) }
let L = LandC[0]
let C = LandC[1]
let alpha = readLine()!.split(separator: " ").map { String($0) }.sorted() // 순서대로 후 선택

func selectAtKth(_ k: Int, text: String, start: Int, aCount: Int, bCount: Int) { // k번째 알파벳을 선택하는 함수
    if k == L { // 이미 0 ~ L-1까지 선택해 L개를 모두 선택했을 경우
        if aCount > 0 && bCount >= 2 {
            print(text)
        }
        return
    }
    
    for i in start..<C {
        let char = alpha[i]
        let isA = ["a", "e", "i", "o", "u"].contains(char)
        
        selectAtKth(
            k+1,
            text: text + char,
            start: i+1,
            aCount: aCount + (isA ? 1 : 0),
            bCount: bCount + (isA ? 0 : 1)
        )
    }
}
selectAtKth(0, text: "", start: 0, aCount: 0, bCount: 0)
