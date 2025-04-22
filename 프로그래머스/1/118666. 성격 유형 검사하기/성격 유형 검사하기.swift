import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    
    let N = survey.count
    
    // 0. 초기화, 2차원 배열
    var score = ["R":0, "T":0, "C":0, "F":0, "J":0, "M":0, "A":0, "N":0]
    var type = ""
    
    // 1. survey loop i번째
    for i in 0..<N {
        let typeA = String(survey[i].first!)
        let typeB = String(survey[i].last!)
                
        switch choices[i] {
        case 1:
            score[typeA]! += 3
        case 2:
            score[typeA]! += 2
        case 3:
            score[typeA]! += 1
        case 5:
            score[typeB]! += 1
        case 6:
            score[typeB]! += 2
        case 7:
            score[typeB]! += 3
        default: break
        }
    }
    
    // 2. 최종 성격 유형 비교
    type += score["R"]! >= score["T"]! ? "R" : "T"
    type += score["C"]! >= score["F"]! ? "C" : "F"
    type += score["J"]! >= score["M"]! ? "J" : "M"
    type += score["A"]! >= score["N"]! ? "A" : "N"
    
    return type
}

// 성격 유형 검사지
// survey: 판단 지표 배열
// choices: 선택지
// 검사 결과를 순서대로 리턴

// survey: 1~1000
// "RT", "TR", "FC", "CF", "MJ", "JM", "AN", "NA"

// 모든 유형 점수를 더해서
// 더 높은 점수를 받은 성격 유형 판단
// 같으면 사전 순으로