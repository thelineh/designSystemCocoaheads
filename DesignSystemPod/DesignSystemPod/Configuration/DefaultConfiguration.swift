//
//  DefaultConfiguration.swift
//  DesignSystemPod
//
//  Created by Aline Ghizzi on 26/01/20.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit

public class DefaultConfiguration: ThemeConfigurationProtocol {
    public var color: ColorStyle {
        return DefaultColorStyle()
    }
    
    public var font: FontConfiguration {
        return DefaultFontConfiguration()
    }
    
    public var enabledCornerRadius: Bool {
        return true
    }
    
    public var cornerRadiusType: CornerRadiusType {
        return .three
    }
}

public class DefaultFontConfiguration: FontConfiguration {
    public var regular: CustomFonts {
        return .openSansRegular
    }
    
    public var bold: CustomFonts  {
        return .openSansBold
    }
    
    public var semibold: CustomFonts  {
        return .openSansSemiBold
    }
}

public class DefaultColorStyle: ColorStyle {
    public var brandColor: UIColor {
        return .salmon
    }
    
    public var primaryColor: UIColor {
        return .podWhite
    }
    
    public var secondaryColor: UIColor {
        return .warmGray
    }
    
    public var tertiaryColor: UIColor {
        return .silverGray
    }
    
    public var darkColor: UIColor {
        return .neroGray
    }
}

