//
//    MainWorkerTests.swift
//    RadioHermitage
//
//    Created by Artem Kovardin on 14.03.2020.
//    Copyright (c) 2020 Artem Kovardin. All rights reserved.
//

@testable import RadioHermitage
import XCTest

class MainServiceTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: MainService!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupMainService()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupMainService() {
        sut = MainService()
    }
    
    // MARK: Test doubles
    
    // MARK: Tests
    
    func testModel() {
        // Given
        
        // When
        
        // Then
    }
    
}
