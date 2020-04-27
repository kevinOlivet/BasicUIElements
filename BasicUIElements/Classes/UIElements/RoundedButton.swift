//
//  RoundedButton.swift
//  UIElements
//
//  Copyright © 2019 Jon Olivet
//

import BasicCommons

open class RoundedButton: UIButton {
    @IBInspectable var color: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }

    override open func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateView() {
        self.layer.cornerRadius = 0.0
        self.layer.borderWidth = 0.0
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
    }
}
