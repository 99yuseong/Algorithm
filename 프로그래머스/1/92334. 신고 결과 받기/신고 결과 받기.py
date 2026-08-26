from collections import defaultdict

def solution(id_list, report, k):
    
    d = defaultdict(set)
    
    for r in set(report):
        a, b = r.split()
        d[b].add(a)

        
    d2 = defaultdict(int)
    
    for key, val in d.items():
        if len(val) >= k:
            for a in val:
                d2[a] += 1
        
    answer = []
    
    for id in id_list:
        answer.append(d2[id])

    return answer