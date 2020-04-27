//
//  BottomMessageTests.swift
//  UIElements_Tests
//
//  Copyright © 2019 Banco de Crédito e Inversiones. All rights reserved.
//

@testable import BasicUIElements
import XCTest

class BottomMessageTests: XCTestCase {

    var sut: BottomMessage?

    override func tearDown() {
        sut?.removeFromSuperview()
        super.tearDown()
    }

    func testStringMessageDismissable() {
        // Given
        sut = BottomMessage(
            withTitle: "Test Title",
            andMessage: "Test Message",
            buttonText: "OK",
            style: .basic,
            action: #selector(bottomMessageAction),
            self,
            isDismissable: true,
            showHeaderCloseButton: true
        )
        // When
        sut?.animateBackground(UIViewMock.self)
        // Then
        XCTAssertEqual(
            sut!.background.backgroundColor,
            UITheme.Style.Colors.Extras.shadowLevel3,
            "the animation should change the color"
        )
    }

    func testRemoveFromSuperView() {
        // Given
        sut = BottomMessage(
            withTitle: "Test Title",
            andMessage: "Test Message",
            buttonText: "OK",
            style: .basic,
            action: #selector(bottomMessageAction),
            self,
            isDismissable: true,
            showHeaderCloseButton: true
        )
        // When
        sut?.animateViewMessageBoxBackgroundRemove(UIViewMock.self)
        // Then
        XCTAssertEqual(
            sut!.background.backgroundColor,
            UIColor.clear,
            "the animation should change the color"
        )
    }

    @objc
    func bottomMessageAction() {

    }

}
