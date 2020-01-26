//
//  UIFont+Pod.swift
//  DesignSystemPod
//
//  Created by Aline Ghizzi on 26/01/20.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit

enum RegisterFontError: Error {
    case invalidFontFile
    case fontPathNotFound
    case initFontError
    case registerFailed
}

extension UIFont {
    static func nonNilFont(name fontName: String, size fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: fontName, size: fontSize) else {
            fatalError("\(fontName) was not found")
        }
        return font
    }
    
    static func register(fileNameString: String, type: String) -> RegisterFontError? {
        let frameworkBundle = Bundle(for: FontHelper.self)
        guard let resourceBundleURL = frameworkBundle.path(forResource: fileNameString, ofType: type) else {
            return RegisterFontError.fontPathNotFound
        }
        
        guard let fontData = NSData(contentsOfFile: resourceBundleURL), let dataProvider = CGDataProvider.init(data: fontData) else {
            return RegisterFontError.invalidFontFile
        }
        
        guard let fontRef = CGFont.init(dataProvider) else {
            return RegisterFontError.initFontError
        }
        
        var errorRef: Unmanaged<CFError>? = nil
        guard CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) else   {
            return RegisterFontError.registerFailed
        }
        
        return nil
    }
}

//public enum FontSize: CaseIterable {
//    /// iPad 24.0 and iPhone 22.0
//    case h1
//    /// iPad 20.0 and iPhone 18.0
//    case h2
//    /// iPad 18.0 and iPhone 14.0
//    case h3
//    /// iPad 16.0 and iPhone 14.0
//    case h4
//    /// iPad 14.0 and iPhone 12.0
//    case h5
//    /// iPad 12.0 and iPhone 10.0
//    case h6
//
//    var size: CGFloat {
//        switch self {
//        case .h1:
//            return UIScreen.main.traitCollection.isPad ? 24.0 : 22.0
//        case .h2:
//            return UIScreen.main.traitCollection.isPad ? 20.0 : 18.0
//        case .h3:
//            return UIScreen.main.traitCollection.isPad ? 18.0 : 14.0
//        case .h4:
//            return UIScreen.main.traitCollection.isPad ? 16.0 : 14.0
//        case .h5:
//            return UIScreen.main.traitCollection.isPad ? 14.0 : 12.0
//        case .h6:
//            return UIScreen.main.traitCollection.isPad ? 12.0 : 10.0
//        }
//    }
//}

public enum CustomFonts: CaseIterable {
    case openSansSemiBold
    case openSansBold
    case openSansRegular
    case openSansLight
    case sfBold
    case sfRegular
    case sfSemiBold
    
    func fontName() -> String {
        switch self {
        case .openSansSemiBold:
            return "OpenSans-Semibold"
        case .openSansBold:
            return "OpenSans-Bold"
        case .openSansRegular:
            return "OpenSans-Regular"
        case .openSansLight:
            return "OpenSans-Light"
        case .sfBold:
            return "SF-Pro-Text-Bold"
        case .sfRegular:
            return "SF-Pro-Text-Regular"
        case .sfSemiBold:
            return "SF-Pro-Text-Semibold"
        }
    }

    func fontRegisteredName() -> String {
        switch self {
        case .openSansRegular:
            return "OpenSans"
        case .sfBold:
            return "SFProText-Bold"
        case .sfRegular:
            return "SFProText-Regular"
        case .sfSemiBold:
            return "SFProText-Semibold"
        default:
            return fontName()
        }
    }

    func fontFileExtension() -> String {
        switch self {
        case .openSansSemiBold:
            return "ttf"
        case .openSansBold:
            return "ttf"
        case .openSansRegular:
            return "ttf"
        case .openSansLight:
            return "ttf"
        case .sfBold:
            return "otf"
        case .sfRegular:
            return "otf"
        case .sfSemiBold:
            return "otf"
        }
    }
    
    public func withSize(_ size: CGFloat) -> UIFont {
        return FontHelper.font(for: self, and: size)
    }
}

public class FontHelper {
    static var registerFonts: [RegisterFontError?] =  {
        let fontNames = CustomFonts.allCases.map({($0.fontName(), $0.fontFileExtension())})
        return fontNames.map({UIFont.register(fileNameString: $0.0, type: $0.1)})
    }()
    
    public static func font(for name: CustomFonts, and size: CGFloat) -> UIFont {
        let _ = FontHelper.registerFonts
        return UIFont.nonNilFont(name: name.fontRegisteredName(), size: size)
    }
}
