//
//  UIColor.swift
//  ClearScoreTest
//
//  Created by Anthony Scott on 2019/11/23.
//
//  Scanned the colours from the screenshot supplied in the brief, created a new colour ("gold") from the hex code.

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Red componen invalid")
        assert(green >= 0 && green <= 255, "Green component invalid")
        assert(blue >= 0 && blue <= 255, "Blue component invalid")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(_ hexValue: Int) {
        self.init(red:(hexValue >> 16) & 0xff, green:(hexValue >> 8) & 0xff, blue:hexValue & 0xff)
    }
    
    static let gold = UIColor(0xf3ca7b) // score label color (approximately?)
    
}
