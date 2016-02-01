//
//  Cast.swift
//  DieCast
//
//  Created by Takeshita Hidenori on 2016/01/30.
//  Copyright © 2016年 taketin. All rights reserved.
//

import UIKit

let DefaultCast = IntCast.Digital

public protocol CastType {}

public enum IntCast: CastType {
    case Digital, Custom
}

struct CastUtility {
    var type: CastType
    var filenamePrefix: String? {
        get {
            if let type = type as? IntCast {
                switch type {
                case .Digital:
                    return "diecast_digital_"
                case .Custom:
                    return customFilenamePrefix
                }
            }

            return nil
        }
    }
    var defaultMagnification: CGFloat {
        get {
            if let type = type as? IntCast {
                switch type {
                case .Digital:
                    return 0.1
                case .Custom:
                    return 1.0
                }
            }

            return 0
        }
    }
    var isCustomType: Bool {
        get {
            if let type = type as? IntCast {
                switch type {
                case .Digital:
                    return false
                case .Custom:
                    return true
                }
            }

            return false
        }
    }

    private(set) var customFilenamePrefix: String?

    // MARK: Initializer

    init<T: CastType>(type: T, filenamePrefix: String?) {
        self.type = type
        self.customFilenamePrefix = filenamePrefix
    }
}