//
//  Calculator.swift
//  BMI Calculator
//
//  Created by wohagy on 28.01.2022.
//  Copyright © 2022 wohagy. All rights reserved.
//

import Foundation

struct Calculator {
    private var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let unRoundBMI = weight / (height * height)
        bmi = BMI(value: round(unRoundBMI * 100) / 100.0)
    }
    
    func getBMIvalue() -> BMI? {
        return bmi
    }
}
    
    

