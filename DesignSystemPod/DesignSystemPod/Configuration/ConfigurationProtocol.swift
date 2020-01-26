//
//  ConfigurationProtocol.swift
//  DesignSystemPod
//
//  Created by Aline Ghizzi on 26/01/20.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit

public protocol FontConfiguration {
    var regular: CustomFonts { get }
    var bold: CustomFonts { get }
    var semibold: CustomFonts { get }
}

// TODO: Maybe later
//public protocol LayoutConfiguration {
//    var edgeInsets: UIEdgeInsets { get }
//    var verticalSpacing: CGFloat { get }
//    var horizontalSpacing: CGFloat { get }
//}

public protocol ColorStyle {
    var brandColor: UIColor { get }
    var primaryColor: UIColor { get }
    var secondaryColor: UIColor { get }
    var tertiaryColor: UIColor { get }
    var darkColor: UIColor { get }
}

public enum CornerRadiusType: Int {
    case zero
    case one
    case two
    case three
    case four
    case five
    
    var size: CGFloat {
        return CGFloat(self.rawValue)
    }
}

public protocol ThemeConfigurationProtocol {
    var color: ColorStyle { get }
    var font: FontConfiguration { get }
    var enabledCornerRadius: Bool { get }
    var cornerRadiusType: CornerRadiusType { get }
}

public extension ThemeConfigurationProtocol {
    var cornerRadiusSize: CGFloat {
        if enabledCornerRadius {
            return cornerRadiusType.size
        } else {
            return 0.0
        }
    }
}
