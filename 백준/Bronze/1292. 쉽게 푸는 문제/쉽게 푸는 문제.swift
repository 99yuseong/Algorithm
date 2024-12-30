// 2초
// 128MB

// A부터 B숫자까지의 합
// 1 .... 45가 20개

// 배열을 만들고 값을 주입
// Subscript의 reduce sum!

// var A: [Int] = [1,2,2,3,3,3,...]
// for i in 1...44
//     for j in 1...i { A.append(i) }

// A[a...b].reduce(0, +)

var AB = readLine()!.split(separator: " ").map { Int($0)! }
var A = AB[0]
var B = AB[1]

var D: [Int] = [0]

for i in 1...45 {
    for _ in 0..<i {
        D.append(i)
    }
}

print(D[A...B].reduce(0, +))
