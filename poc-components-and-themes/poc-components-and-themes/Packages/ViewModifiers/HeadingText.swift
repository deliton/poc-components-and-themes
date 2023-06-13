//
//  HeadingText.swift
//  poc-components-and-themes
//
//  Created by user241705 on 6/13/23.
//

import Foundation
import SwiftUI

struct HeadingText: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    func body(content: Content) -> some View {
        content
            .font(.system(size: 36))
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .foregroundColor(themeManager.theme.text100)
    }
}
