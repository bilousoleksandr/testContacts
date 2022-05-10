//
//  SafariUITests.swift
//  TestMacosUITests
//
//  Created by Aleksandr.Bilous on 10.05.2022.
//  Copyright © 2022 Marentilo. All rights reserved.
//

import XCTest

final class SafariUITests: XCTestCase {
    private let application = XCUIApplication(bundleIdentifier: "com.apple.Safari")
    
    override func setUp() {
        super.setUp()
        application.launch()
    }

    override func tearDown() {
        super.tearDown()
        application.terminate()
    }
    func testLaunchSafariAndWait() {
        let isForeground = application.wait(for: .runningForeground, timeout: 20)
        let button = application.toolbars.firstMatch.buttons["Go back"]
        
        XCTAssertTrue(isForeground)
        XCTAssertTrue(button.isHittable)
    }
}
