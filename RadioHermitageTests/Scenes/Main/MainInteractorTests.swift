//
//    MainInteractorTests.swift
//    RadioHermitage
//
//    Created by Artem Kovardin on 14.03.2020.
//    Copyright (c) 2020 Artem Kovardin. All rights reserved.
//

@testable import RadioHermitage
import XCTest

class MainInteractorTests: XCTestCase {
    // MARK: Subject under test

    var interactor: MainInteractor!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupMainInteractor()
    }

    override func tearDown() {
        interactor = nil
        super.tearDown()
    }

    // MARK: Test setup

    func setupMainInteractor() {
        interactor = MainInteractor()
    }

    // MARK: Test doubles

    class MainPresentationLogicSpy: MainPresentationLogic {

        var presentDataCalled = false
        var presentPlayCalled = false
        var presentStopCalled = false

        func presentData(response: Main.Model.Response.ResponseType) {
            presentDataCalled = true

            switch response {
            case .presentPlay:
                presentPlayCalled = true
            case .presentStop:
                presentStopCalled = true
            }
        }
    }

    // MARK: Tests

    func testTogglePlay() {
        // Given
        let presenter = MainPresentationLogicSpy()
        interactor.played = false
        interactor.presenter = presenter

        // When
        interactor.makeRequest(request: .toggle)

        // Then
        XCTAssertTrue(presenter.presentDataCalled)
        XCTAssertTrue(presenter.presentPlayCalled)
    }

    func testToggleStop() {
        // Given
        let presenter = MainPresentationLogicSpy()
        interactor.played = true
        interactor.presenter = presenter

        // When
        interactor.makeRequest(request: .toggle)

        // Then
        XCTAssertTrue(presenter.presentDataCalled)
        XCTAssertTrue(presenter.presentStopCalled)
    }

}
