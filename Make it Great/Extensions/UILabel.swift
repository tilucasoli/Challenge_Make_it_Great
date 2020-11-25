//
//  UILabel.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 24/11/20.
//
import UIKit

extension UILabel {
    // The line Height need UILabel have a text
    func setLineHeight(lineHeightMultiple: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeightMultiple

      self.attributedText = NSMutableAttributedString(string: text!, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
}
