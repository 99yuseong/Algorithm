let N = Int(readLine()!)!
let pattern = readLine()!.split(separator: "*")
let start = pattern[0]
let end = pattern[1]

for _ in 0..<N {
    let word = readLine()!
    
    if word.count < start.count + end.count {
        print("NE")
        continue
    }
    
    if word.prefix(start.count) == start && word.suffix(end.count) == end {
        print("DA")
    } else {
        print("NE")
    }
}

