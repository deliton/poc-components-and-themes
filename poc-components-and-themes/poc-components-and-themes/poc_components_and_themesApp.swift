//
//  poc_components_and_themesApp.swift
//  poc-components-and-themes
//
//  Created by user241705 on 6/13/23.
//

import SwiftUI

@main
struct poc_components_and_themesApp: App {
    @StateObject var themeManager = ThemeManager()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(themeManager)
        }
    }
}
