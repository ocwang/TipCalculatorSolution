//
//  UIColor+TipCalc.swift
//  TipCalculatorSolution
//
//  Created by Chase Wang on 9/11/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit.UIColor

extension UIColor {
    /*
     * Converts hex integer into UIColor
     *
     * Usage: UIColor(hex: 0xFFFFFF)
     *
     */
    
    private convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
    // MARK: Brand Colors
    
    static var tcSadBlue: UIColor {
        return UIColor(hex: 0x2B2D5C)
    }
    
    static var tcOffWhite: UIColor {
        return UIColor(hex: 0xF7F7F7)
    }
    
    static var tcHotMessPink: UIColor {
        return UIColor(hex: 0xFA5385)
    }
    
    static var tcOffBlack: UIColor {
        return UIColor(hex: 0x4A4A4A)
    }
    
    static var tcBackInBlack: UIColor {
        return UIColor(hex: 0x232A32)
    }
    
    static var tcMediumBlack: UIColor {
        return UIColor(hex: 0x262D37)
    }
    
    static var tcBlueBlack: UIColor {
        return UIColor(hex: 0x343C49)
    }
    
    static var tcGoodVibesGreen: UIColor {
        return UIColor(hex: 0x59DAA4)
    }
    
    static var tcBlack: UIColor {
        return UIColor.black
    }
    
    static var tcReallyWhite: UIColor {
        return UIColor.white
    }
}
