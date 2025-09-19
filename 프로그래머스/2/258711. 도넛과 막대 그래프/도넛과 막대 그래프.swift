func solution(_ edges: [[Int]]) -> [Int] {
    var maxNode = 0
    for edge in edges {
        maxNode = max(maxNode, edge[0], edge[1])
    }
    
    var degree = Array(repeating: (in: 0, out: 0), count: maxNode + 1)
    
    for edge in edges {
        degree[edge[0]].out += 1
        degree[edge[1]].in += 1
    }
    
    var stick = 0
    var eight = 0
    var created = 0
    var totalGraphs = 0
    
    for node in 1...maxNode {
        let (inDeg, outDeg) = degree[node]
        
        if inDeg == 0 && outDeg >= 2 {
            created = node
            totalGraphs = outDeg
        } else if outDeg == 0 && inDeg > 0 {
            stick += 1
        } else if outDeg == 2 {
            eight += 1
        }
    }
    
    let donuts = totalGraphs - stick - eight
    return [created, donuts, stick, eight]
}