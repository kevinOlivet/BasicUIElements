//
//  ToastViewTests.swift
//  UIElements_Tests
//
//  Copyright © 2019 Banco de Crédito e Inversiones. All rights reserved.
//

@testable import BasicCommons
@testable import BasicUIElements
import XCTest

class ToastViewTests: XCTestCase {

    var sut: ToastView?

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testInitString() {
        sut = ToastView(withTitle: "test title", andMessage: "test message")
        XCTAssertEqual(sut!.title!, "test title")
        XCTAssertEqual(sut!.message!, "test message")
    }

    func testInitAttrString() {
        sut = ToastView(
            withAttributedTitle: NSAttributedString(string: "test title"),
            andAttributedMessage: NSAttributedString(string: "test message")
        )
        XCTAssertEqual(sut!.title!, "test title")
        XCTAssertEqual(sut!.message!, "test message")
    }

    func testDefaultAnimationData() {
        sut = ToastView(withTitle: "test title", andMessage: "test message")
        XCTAssertEqual(sut!.dismissAnimationTime, 3)
        XCTAssertTrue(sut!.isAutoRemove)
    }

    func testSetDefaultAnimationData() {
        sut = ToastView(
            withTitle: "test title",
            andMessage: "test message",
            autoRemove: false,
            dimissAnimationTime: 4
        )
        XCTAssertEqual(sut!.dismissAnimationTime, 4)
        XCTAssertFalse(sut!.isAutoRemove)
    }

    func testShow() {
        sut = ToastView(withTitle: "test title", andMessage: "test message")
        sut?.show()
        if let subViews = UIApplication.shared.keyWindow?.subviews {
            XCTAssertTrue(subViews.contains(sut!))
        }
    }

    func testHide() {
        sut = ToastView(withTitle: "test title", andMessage: "test message", autoRemove: false)
        sut?.show()
        wait(for: [], timeout: 5)
        sut?.hide()
        wait(for: [], timeout: 5)
        if let subViews = UIApplication.shared.keyWindow?.subviews {
            XCTAssertFalse(subViews.contains(sut!))
        }
    }

}
