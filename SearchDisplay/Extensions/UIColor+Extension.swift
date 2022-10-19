//
//  ViewColor.swift
//  SearchDisplay
//
//  Created by Chris Kim on 10/17/22.
//

import Foundation
import UIKit

extension UIColor {
    
    func returnImageColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        let newRed = red / 255
        let newGreen = green / 255
        let newBlue = blue / 255
        
        return UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    
    var searchViewBackgroundColor: UIColor {
        return UIColor(red: 246 / 255, green: 246 / 255, blue: 246 / 255, alpha: 1.0)
    }
    
    var searchViewTextColor: UIColor {
        return UIColor(red: 193 / 255, green: 193 / 255, blue: 193 / 255, alpha: 1.0)
    }
    
    
    var tagViewTextColor: UIColor {
        return UIColor(red: 108 / 255, green: 100 / 255, blue: 100 / 255, alpha: 1.0)
    }
}
