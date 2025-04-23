func solution(_ arr:[Int]) -> Int {
    
    var lcm = 1
    
    for num in arr {
        lcm = (lcm * num) / GCD(lcm, num)
    }
    
    return lcm
}

// 최소 공배수

// arr: 1~15 길이
// 원소: 1~100 자연수


func GCD(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    
    return GCD(b, a % b)
}