import Foundation

func solution(_ number:String, _ k:Int) -> String {
    
    var stack: [Int] = []
    var k = k
    
    for num in number.map { Int(String($0))! } {
        while !stack.isEmpty && stack.last! < num && k > 0 { 
            stack.removeLast()
            k -= 1
        }
        stack.append(num)
    }
    
    if k > 0 { stack.removeLast(k) }
    
    return stack.map { String($0) }.joined()
}

// 어떤 숫자에서 k개의 수를 제거했을때, 얻을 수 있는 가장 큰 숫자

// number: 2자리~100만자리
// 100만C50만 이거 안됨

// 1. 일단 다 제거?
//  안됨. 시간 초과

// 2. 그리디?
// - 가장 작은 수를 빼면 되나? NO, 자릿수가 가장 중요할 듯
// 어짜피 숫자를 뺴도 전체 자릿수는 동일, 즉, 앞에서부터 k개 중 가장 큰 수만큼 남겨야함

// 앞의수 k개 중 max 찾고, 그 앞에있는거 m개 빼고
// 그 다음 m개 중 max 찾고, 그 앞에 있는거 n개 빼고
// ...
// 최악, 100만 * 100만 -> O(N^2)
// O(N) 이나 O(NlgN)

// Stack? 
// [] 1. 자기보다 큰 값 만나면 k개 다찰때까지 제거
//    2. 작은 값 만나면 넣기
// 