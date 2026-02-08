
// 음악 정보 제공 서비스

// 1. 끝 부분 ~ 처음 부분
// 2. 부분 멜로디가 그 음악이 아닐 수도

// 재생시간 + 악보 비교

// 1. 제목, 시작 ~ 끝, 악보
// 2. 음은 12개만 사용
// 3. 1분에 1개씩 재생 -> 시간이 길때는 반복재생된다, 짧을때는 재생시간 만큼만
// 4. 최대 00:00 까지만

// 5. 일치 여러 개 : 재생된 시간 길수록 > 먼저 입력될 수록
// 6. 없을 때는 None을 반환

// m: 멜로디 - 1~1439개
// musicinfos: [시작T:끝T:제목,악보] - 0~100개
// 제목: 1~64개 문자열
// 악보: 1~1439개

// 멜로디가 musicinfo의 부분이다 >
// musicinfo를 시작 > 끝 시간대의 String으로 변환 부분 문자열 여부를 확인

// 1. musicinfo -> [재생된음악, 제목] 변환 - O(100)
// 2. 변환된 배열 loop하며 m이 부분 문자열인지 확인 - O(1440 * 1439 * 1439)
// 3. 찾은 결과 empty ? None : 재생된음악.count 큰 순 정렬

// 한 음악을 반복해서 재생할 때도 있어서 네오가 기억하고 있는 멜로디는 
// 음악 끝부분과 처음 부분이 이어서 재생된 멜로디일 수도 있다. 

// 반대로, 한 음악을 중간에 끊을 경우 원본 음악에는 네오가 기억한 멜로디가 들어있다 해도 
// 그 곡이 네오가 들은 곡이 아닐 수도 있다.

func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    // 1. musicinfo -> [재생된음악, 제목] 변환 - O(100)
    var musics: [[String]] = musicinfos.map { splitMusicInfo($0) }
    
    var results: [[String]] = []
    
    for (idx, r) in musics.enumerated() {
        
        let played = r[0]
        let title = r[1]
        let music = r[2]
        let target = normalize(m)
        
        if played.contains(target) {
            results.append([played, title, String(idx)])
        }
    }
    
    results.sort { 
        if $0[0].count == $1[0].count { return Int($0[2])! < Int($1[2])! }
        return $0[0].count > $1[0].count
    }
    
    return results.isEmpty ? "(None)" : results.first![1]
}

func normalize(_ s: String) -> String {
    return s
        .replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
        .replacingOccurrences(of: "B#", with: "b")
        .replacingOccurrences(of: "E#", with: "e")
}

func splitMusicInfo(_ info: String) -> [String] {
    
    let info = info.split(separator: ",").map { String($0) }
    let t = timeToInterval(info[0], info[1])
    let title = info[2]
    let music = normalize(info[3])
    var played = ""
        
    if music.count > t {
        played = String(music.prefix(t))
        
    } else {
        while played.count < t { played += music }
        played = String(played.prefix(t))
    }
    
    return [played, title, music]
}

func timeToInterval(_ start: String, _ end: String) -> Int {
    
    let start = start.split(separator: ":").map { Int($0)! }
    let end = end.split(separator: ":").map { Int($0)! }

    let startT = start[0] * 60 + start[1]
    let endT = end[0] * 60 + end[1]
        
    return endT - startT
}
