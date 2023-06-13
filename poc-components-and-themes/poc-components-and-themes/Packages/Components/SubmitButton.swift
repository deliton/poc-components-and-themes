//
//  SubmitButton.swift
//  poc-components-and-themes
//
//  Created by user241705 on 6/13/23.
//

import Foundation
import SwiftUI

struct SubmitButton: View {
    @EnvironmentObject var themeManager: ThemeManager
    var body: some View {
        Button(action: {
            // Perform submit action
        }) {
            Text("SUBMIT")
                .padding(16)
                .foregroundColor(themeManager.theme.text100)
        }
        .frame(maxWidth: .infinity)
        .background(themeManager.theme.accentPrimary)
        .cornerRadius(8)
        .buttonStyle(PlainButtonStyle())
    }
}
