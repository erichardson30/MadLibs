//
//  ViewController.swift
//  MadLibs
//
//  Created by Eric on 1/27/16.
//  Copyright © 2016 Eric Richardson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var textFields: [UITextField]!
    
    @IBOutlet weak var pastTenseInput: UITextField!
    @IBOutlet weak var singleNounInput: UITextField!
    @IBOutlet weak var pluralNounInput: UITextField!
    @IBOutlet weak var phraseInput: UITextField!
    @IBOutlet weak var locationSegmentControl: UISegmentedControl!
    @IBOutlet weak var finishedLibs: UITextView!
    @IBOutlet weak var generateMadLib: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFields = [pastTenseInput, singleNounInput, pluralNounInput, phraseInput]

    }

    @IBAction func buttonPressed(sender: AnyObject) {
        var location = ""
        
        if locationSegmentControl.selectedSegmentIndex == 0 {
            location = "bar"
        } else if locationSegmentControl.selectedSegmentIndex == 1 {
            location = "club"
        } else {
            location = "coffee shop"
        }
        
        finishedLibs.text = "One day at the \(location) a \(singleNounInput.text!) \(pastTenseInput.text!) some \(pluralNounInput.text!) and said \(phraseInput.text!)"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let inputArray = textFields as NSArray
        let arrayIndex = inputArray.indexOfObject(textField)
        
        if arrayIndex < inputArray.count - 1 {
            let newInput = inputArray[arrayIndex + 1] as! UITextField
            newInput.becomeFirstResponder()
            let doneInput = inputArray[arrayIndex] as! UITextField
            doneInput.backgroundColor = UIColor.blueColor()
        } else {
            textField.resignFirstResponder()
            textField.backgroundColor = UIColor.grayColor()
        }
        return true
    }

}

