//
//  Extension+UIColor.swift
//  SnapExplore
//
//  Created by Afir Thes on 07.02.2023.
//

import UIKit

public extension UIColor {
    convenience init(hex: String) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 1

        let hexColor = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        var valid = false

        if scanner.scanHexInt64(&hexNumber) {
            if hexColor.count == 8 {
                r = CGFloat((hexNumber & 0xFF00_0000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00FF_0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000_FF00) >> 8) / 255
                a = CGFloat(hexNumber & 0x0000_00FF) / 255
                valid = true
            } else if hexColor.count == 6 {
                r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255
                b = CGFloat(hexNumber & 0x0000FF) / 255
                valid = true
            }
        }

        #if DEBUG
            assert(valid, "UIColor initialized with invalid hex string")
        #endif

        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

extension UIImage {
    func getCropRation() -> CGFloat {
        size.width / size.height
    }
}
