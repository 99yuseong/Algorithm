func jadenCase(_ w: String) -> String {
    
    if w == "" { return "" }
    
    let arr = Array(w)
    
    return String(arr[0]).uppercased() + String(arr[1...]).lowercased()
}

func solution(_ s:String) -> String {
    return s
        .split(separator: " ", omittingEmptySubsequences: false)
        .map { jadenCase(String($0)) }
        .joined(separator: " ")
}