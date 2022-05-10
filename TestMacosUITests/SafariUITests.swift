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

    func testLaunchSafariAndWait() {
        application.launch()
        let isForeground = application.wait(for: .runningForeground, timeout: 20)
        XCTAssertTrue(isForeground)
        application.terminate()
    }
}
