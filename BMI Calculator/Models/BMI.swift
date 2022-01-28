//
//  BMI.swift
//  BMI Calculator
//
//  Created by Macbook on 28.01.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct BMI {
    var value: Float
    
    var status: String {
        get {
            switch value {
            case 0..<18.5:
                return "Underweight"
            case 18.5..<24.9:
                return "Normal"
            case 24.9...20000:
                return "Overweight"
            default:
                return "Error #for_status"
            }
        }
    }
    var color: UIColor {
        get {
            switch status {
            case "Underweight":
                return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            case "Normal":
                return #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            case "Overweight":
                return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            default:
                return #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
            }
        }
    }
    var advice: String {
        get {
            switch status {
            case "Underweight":
                return "Eat more snacks"
            case "Normal":
                return "You are good :)"
            case "Overweight":
                return "Eat lesser snacks"
            default:
               return "Error #for_advice"
            }
        }
    }
    
}
