//
//  ViewController.swift
//  PaceCalculator2
//
//  Created by Chad Doty on 11/20/17.
//  Copyright © 2017 DigitalLockbox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var mph: Double?
    
    @IBOutlet weak var txtMiles: UITextField!
    
    @IBOutlet weak var txtMinutes: UITextField!
    @IBOutlet weak var mphLabel: UILabel!
    @IBOutlet weak var paceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        self.view.addGestureRecognizer(tap)
    }

    @objc func hideKeyBoard(sender: UITapGestureRecognizer? = nil){
        view.endEditing(true)
    }
    
    var displayMPH: Double {
        get {
            return Double(mphLabel.text!)!
        }
        set {
            mphLabel.text = String(newValue)
        }
    }
    
    var displayPace: String {
        get {
            return paceLabel.text!
        }
        set {
            paceLabel.text = newValue
        }
    }
    
    private var brain = PaceCalculatorBrain()
    
    @IBAction func CalculatePace(_ sender: UIButton) {
        
        guard let tmpMiles = txtMiles.text, !tmpMiles.isEmpty else {
            //alert that the text field is empty
            return
        }
        
        guard let tmpMinutes = txtMinutes.text, !tmpMinutes.isEmpty else {
            //alert that the text field is empty
            return
        }
        
        guard let miles = Double(txtMiles.text!), miles >= 0 else {
            //alert you can't have neg
            return
        }
        
        guard let minutes = Double(txtMinutes.text!), minutes >= 0 else {
            //alert you can't have neg
            return
        }
        brain.performOperation(minutes,miles)
        
        if brain.resultMPH != nil {
            displayMPH = brain.resultMPH!
        }
        if brain.resultPace != nil {
            displayPace = brain.resultPace!
        }
        
        hideKeyBoard()
    }
    
    

}

