//
//  ViewController.swift
//  TipCalculatorSolution
//
//  Created by Chase Wang on 9/11/17.
//  Copyright © 2017 Make School. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    fileprivate var isDefaultStatusBar = true
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isDefaultStatusBar ? .default : .lightContent
    }
    
    // MARK: - Subviews
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    
    @IBOutlet weak var inputContainerView: UIView!
    @IBOutlet weak var billAmountTextField: BillAmountTextField!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var outputContainerView: UIView!
    @IBOutlet weak var tipAmountTitleLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setTheme(isDark: false)
        
        billAmountTextField.buttonTapAction = {
            self.calculate()
        }
    }
    
    
    
    @IBAction func themeToggled(_ sender: UISwitch) {
        setTheme(isDark: sender.isOn)
    }
    
    @IBAction func tipPercentChanged(_ sender: UISegmentedControl) {
        calculate()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        clear()
    }
}

// MARK: - Styling / Theming

extension ViewController {
    func setupView() {
        headerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        headerView.layer.shadowOpacity = 0.05
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowRadius = 35
        
        inputContainerView.layer.cornerRadius = 8
        inputContainerView.layer.masksToBounds = true
        
        outputContainerView.layer.cornerRadius = 8
        outputContainerView.layer.masksToBounds = true
        outputContainerView.layer.borderWidth = 1
        
        resetButton.layer.cornerRadius = 8
        resetButton.layer.masksToBounds = true
    }
    
    func setTheme(isDark: Bool) {
        let theme = isDark ? ColorTheme.dark : ColorTheme.light
        
        view.backgroundColor = theme.viewControllerBackgroundColor
        
        headerView.backgroundColor = theme.primaryColor
        titleLabel.textColor = theme.primaryTextColor
        
        inputContainerView.backgroundColor = theme.secondaryColor
        
        billAmountTextField.tintColor = theme.accentColor
        tipSegmentedControl.tintColor = theme.accentColor
        
        outputContainerView.backgroundColor = theme.primaryColor
        outputContainerView.layer.borderColor = theme.accentColor.cgColor
        
        tipAmountTitleLabel.textColor = theme.primaryTextColor
        totalTitleLabel.textColor = theme.primaryTextColor
        
        tipAmountLabel.textColor = theme.outputTextColor
        totalCostLabel.textColor = theme.outputTextColor
        
        resetButton.backgroundColor = theme.secondaryColor
        
        isDefaultStatusBar = theme.isDefaultStatusBar
        setNeedsStatusBarAppearanceUpdate()
    }
}

// MARK: - IBActions

extension ViewController {
    
}

// MARK: - Logic

extension ViewController {
    func calculate() {
        if billAmountTextField.isFirstResponder {
            billAmountTextField.resignFirstResponder()
        }
        
        guard let billAmountText = billAmountTextField.text,
            let billAmount = Double(billAmountText) else {
                clear(resetTipPercent: false)
                return
        }
        
        let tipPercentage: Double
        switch tipSegmentedControl.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
        case 1:
            tipPercentage = 0.18
        case 2:
            tipPercentage = 0.20
        default:
            preconditionFailure("Unexpected index.")
        }
        
        let roundedBillAmount = roundAmount(billAmount)
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = roundAmount(tipAmount)
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        // update UI
        billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
        tipAmountLabel.text = String(format: "%.2f", roundedTipAmount)
        totalCostLabel.text = String(format: "%.2f", totalAmount)
    }
    
    func clear(resetTipPercent: Bool = true) {
        billAmountTextField.text = nil
        
        // update UI
        if resetTipPercent {
            tipSegmentedControl.selectedSegmentIndex = 0
        }
        tipAmountLabel.text = "$0.00"
        totalCostLabel.text = "$0.00"
    }
    
    private func roundAmount(_ amount: Double) -> Double {
        return round(100 * amount) / 100
    }
}
