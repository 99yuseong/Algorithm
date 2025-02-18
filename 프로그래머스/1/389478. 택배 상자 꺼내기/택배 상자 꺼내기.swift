import Foundation

func solution(_ n:Int, _ w:Int, _ num:Int) -> Int {
    
    // n: 2~100개
    // w: 1~10칸
    // num: 꺼낼 박스 번호
    
    // n-1 / w -> 짝수: 오른쪽으로, 홀수: 왼쪽으로
    var top = (n-1) / w + 1
    var isTopRight = top % 2 == 1
    var topBox = (n-1) % w + 1
    
    var target = (num-1) / w + 1
    var isTargetRight = target % 2 == 1
    var targetBox = (num-1) % w + 1
    
    if (isTargetRight && isTopRight) || (!isTargetRight && !isTopRight) { 
        return top - target + (topBox >= targetBox ? 1 : 0)   
    } else {
        return top - target + (topBox >= w-targetBox ? 1 : 0)
    }
}