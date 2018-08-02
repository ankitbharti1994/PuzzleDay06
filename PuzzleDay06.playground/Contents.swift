//: Playground - noun: a place where people can play

import Foundation
import XCTest
import PlaygroundSupport

class PuzzleDay06Test: XCTestCase {
    
    override func setUp() {
        super.setUp()
        PlaygroundPage.current.needsIndefiniteExecution = true
    }
    
    override func tearDown() {
        super.tearDown()
        PlaygroundPage.current.finishExecution()
    }
    
    func testAgainstSampleInput() {
        let puzzleExpectation = expectation(description: "puzzle expectation")
        processMemoryBank(sampleInput0) { (memoryBlocks, repeatedBlock, steps) in
            XCTAssertEqual(repeatedBlock, [2,4,1,2])
            XCTAssertEqual(steps, 5)
            puzzleExpectation.fulfill()
        }
        wait(for: [puzzleExpectation], timeout: 2)
    }
}

//PuzzleDay06Test().testAgainstSampleInput()

PlaygroundPage.current.needsIndefiniteExecution = true

processMemoryBank(sampleInput1) { (memoryBlocks, repeatedBlock, steps) in
    memoryBlocks
    repeatedBlock
    steps
    PlaygroundPage.current.finishExecution()
}
