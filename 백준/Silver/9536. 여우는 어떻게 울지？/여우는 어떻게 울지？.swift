// 1초
// 여우의 울음소리?

// 소문자, 공백으로 구분

// 단어는 최대 100자 길이, 최대 100개 -> 한 줄에 공백포함 최대 10099자

// 다음줄부터는 1~100마리의 동물 소리 정보
// <동물이름> goes <소리>: 이름 100자, 소리 100자 -> 최대 20600자 입력

let T = Int(readLine()!)! // 테스트 케이스의 개수

for _ in 0..<T {
    var Sounds = readLine()!.split(separator: " ")

    while true {
        let input = readLine()!.split(separator: " ")
        
        if input.count > 3 {
            break
        }
        
        let sound = input[2]
        
        for i in 0..<Sounds.count {
            if Sounds[i] == sound {
                Sounds[i] = ""
            }
        }
    }

    print(Sounds.filter { !$0.isEmpty }.joined(separator: " "))
}
