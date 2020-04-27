//
//  UIViewMock.swift
//  UIElements
//
//  Copyright © 2019 Banco de Crédito e Inversiones. All rights reserved.
//

import UIKit

class UIViewMock: UIView {
    static var animateCount = 0

    override open class func animate(
        withDuration duration: TimeInterval,
        animations: @escaping () -> Void) {
        animateCount += 1
        animations()
    }

    override open class func animate(
        withDuration duration: TimeInterval,
        animations: @escaping () -> Void,
        completion: ((Bool) -> Void)? = nil) {
        animateCount += 1
        animations()
        completion!(true)
    }
}
