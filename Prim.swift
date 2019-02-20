// https://www.hackerrank.com/challenges/primsmstsub/problem
// Complete the prims function below.
func prims(n: Int, edges: [[Int]], start: Int) -> Int {
    var seenSet = Set<Int>()
    var graph = [Int:[(Int, Int)]]()
    for edge in edges {
        var newSet = graph[edge[0]] ?? [(Int, Int)]()
        newSet.append((edge[1], edge[2]))
        graph[edge[0]] = newSet
        
        newSet = graph[edge[1]] ?? [(Int, Int)]()
        newSet.append((edge[0], edge[2]))
        graph[edge[1]] = newSet
    }
    var currentValue = start
    var currentPriority = 0
    let priorityQueue = PriorityQueue()
    seenSet.insert(currentValue)
    var result = currentPriority
    for edge in graph[currentValue] ?? [] {
        priorityQueue.insert(edge.0, priority: edge.1)
    }
    while !priorityQueue.isEmpty && seenSet.count != n {
        (currentValue, currentPriority) = priorityQueue.removeMin()
        guard !seenSet.contains(currentValue) else { continue }
        // print([currentPriority]+priorityQueue.priorities)
        seenSet.insert(currentValue)
        result += currentPriority
        for edge in graph[currentValue] ?? [] {
            priorityQueue.insert(edge.0, priority: edge.1)
        }
    }
    return result
}
