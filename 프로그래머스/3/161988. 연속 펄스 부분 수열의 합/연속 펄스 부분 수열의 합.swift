import Foundation

// 연속 부분 수열에 같은 길이의 펄스 수열을 각 원소끼리 곱하여

// [1, -1, ...] 1과 -1이 번갈아 나오는 수열
// 부분 수열 > 펄스 수열을 곱하면, 

// 연속 펄스 부분 수열의 합 중 가장 큰 것

// 일부가 될 수도 있고 / 전체가 될 수도 있고, 근데 또 케이스는 2개네 뭐부터 시작하느냐

// n: 1~50만
// -10만 ~ 10만 

// 펄스 수열을 곱한다 > 인덱스에 홀짝 (-1) 곱한다

// 부분수열
// > i in 1 ~ 50만
//      > j in i+1 ~ 50만

// 다 돌면 터진다.

// 슬라이딩을 하면 50만 * 50만 동일
// 같은 운명은 인덱스의 홀수 짝수

// n ~ k개

// 짝수 sequence (n)/2 ~ (n+k)/2 > 부분 합
// 홀수 sequence (n+1)/2 ~ (n+k+1)/2 > 부분 합 > 누적합을 뺀것


// 1. 배열 2개로 나눈다.
// 2. n: 0~50만 * k: 
// 최댓값을 구하는 것

// DP를 생각해볼까

// D[i][j]: i ~ i+j-1까지의 부분합
// D[i][j] = D[0][j] - D[0][i] 


// 최대 연속 부분합

// 근데 채우려면 50만 * 50만을 해야한다는 게 문제인거임

// D[i]: i까지의 최대 연속 부분합
// D[i] = max(A[i], D[i-1] + A[i])
// D[0] = A[0]

func solution(_ sequence:[Int]) -> Int64 {
    
    let N = sequence.count
    
    var D1 = [Int](repeating: 0, count: N+1)
    var D2 = [Int](repeating: 0, count: N+1)
    
    D1[0] = sequence[0]
    D2[0] = sequence[0] * (-1)
    
    for i in 1..<N {
        if i % 2 == 0 {
            // D1은 +, D2는 -
            D1[i] = max(sequence[i], D1[i-1] + sequence[i])
            D2[i] = max(sequence[i] * (-1), D2[i-1] + sequence[i] * (-1))
        } else {
            // D1은 -, D2는 +
            D1[i] = max(sequence[i] * (-1), D1[i-1] + sequence[i] * (-1))
            D2[i] = max(sequence[i], D2[i-1] + sequence[i])
        }
    }
    
    return Int64(max(D1.max()!, D2.max()!))
}