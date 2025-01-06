// 시간 제한 4초
// 메모리 제한 128MB

// 3명으로 구성된 팀
// 코딩 실력 -1만~1만의 정수
// 3명의 코딩실력 A[x] + A[y] + A[z] = 0 (단, x, y, z는 달라야한다.)

// N명의 코딩 실력 Ai
// 경우의 수 출력

// N명 중 합이 0이 되는 3명 뽑기
// 10000C3 -> case sum = 3이다.
// 10000C3 = 10000 * 9999 * 9998 / 6 .... O(N^3) 시간초과

// O(N^2) 또는 O(N^2lgN) 안의 풀이가 필요하다.

// 2중 for문에 A[i] + A[j] = - A[z]인 수 이분탐색

// A는 정렬하면 -> 1 2 2 2 3 이렇게 나올 수 있다.
// A[i] + A[j] = - A[z]인 z는 여러 개일 수 있으므로
// upperBound, lowerBound를 이용

// 단, 범위의 제한이 있음
// 여기서, 탐색 범위는 x와 y보다 이상

func upperBound(st: Int, x: Int) -> Int {
    var min = st
    var max = A.count
    
    while min < max {
        let mid = (min + max) / 2
        
        if A[mid] <= x { min = mid + 1 }
        else { max = mid }
    }
    
    return min
}

func lowerBound(st: Int, x: Int) -> Int {
    var min = st
    var max = A.count
    
    while min < max {
        let mid = (min + max) / 2
        
        if A[mid] < x { min = mid + 1 }
        else { max = mid }
    }
    
    return min
}

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var count = 0
for x in 0..<N {
    for y in (x+1)..<N {
        let ub = upperBound(st: y+1, x: -A[x]-A[y])
        let lb = lowerBound(st: y+1, x: -A[x]-A[y])
        count += ub - lb
    }
}
print(count)


