//
//  UIFont+Extension.swift
//  SearchDisplay
//
//  Created by Chris Kim on 10/17/22.
//

import Foundation
import UIKit


extension UIFont {

    public enum NanumGothicType: String {
        case light = "-Reguler"
        case bold = "-Bold"
    }

    static func nanumGothic(_ type: NanumGothicType = .light, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "NanumGothic\(type.rawValue)", size: size)!
    }
}
