//
//  ColorExtensions.swift
//  Inudoption
//
//  Created by Ivan Lorenzana Belli on 20/07/22.
//

import Foundation
import SwiftUI

// Extensions
// Create an extension of Color that receives a Hex Value and converts it into an usable color

extension Color{
    init(hex: Int, alpha: Float){
        let redComponent = (hex >> 16) & 0xFF
        let greenComponent = (hex >> 8) & 0xFF
        let blueComponent = hex & 0xFF
        
        // I can cast Int into CGFloat
        let uiColor = UIColor(red: CGFloat(redComponent)/255,
                              green: CGFloat(greenComponent)/255,
                              blue: CGFloat(blueComponent)/255,
                              alpha: CGFloat(alpha))
        
        self.init(uiColor)
    }
}
// Properties
extension Color{
    static let biomedPrimary = Color(hex: 0xC10000, alpha: 1.0)
    static let biomedButton = Color(hex: 0xA23971, alpha: 1.0)
    static let spacerGray = Color(hex: 0xA5A5A5, alpha: 0.9)
    static let biomedBlack = Color(hex: 0x393939, alpha: 1.0)
}
