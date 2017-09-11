//
//  BillAmountTextField.swift
//  TipCalculatorSolution
//
//  Created by Chase Wang on 9/11/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class BillAmountTextField: UITextField {
    
    // MARK: - Properties
    
    var buttonTapAction: (() -> Void)?
    
    // MARK: - View Lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let toolbar: UIToolbar = UIToolbar()
        
        let leadingFlex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let trailingFlex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let calculateButton = UIBarButtonItem(title: "Calculate Tip", style: .done, target: self, action: #selector(doneButtonTapped(_:)))
        toolbar.items = [leadingFlex, calculateButton, trailingFlex]
        
        // resizes toolbar
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }
    
    @objc private func doneButtonTapped(_ sender: UIBarButtonItem) {
        buttonTapAction?()
    }
}
