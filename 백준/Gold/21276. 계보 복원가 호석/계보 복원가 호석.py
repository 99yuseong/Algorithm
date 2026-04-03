# N명의 사람
# 옆집 . 뒷집 . > 한 가족처럼
# 계보가 불탐
# 각자 기억하는 조상 

# 모든 조상을 완벽하게 > 그래프 형태

# 몇개의 가문이 존재?

# N: 1000명
# 6자리 이름, 중복 없음
# M: 100만개의 관계 [X <- Y]

# K, 가문의 개수
# Root의 이름 알파벳순 공백
# [(이름, 자식 수, [자식 이름])]


# 1000명과 50만개의 관계

# 가문의 개수라. 

# 시조 = indegree = 0
# 이름 : [자식]의 형태로 저장해야한다. 즉 그래프를 만들어야하고.
# indegree = 0 인 애들이 결국 > 시조이자 가문의 개수

# [X, Y]: X의 조상 중에 Y가 있다. 직접적인 관계는 아닌거네.
# Y -> X의 순서가 보장된다.

# 1. 우선 graph로 [] 순서를 보장하는 그래프를 만들고 indegree를 저장
# 2. indegree가 0인 사람 (가문의 시조)에 대하여,
# ---- K와 가문의 시조 리스트 정렬 가능 ----

# 조상 = 자신의 부모와 부모의 조상을 팝친 것
# 3. 자식의 수라는 건 ㅡ 자손의 수는 아니다. 

# 여기서 모든 조상을 완벽하게 기억한다 = 정렬조건이 반드시 1개다.
# 일단 정렬을 시켜라. 

from collections import deque

def solution(P, A):
    
    graph = {} # 조상 족보
    indegree = {} # 이름: indegree
    
    # 모든 indegree 초기화
    for p in P:
        graph.setdefault(p, [])
        indegree.setdefault(p, 0)
    
    # 그래프 생성 # O(50만)
    for x, y in A:
        graph[y].append(x)
        indegree[x] += 1
    
    # 조상 찾기
    roots = []
    for name in indegree.keys():
        if indegree[name] == 0:
            roots.append(name)
    
    # 위상정렬 > 반드시 1개의 관계가 나와야한다.
    # 정렬로 각 관계를 만들어 내라
    # 위상정렬을 하면서 depth를 먹여라.
    depth = {}
    queue = deque()
    
    for r in roots:
        queue.append(r)
        depth.setdefault(r, 0)
        
    while queue:
        cur = queue.popleft()
        
        # 자손들에 대해서
        for c in graph.get(cur, []):
            indegree.setdefault(c, 0)
            depth.setdefault(c, 0)
            indegree[c] -= 1
            depth[c] = max(depth[c], depth[cur]+1)
            
            if indegree[c] == 0:
                queue.append(c)
        
    for p in graph.keys():
        child = []
        for c in graph.get(p, []):
            if depth.get(p, 0) + 1 == depth.get(c, 0):
                child.append(c)
        graph[p] = child
    
    return (len(roots), sorted(roots), graph)

def main():
    N = int(input())
    P = list(input().split())
    M = int(input())
    A = []
    for _ in range(M):
        A.append(list(input().split()))
    K, root_names, graphs = solution(P, A)

    print(K)
    print(" ".join(root_names))

    for name in sorted(graphs.keys()):
        children = sorted(graphs.get(name, []))
        
        if children:
            print(name, len(children), " ".join(children))
        else:
            print(name, 0)

if __name__ == "__main__":
    main()