//
//  ViewController.swift
//  celsius-fah-Segment
//
//  Created by Anish on 8/28/20.
//  Copyright © 2020 Anish Kodeboyina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureTextField: UITextField!
    
    var enteredTemperature: String?
    var convertedValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        temperatureTextField.keyboardType = .decimalPad
        view.backgroundColor = UIColor.orange
    }
    
    func convertValue(isCelsius: Bool) -> String? {
        if let entertedTemp = enteredTemperature,
            let convertedDoubleValueOfTemp = Double(entertedTemp) {
            
            switch !isCelsius {
            case true:
                let value = (convertedDoubleValueOfTemp * 1.8) + 32
                convertedValue = String(value.rounded())
            case false:
                let value = (convertedDoubleValueOfTemp - 32 ) / 1.8
                convertedValue = String(value.rounded())
            }
        }
        
        return convertedValue
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        temperatureTextField.resignFirstResponder()
        
        if let text = temperatureTextField.text {
            enteredTemperature = text
            temperatureLabel.text = enteredTemperature
        }
    }
    
    @IBAction func segmentedControlTapped(_ sender: Any) {
        temperatureTextField.text = ""
        
        let selectedIndex = segmentedControl.selectedSegmentIndex
        assignConvertedValue(isCelsius: selectedIndex == 0 ? true : false)
//
//
//        switch segmentedControl.selectedSegmentIndex {
//        case 0:
//            assignConvertedValue(isCelsius: true)
//        default:
//            assignConvertedValue(isCelsius: false)
//        }
    }
    
    func assignConvertedValue(isCelsius: Bool) {
        if let value = convertValue(isCelsius: isCelsius) {
            temperatureLabel.text = value
        }
    }
}

