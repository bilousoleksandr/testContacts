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

final class SetappDiscoveryTests: XCTestCase {
    private let application = XCUIApplication(bundleIdentifier: "com.setapp.DesktopClient")
    private lazy var launcher = XCUIApplication(url: URL(fileURLWithPath:"/Users/aleksandr.bilous/Library/Application Support/Setapp/LaunchAgents/SetappLauncher.app"))
    
    override func setUp() {
        super.setUp()
        application.launch()
    }

    override func tearDown() {
        super.tearDown()
        application.terminate()
    }
    func testLauncher() {
        let isForeground = application.wait(for: .runningForeground, timeout: 20)
        launcher.typeKey(.space, modifierFlags: [.control, .shift])
        sleep(2)
        let button = launcher.buttons["launcher.open-setapp.button"]
        
        XCTAssertTrue(isForeground)
        XCTAssertTrue(button.isHittable)
    }
}
