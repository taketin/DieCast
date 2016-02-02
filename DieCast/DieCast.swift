//
//  DieCast.swift
//  DieCast
//
//  Created by Takeshita Hidenori on 2016/01/30.
//  Copyright © 2016年 taketin. All rights reserved.
//

import UIKit

public class DieCast {

    // MARK: Settings API

    public var magnification: CGFloat?
    public var height: CGFloat?
    public var margin: CGFloat = 3.0

    // MARK: Private

    private let material: DieCastable
    private var castUtility: CastUtility

    private var castedImages: [UIImageView] {
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
                case .Custom:
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

    public func press() -> UIView {
        let pressedView = UIView()
        var lastImage: UIImageView? = nil

        castedImages.forEach {
            var x: CGFloat = 0
            if let lastImage = lastImage {
                x = CGRectGetMaxX(lastImage.frame) + margin
            }

            let magnification = self.magnification ?? castUtility.defaultMagnification

            let aWidth: CGFloat
            let aHeight: CGFloat
            if let height = height {
                let ratio: CGFloat = CGRectGetHeight($0.frame) / height
                aWidth = CGRectGetWidth($0.frame) / ratio
                aHeight = height
            } else {
                aHeight = CGRectGetHeight($0.frame) * magnification
                aWidth = CGRectGetWidth($0.frame) * magnification
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
                origin: CGPointZero,
                size: CGSize(
                    width: CGRectGetMaxX(lastImage.frame),
                    height: CGRectGetHeight(lastImage.frame)
                )
            )
        }

        return pressedView
    }

    // MARK: Private

    private func _convertToImageView(char: Character) -> UIImageView? {
        let bundle = castUtility.isCustomType ?
            NSBundle.mainBundle() : NSBundle(forClass: self.dynamicType)

        if let filenamePrefix = castUtility.filenamePrefix {
            let image = UIImage(
                named: "\(filenamePrefix)\(char)",
                inBundle: bundle,
                compatibleWithTraitCollection: nil
            )

            return UIImageView(image: image)
        }

        return nil
    }
}