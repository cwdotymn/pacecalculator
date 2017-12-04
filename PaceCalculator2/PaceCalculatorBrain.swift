//
//  PaceCalculatorBrain.swift
//  PaceCalculator
//
//  Created by Chad Doty on 11/13/17.
//  Copyright © 2017 DigitalLockbox. All rights reserved.
//

import Foundation
//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Chad Doty on 11/12/17.
//  Copyright © 2017 DigitalLockbox. All rights reserved.
//

struct PaceCalculatorBrain {
    
    private var mph: Double?
    private var pace: String?
    
    mutating func performOperation(_ minutes: Double, _ miles: Double) {
        mph = miles/(minutes/60)
        let y = (mph!*10000).rounded()/10000
        
        let tmpPace = (60 / y) * 60
        
        pace = formatMinutesPerMile(tmpPace)
        
    }
    
    private func formatMinutesPerMile(_ tmpPace: Double) -> String {
        
        let interval = tmpPace
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        
        let formattedString = formatter.string(from: TimeInterval(interval))!
        print(formattedString)
        return formattedString
    }
    
    var resultMPH: Double? {
        get {
            
            return mph
        }
    }
    
    var resultPace: String? {
        get {
            
            return pace
        }
    }
}

