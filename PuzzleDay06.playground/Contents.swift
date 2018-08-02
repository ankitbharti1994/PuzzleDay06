//: Playground - noun: a place where people can play

import Foundation
import XCTest

let adventInput = [4, 10, 4, 1, 8, 4, 9, 14, 5, 1, 14, 15, 0, 15, 3, 5]

let sampleInput = [0, 2, 7, 0]

class PuzzleDay06Test: XCTestCase {
    
    func testAgainstSampleInput() {
        let memoryBankResult = processMemoryBank(sampleInput)
        XCTAssertEqual(memoryBankResult.0, [2,4,1,2])
        XCTAssertEqual(memoryBankResult.1, 5)
    }
}


//PuzzleDay06Test().testAgainstSampleInput()


let memoryBankResult = processMemoryBank(sampleInput)
memoryBankResult.0
memoryBankResult.1
