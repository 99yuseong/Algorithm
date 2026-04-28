import heapq

def solution(n, paths, gates, summits):
        
    # 1. graph 생성 - O(20만)
    graph = {}
    for i, j, w in paths:
        graph.setdefault(i, []).append((j, w))
        graph.setdefault(j, []).append((i, w))
        
    # 2. 모든 gates에 대해서
    
    gates = set(gates)
    summits = set(summits)
    
    INF = float('inf')
    
    pq = []
    dist = [INF] * (n+1)
    
    result = []
        
    for gate in gates:
        heapq.heappush(pq, (0, gate))
        dist[gate] = 0
    
    while pq:
        intensity, cur_node = heapq.heappop(pq)
            
        if dist[cur_node] < intensity:
            continue
            
        if cur_node in summits:
            result.append([intensity, cur_node])        
            continue
            
        for node, c in graph.get(cur_node, []):
            if node in gates:
                continue
            
            next_intensity = max(intensity, c)
            
            if next_intensity < dist[node]:
                dist[node] = next_intensity
                heapq.heappush(pq, (next_intensity, node))
                
    
    result.sort()
    
    return result[0][::-1]