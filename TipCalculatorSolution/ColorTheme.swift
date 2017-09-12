//
//  ColorTheme.swift
//  TipCalculatorSolution
//
//  Created by Chase Wang on 9/11/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

struct ColorTheme {
    
    // MARK: - Class Vars
    
    static let light = ColorTheme(isDefaultStatusBar: true,
                                  viewControllerBackgroundColor: .tcOffWhite,
                                  primaryColor: .tcReallyWhite,
                                  primaryTextColor: .tcOffBlack,
                                  secondaryColor: .tcSadBlue,
                                  accentColor: .tcHotMessPink,
                                  outputTextColor: .tcBackInBlack)
    
    static let dark = ColorTheme(isDefaultStatusBar: false,
                                 viewControllerBackgroundColor: .tcBackInBlack,
                                 primaryColor: .tcMediumBlack,
                                 primaryTextColor: .tcReallyWhite,
                                 secondaryColor: .tcBlueBlack,
                                 accentColor: .tcGoodVibesGreen,
                                 outputTextColor: .tcReallyWhite)
    
    // MARK: - Instance Vars
    
    let isDefaultStatusBar: Bool
    let viewControllerBackgroundColor: UIColor
    
    let primaryColor: UIColor
    let primaryTextColor: UIColor
    
    let secondaryColor: UIColor
    
    let accentColor: UIColor
    let outputTextColor: UIColor
}
