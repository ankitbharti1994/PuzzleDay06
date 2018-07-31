//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport
import XCTest

let adventInput = [4, 10, 4, 1, 8, 4, 9, 14, 5, 1, 14, 15, 0, 15, 3, 5]

let sampleInput = [0, 2, 7, 0]

class PuzzleDay06Test: XCTestCase {
    
    func testAgainstSampleInput() {
        let puzzleExpectation = expectation(description: "puzzle day 06")
        processMemoryBlock(queue: .global(qos: .utility), input: sampleInput) {
            print("matched array: \($0) and steps taken: \($1)")
            XCTAssertEqual($0, [2,4,1,2])
            XCTAssertEqual($1, 5)
            puzzleExpectation.fulfill()
        }
        wait(for: [puzzleExpectation], timeout: 2)
    }
}


PlaygroundPage.current.needsIndefiniteExecution = true
//PuzzleDay06Test().testAgainstSampleInput()

processMemoryBlock(queue: .global(qos: .utility), input: sampleInput) {
    print("matched array: \($0) and steps taken: \($1)")
    PlaygroundPage.current.finishExecution()
}
