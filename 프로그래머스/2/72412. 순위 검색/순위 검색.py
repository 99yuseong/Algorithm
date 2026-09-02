# @time -1

from collections import defaultdict

def solution(info, query):
    
    lan = ["cpp", "java", "python", "-"]
    job = ["backend", "frontend", "-"]
    exp = ["junior", "senior", "-"]
    food = ["chicken", "pizza", "-"]
    
    dic = defaultdict(list)
    
    for i in info:
        l, j, e, f, s = i.split()
        
        for a in [l, "-"]:
            for b in [j, "-"]:
                for c in [e, "-"]:
                    for d in [f, "-"]:
                        dic[a+b+c+d].append(int(s))
                        
    for d, v in dic.items():
        v.sort()
    
    answer = []
    
    for q in query:
        
        l, j, e, f, s = [x for x in q.split() if x != "and"]
        s = int(s)
        scores = dic[l+j+e+f]
        
        st = 0
        en = len(scores)
        
        while st < en:
            mid = (st + en) // 2
            
            if scores[mid] < s:
                st = mid + 1
            else:
                en = mid
        
        answer.append(len(scores) - st)
        
    return answer