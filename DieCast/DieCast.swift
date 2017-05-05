//
//  DieCast.swift
//  DieCast
//
//  Created by Takeshita Hidenori on 2016/01/30.
//  Copyright © 2016年 taketin. All rights reserved.
//

import UIKit

open class DieCast {

    // MARK: Settings API

    open var magnification: CGFloat?
    open var height: CGFloat?
    open var margin: CGFloat = 3.0

    // MARK: Private

    fileprivate let material: DieCastable
    fileprivate var castUtility: CastUtility

    fileprivate var castedImages: [UIImageView] {
        get {
            return "\(material)".characters.flatMap { (char: Character) -> UIImageView? in
                self._convertToImageView(char)
            }
        }
    }

    // MARK: Initializer

    public init?<T: DieCastable, C: CastType>(material: T, type: C, filenamePrefix: String?) {
        self.material = material
        castUtility = CastUtility(type: type, filenamePrefix: filenamePrefix)

        if let _ = material as? Int {
            if let type = type as? IntCast {
                switch type {
                case .custom:
                    guard let _ = filenamePrefix else {
                        return nil
                    }
                default: break
                }
            } else {
                return nil
            }
        }
    }

    public convenience init?<T: DieCastable>(material: T) {
        self.init(material: material, type: DefaultCast, filenamePrefix: nil)
    }

    // MARK: Public

    open func press() -> UIView {
        let pressedView = UIView()
        var lastImage: UIImageView? = nil

        castedImages.forEach {
            var x: CGFloat = 0
            if let lastImage = lastImage {
                x = lastImage.frame.maxX + margin
            }

            let magnification = self.magnification ?? castUtility.defaultMagnification

            let aWidth: CGFloat
            let aHeight: CGFloat
            if let height = height {
                let ratio: CGFloat = $0.frame.height / height
                aWidth = $0.frame.width / ratio
                aHeight = height
            } else {
                aHeight = $0.frame.height * magnification
                aWidth = $0.frame.width * magnification
            }

            $0.frame = CGRect(
                x: x,
                y: 0,
                width: aWidth,
                height: aHeight
            )
            lastImage = $0
            pressedView.addSubview($0)
        }

        if let lastImage = lastImage {
            pressedView.frame = CGRect(
                origin: CGPoint.zero,
                size: CGSize(
                    width: lastImage.frame.maxX,
                    height: lastImage.frame.height
                )
            )
        }

        return pressedView
    }

    // MARK: Private

    fileprivate func _convertToImageView(_ char: Character) -> UIImageView? {
        let bundle = castUtility.isCustomType ?
            Bundle.main : Bundle(for: type(of: self))

        if let filenamePrefix = castUtility.filenamePrefix {
            let image = UIImage(
                named: "\(filenamePrefix)\(char)",
                in: bundle,
                compatibleWith: nil
            )

            return UIImageView(image: image)
        }

        return nil
    }
}
