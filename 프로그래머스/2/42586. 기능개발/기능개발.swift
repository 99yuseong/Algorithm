import Foundation

// 진도 100에 서비스 반영
// 뒷 기능은, 앞 기능 배포시 함께 배포
// 배포 순서대로 p배열
// 각각의 속도 s배열
// 배포마다 몇개의 기능이 배포 되는 지를 return

// 작업은 100개 이하
// 진도는 100미만 (0~99짜리 진도)
// 속도는 100이하
// 배포는 하루 1번(끝)

// 93 30 55
// 1 30 5

// 1일 - 94 60 60
// 2일 - 95 90 65
// 3일 - 96 100 70
// ...

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var lastReleaseDate: Int = 0
    var numOfReleases: [Int] = []
    
    for i in 0..<progresses.count {
        let progress = Double(progresses[i])
        let speed = Double(speeds[i])
        let day = Int(ceil((100 - progress) / speed))
    
        if day > lastReleaseDate {
            lastReleaseDate = day
            numOfReleases.append(1)
        } else {
            numOfReleases[numOfReleases.count - 1] += 1
        }
    }
    return numOfReleases
}