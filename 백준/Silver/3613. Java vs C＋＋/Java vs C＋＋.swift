// C++ -> Java
// Java -> C++
// 둘다 아니라면 에러
// 단어의 순서는 유지

// 1. Java인지 C++인지 확인
// 2. Java라면 C++로
// 3. C++이라면 Java로

// Java -> javaIdentifier -> 소문자와 대문자로만 구성
// C++ -> 소문자와 _ 로만 구성

// 1초에 100자이하
import Foundation

let word = Array(readLine()!).map { String($0) }

if word.contains("_") {
    // C++ 확인
    if word.first! == "_" || word.last! == "_" {
        print("Error!")
        exit(0)
    }
    
    for i in 0..<word.count {
        if !("a"..."z" ~= word[i]) && ("_" != word[i]) {
            print("Error!")
            exit(0)
        }
        
        if i < word.count-1 && word[i] == "_" && word[i+1] == "_" {
            print("Error!")
            exit(0)
        }
    }
    
    var ans = ""
    var idx = 0
    while idx < word.count {
        if word[idx] == "_" {
            ans += word[idx+1].uppercased()
            idx += 2
        } else {
            ans += word[idx]
            idx += 1
        }
    }
    print(ans)
    
} else {
    // Java 확인
    if "A"..."Z" ~= word.first! {
        print("Error!")
        exit(0)
    }
    
    for char in word {
        if !("a"..."z" ~= char) && !("A"..."Z" ~= char) {
            print("Error!")
            exit(0)
        }
    }
    
    var ans = ""
    var idx = 0
    while idx < word.count {
        if "A"..."Z" ~= word[idx] {
            ans += "_" + word[idx].lowercased()
        } else {
            ans += word[idx]
        }
        idx += 1
    }
    
    print(ans)
}


