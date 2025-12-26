//
//  Bundle+DesignSystem.swift
//  CommonUI
//
//  Created by kimsoomin on 12/23/25.
//

import UIKit
import CoreText

final class DesignSystemToken {}

extension Bundle {
   public static let designSystem = Bundle(for: DesignSystemToken.self)
}


public enum DesignSystemFont {

    public static func registerFonts() {
        let bundle = Bundle.module
        let fontURLs = bundle.urls(forResourcesWithExtension: "ttf", subdirectory: nil) ?? []

        for url in fontURLs {
            CTFontManagerRegisterFontsForURL(
                url as CFURL,
                .process,
                nil
            )
        }
    }
}
