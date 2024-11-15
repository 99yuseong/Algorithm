// n개의 트럭

// 순서 고정
// 트럭 무게는 같을 수도 있다. (서로 같지 않을 수 있다.)

// 다리 위에는 w대의 트럭만 동시에
// 다리 길이는 w단위 길이
// 각 트럭들은 하나의 단위시간동안 단위 길이 만큼 움징인다.
// 동시 트럭 무게 합은 L보다 작거나 같아야한다.
// 다리 위에 온전히 올라기자 못한 무게는 포함하지 않는다.

// 다리 길이 w = 2
// 최대 하중 L = 10
// 트럭 [7, 4, 5, 6]

// 7 -> 2
// 4, 5 -> 3
// 6 -


// 시작 -> [7][7][4][45][5][6][6][] = 8

// 1<=n<=1000 최대 트럭 1000대
// 1<=w<=100  다리 길이 최대 100
// 10<=L<=1000 최소 하중 10
// 1<=a<=10   트럭 최대 무게 10

let nwL = readLine()!.split(separator: " ").map { Int($0)! }
let n = nwL[0] // 트럭 수
let w = nwL[1] // 다리 길이
let L = nwL[2] // 하중
let trucks = readLine()!.split(separator: " ").map { Int($0)! }

var onWay: [[Int]] = [] // [a, 이동]
var time = 0
var cur = 0

while cur < n {
    if onWay.reduce(0, { $0 + $1[0] }) + trucks[cur] <= L {
        onWay.append([trucks[cur], 1])
        cur += 1
    }
    
    time += 1
    
    for i in 0..<onWay.count {
        onWay[i][1] += 1
    }
    
    while !onWay.isEmpty && onWay.first![1] > w {
        onWay.removeFirst()
    }
}
print(time + w)

