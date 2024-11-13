// N * N 크기의 도시
// 도시의 치킨 거리가 가장 작게되는 프로그램

// 2 <= N <= 50
// 1 <= M <= 13

// 0: 빈칸
// 1: 집
// 2: 치킨집

// 1은 1개 이상 2N개 미만
// 2는 M개 이상 13개 미만

// 총 S개의 치킨집 중 M개를 골랐을 때 치킨 거리

// M개를 선택한 경우, 전체 거리를 돌면서 치킨거리 계산 -> 최솟값 = 집의 치킨거리

// 총 도시의 치킨거리 -> 집의 치킨거리 합의 최솟값

// 1. 치킨집 중 M개를 선택
// 2. 집을 돌면서, 선택된 치킨집 중 최소 치킨거리를 계산, 총합으로 도시 치킨거리 계산
// 3. 최소 도시 치킨 거리를 계산

let NM = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = NM[0]
let M = NM[1]
var map: [[Int]] = []
for _ in 0..<N {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    map.append(line)
}

var houses: [[Int]] = []
var chickens: [[Int]] = []
var selectedChickens: [[Int]] = []
var answer = 999999

for i in 0..<N {
    for j in 0..<N {
        if map[i][j] == 1 {
            houses.append([i,j])
        } else if map[i][j] == 2 {
            chickens.append([i,j])
        }
    }
}

selectChicken(0, start: 0)
print(answer)

// 13C6
func selectChicken(_ k: Int, start: Int) { // k번쨰 원소를 선택
    if k == M {
        calChickenDistance()
        return
    }
    
    for i in start..<chickens.count {
        selectedChickens.append(chickens[i])
        selectChicken(k+1, start: i+1)
        selectedChickens.removeLast()
    }
}

func calChickenDistance() {
    var minCCD = 0
    
    for house in houses {
        var minCD = 2*N
        for chicken in selectedChickens {
            let CD = abs(house[0] - chicken[0]) + abs(house[1] - chicken[1])
            minCD = min(minCD, CD)
        }
        minCCD += minCD
    }
    
    answer = min(answer, minCCD)
}
