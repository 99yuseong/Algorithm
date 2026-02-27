import Foundation

let letters = Array("abcdefghijklmnopqrstuvwxyz")

func solution(_ n: Int64, _ bans: [String]) -> String {
    var target = n

    // bans를 "번호"로 변환해서 오름차순 정렬
    // (target이 최대 1e15라, 1e15보다 큰 ban은 사실상 비교에 영향 없음)
    var banNums: [Int64] = []
    banNums.reserveCapacity(bans.count)

    for b in bans {
        let v = wordToNumber(b)
        // target이 증가할 수 있으니 너무 타이트하게 자르진 말고,
        // 그래도 과도한 값은 타입/시간만 낭비라 필터링 (여유치)
        if v <= Int64.max {
            banNums.append(v)
        }
    }
    banNums.sort()

    // banNum <= target 인 만큼 target을 밀어내기
    for v in banNums {
        if v <= target {
            target += 1
        } else {
            break
        }
    }

    return numberToWord(target)
}

// 엑셀 컬럼 방식: a=1, b=2, ..., z=26, aa=27 ...
private func wordToNumber(_ s: String) -> Int64 {
    var result: Int64 = 0
    for ch in s {
        // 'a'... 'z' -> 1...26
        let v = Int64(ch.asciiValue! - Character("a").asciiValue! + 1)
        result = result * 26 + v
    }
    return result
}

// 엑셀 컬럼 방식 역변환 (중요: num -= 1 보정)
private func numberToWord(_ num: Int64) -> String {
    var n = num
    var out: [Character] = []
    out.reserveCapacity(12)

    while n > 0 {
        n -= 1                               // ✅ 핵심 보정
        let r = Int(n % 26)                  // 0...25
        out.append(letters[r])               // a...z
        n /= 26
    }

    return String(out.reversed())
}