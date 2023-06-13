//
//  View.swift
//  poc-components-and-themes
//
//  Created by user241705 on 6/13/23.
//

import Foundation
import SwiftUI

enum CustomViewStyle {
    case body_xs_bold
    case body_xs_regular
}

extension View {
    @ViewBuilder func style(_ style: CustomViewStyle) -> some View {
        switch style {
        case .body_xs_bold:
            self.font(.system(size: 14, weight: .bold)).lineLimit(nil).frame(maxHeight: 100)
        case .body_xs_regular:
            self.font(.system(size: 14, weight: .regular)).lineLimit(nil).frame(maxHeight: 100)
        }
    }
}
