class PriorityQueue {
    var heap = [Int]()
    var priorities = [Int]()
    
    func siftDown() {
        var current = 0
        while current < heap.count - 1 {
            let right = current*2 + 2
            let left = current*2 + 1
            var min = 0
            if left < heap.count && right < heap.count {
                if priorities[left] < priorities[right] {
                    min = left
                } else {
                    min = right
                }
            } else if left < heap.count {
                min = left
            } else if right < heap.count {
                min = right
            } else {
                return
            }
            if priorities[min] < priorities[current] {
                priorities.swapAt(min, current)
                heap.swapAt(min, current)
                current = min
            } else {
                return
            }
        }
    }
    
    func siftUp() {
        var current = heap.count - 1
        while current > 0 {
            let parent = (current - 1) / 2
            if parent > -1 && priorities[parent] > priorities[current] {
                priorities.swapAt(parent, current)
                heap.swapAt(parent, current)
            }
            current = parent
        }
        
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    func insert(_ value: Int, priority: Int) {
        heap.append(value)
        priorities.append(priority)
        siftUp()
    }
    
    func removeMin() -> (Int, Int) {
        guard heap.count > 1 else { return (heap.removeLast(), priorities.removeLast()) }
        heap.swapAt(0, heap.count - 1)
        priorities.swapAt(0, priorities.count - 1)
        let toReturn = (heap.removeLast(), priorities.removeLast())
        
        siftDown()
        return toReturn
    }
}
