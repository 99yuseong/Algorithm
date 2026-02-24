// 땅과 호수 > 2차원 공간

// 초록과 빨강 배양액
// 가능한 땅은 정해져있다.
// 매초 인접한 땅으로 퍼져간다.
// 하얀 > X, 황토 > O, 하늘 > 호수

// 초록과 빨강이 동시에 도달 > 꽃 - 더이상 배양액을 퍼트리지 않음

// 피울 수 있는 최대 꽃의 개수

// N: 2~50
// M: 2~50
// G: 1~5개
// R: 1~5개
// 0: 호수, 1: 황토, 2: 하얀
// 땅: R+G...10

// G과 R이 동시에 퍼져나가는 BFS
// 1. 황토땅 > G와 R을 배치하는 경우의 수
    // 10칸 중 G / R을 고르는 경우
    // 황토CG+R을 고르고, GR 정렬 > set으로 처리

// 2. 호수 = -1, 황토 = 0, 하얀 = 0

// 2. Queue에 배양액 넣고, BFS
    // 현재 퍼지는 게 같이 퍼지는 건지를 확인
    // map1: 시간
    // map2: 호수 = -1, 황토 = 0, 하얀 = 0, R = 1, G = 2
    // map을 1개 >
        // +1 하면서 퍼지기, 
        // 만약 다음땅이 0이면 퍼짐
            // 
    // map: RG 채우는 용도

func solution(_ map: [[Int]], _ G: Int, _ R: Int) -> Int {

    let N = map.count
    let M = map[0].count
    
    var map: [[Int]] = map
    var candidate: [(x: Int, y: Int)] = []
    
    for i in 0..<N {
        for j in 0..<M {
            // 0: 호수, 1: 하얀, 2: 황토
            // >> 호수 = -1, 황토 = 0, 하얀 = 0
            if map[i][j] == 0 { 
                map[i][j] = -1 
                continue 
            }
            if map[i][j] == 2 { 
                candidate.append((i,j))
                map[i][j] = 0
                continue 
            }
            if map[i][j] == 1 { 
                map[i][j] = 0
                continue 
            }
        }
    }
    
    var maxFlower = 0
    for c in combi(candidate, G+R) { // max 10C5
        for gr in grCases(G, R) { // 10P10
            
            var newMap = map
            var time = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

            for i in 0..<G+R {
                let cur = c[i]
                newMap[cur.x][cur.y] = gr[i]
            }
            
            // newMap: 호수 = -1, 황토 = 0, 하얀 = 0, R = 1, G = 2, 꽃 = 3
            // time: 0으로 세팅
            let dx = [-1, 1, 0, 0]
            let dy = [0, 0, -1, 1]
            
            var flower = 0
            var queue = Queue<(x: Int, y: Int)>()
            for item in c { queue.append(item) }
            
            while !queue.isEmpty {
                let cur = queue.removeFirst()!
                if newMap[cur.x][cur.y] == 3 { continue }
                
                for i in 0..<4 {
                    let x = cur.x + dx[i]
                    let y = cur.y + dy[i]
                    
                    if (0..<N) ~= x && (0..<M) ~= y && newMap[x][y] != -1 {
                        
                        // 꽃을 만난 경우
                        if newMap[x][y] == 3 { continue }
                        
                        // 황토 또는 하얀 땅인 경우
                        if newMap[x][y] == 0 {
                            queue.append((x, y))
                            newMap[x][y] = newMap[cur.x][cur.y]
                            time[x][y] = time[cur.x][cur.y] + 1
                            continue
                        }
                                                
                        // 동일한 주기에 다른 배양액을 만난 경우
                        if newMap[x][y] != newMap[cur.x][cur.y]
                        && time[x][y] == time[cur.x][cur.y] + 1 { 
                            newMap[x][y] = 3
                            flower += 1
                        }
                    }
                }
            }
            
            maxFlower = max(maxFlower, flower)
        }
    }
    
    return maxFlower
}

struct Queue<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    var isEmpty: Bool { return inbox.isEmpty && outbox.isEmpty }
    mutating func append(_ item: T) {
        inbox.append(item)
    }
    mutating func removeFirst() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}

func combi(_ arr: [(x: Int, y: Int)], _ r: Int) -> [[(x: Int, y: Int)]] {
    var result: [[(x: Int, y: Int)]] = []
    var cur: [(x: Int, y: Int)] = []
    func select(_ k: Int, _ s: Int) {
        if k == r {
            result.append(cur)
            return
        }
        for i in s..<arr.count {
            cur.append(arr[i])
            select(k+1, i+1)
            cur.removeLast()
        }
    }
    select(0,0)
    return result
}

// G: 1, R: 2로 나열
func grCases(_ G: Int, _ R: Int) -> [[Int]] {
    
    var a = (0..<G).map { _ in 1 }
    var b = (0..<R).map { _ in 2 }
    var arr = a + b
   
    func permu(_ arr: [Int]) -> [[Int]] {
        var result: Set<[Int]> = []
        var cur: [Int] = []
        var isUsed = [Bool](repeating: false, count: arr.count)
        func select(_ k: Int) {
            if k == G+R {
                result.insert(cur)
                return
            }
            for i in 0..<arr.count {
                if !isUsed[i] {
                    isUsed[i] = true
                    cur.append(arr[i])
                    select(k+1)
                    cur.removeLast()
                    isUsed[i] = false
                }
            }
        }
        select(0)
        return Array(result)
    }
    return permu(arr)
}

let NMGR = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NMGR[0]
let M = NMGR[1]
let G = NMGR[2]
let R = NMGR[3]
var MAP: [[Int]] = []
for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    MAP.append(row)
}
print(solution(MAP,G,R))

