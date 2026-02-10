// 파일 저장소 서버관리

// 과거버전 - 이름 정렬을 불편
// 숫자 정렬이 달라짐

// 숫자를 반영한 정렬 기능

// 100글자 내외. 대소문자, 숫자, 공백, . -
// 영문자로 시작하며 숫자 1개이상 포함
// 2글자 이상이다.

// Head
// num: 0 ~ 99999 숫자 - 앞자리 0 가능하다.
// tail: 숫자 등장 or 아무글자 없음

// 첫 등장하는 숫자가 중요한건가

// HEAD 부분을 기준으로 사전순 정렬 - 대소문자 구분을 하지 않는다 = lower or upper로 정렬 기준
// Num 정렬 - Int로 정렬
// tail - 현재 순서 유지

// files - 0~1000개 문자열
// 각 글자는 100글자 이내

// 1. 문자열을 배열로 3등분 - 중간의 숫자를 구분해내기 O(1000 * 100) - 0 ~ 9사이
// 2. 정렬 (Head, Num) 기준으로

func solution(_ files:[String]) -> [String] {
                       
    var arr: [[String]] = []
    
    for file in files {
        
        var f = Array(file).map { String($0) }
        var head: [String] = []
        var num: [String] = []
        var tail: [String] = []
        
        for i in 0..<file.count {
            if let n = Int(String(f[i])) {
                num.append(f[i])
            
            } else if num.isEmpty {
                head.append(f[i])
            
            } else {
                tail = Array(f[i..<file.count])
                break
            }
        }
        
        arr.append([head.joined(), num.joined(), tail.joined()])           
    }
    
    arr.sort { arr1, arr2 in
        if arr1[0].lowercased() == arr2[0].lowercased() {
           return Int(arr1[1])! < Int(arr2[1])! 
        }
        return arr1[0].lowercased() < arr2[0].lowercased()
    }
    
    return arr.map { $0.joined() }
}