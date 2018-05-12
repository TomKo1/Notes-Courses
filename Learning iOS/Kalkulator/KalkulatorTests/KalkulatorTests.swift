//
//  KalkulatorTests.swift
//  KalkulatorTests
//
//  Created by Tomasz Kot on 19.04.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

import XCTest
@testable import Kalkulator

class KalkulatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let calculatorLogic = KalkulatorLogic()
        XCTAssertEqual(calculatorLogic.add(fistNumber: 1, secondNumber: 2),3)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            // fragment kodu ktorego wydajnosc bedziemy sprawdzac
            // dziesieciokrotnie i sprawdza w jakim czasie
            // poszczegolne wywolania funkcji sa wykonywane
            let calculatorLogic = KalkulatorLogic()
            XCTAssertEqual(calculatorLogic.add(fistNumber: 1, secondNumber: 2),3)
            
        }
    }
    
}
