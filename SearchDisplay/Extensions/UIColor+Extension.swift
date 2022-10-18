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
}
