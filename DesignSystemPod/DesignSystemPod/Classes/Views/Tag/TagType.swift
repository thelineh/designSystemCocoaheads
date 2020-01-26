//
//  TagType.swift
//  DesignSystemPod
//
//  Created by Aline Ghizzi on 26/01/20.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit

public enum TagType: CaseIterable {
    public static var allCases: [TagType] {
        return [.subscriber, .custom(title: "custom")]
    }
    
    public typealias AllCases = [TagType]
    
    case subscriber
    case custom(title: String?)

    var title: String {
        switch self {
        case .subscriber:
            return "ASSINANTE"
        case .custom(let title):
            return title ?? ""
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .subscriber:
            return GlobalConfiguration.configuration.color.brandColor
        case .custom(_):
            return GlobalConfiguration.configuration.color.darkColor
        }
    }

    var fontColor: UIColor {
        switch self {
        case .custom(_):
            return GlobalConfiguration.configuration.color.secondaryColor
        default:
            return GlobalConfiguration.configuration.color.primaryColor
        }
    }
    
    var borderRadius: CGFloat {
        switch self {
        default:
            return GlobalConfiguration.configuration.cornerRadiusSize
        }
    }
    
    var font: CustomFonts {
        switch self {
        case .custom(_):
            return GlobalConfiguration.configuration.font.regular
        default:
            return GlobalConfiguration.configuration.font.bold
        }
    }
}
