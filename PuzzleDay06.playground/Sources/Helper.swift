import Foundation

struct MemoryBanks {
    
    private(set) var block: [[Int]] = []
    
    mutating func add(_ block: [Int]) {
        self.block.append(block)
    }
    
    mutating func shouldAdd(_ memoryBlock: [Int]) -> Bool {
        let specificMemoryBlocks = block.filter { return $0 == memoryBlock }
        return specificMemoryBlocks.count <= 1
    }
}

public func processMemoryBlock(queue: DispatchQueue = DispatchQueue.global(), input: [Int], _ completion: @escaping ([Int],Int) -> Void) {
    
    queue.async {
        var memoryBanks = MemoryBanks()
        let length = input.count - 1
        var latestInput = input
        
        while memoryBanks.shouldAdd(latestInput) {
            var maxValue = latestInput.max()!
            let indexOfMaxValue = latestInput.index(of: maxValue)!
            var index = indexOfMaxValue + 1
            
            var affectedValueCount = 0
            
            outer: while maxValue > 0 {
                if (index < input.count || index < indexOfMaxValue) && (index != indexOfMaxValue) {
                    latestInput[index] += 1
                    index++
                    maxValue--
                    affectedValueCount++
                }else if index == indexOfMaxValue && index <= length {
                    // TODO:- break if the distribution completed
                    if affectedValueCount % length == 0 && maxValue < length {
                        //                        latestInput[indexOfMaxValue] = maxValue
                        //                        memoryBanks.add(latestInput)
                        break outer
                    }else {
                        index++
                    }
                }else {
                    index = 0
                }
            }
            latestInput[indexOfMaxValue] = maxValue
            memoryBanks.add(latestInput)
        }
        completion(latestInput,memoryBanks.block.count)
    }
}


extension Int {
    postfix static func --(value: inout Int) {
        value = value - 1
    }
    postfix static func ++(value: inout Int) {
        value = value + 1
    }
}
