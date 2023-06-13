//
//  ContentView.swift
//  poc-components-and-themes
//
//  Created by user241705 on 6/13/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var themeManager: ThemeManager
    var body: some View {
        VStack {
            // 1 - ViewModifier Approach
            Text("Hello Maestro SDK!").modifier(HeadingText())
            
            // 2 - ViewExtension Approach
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et enim id turpis feugiat iaculis ut sit amet nibh. Nulla semper, turpis at molestie scelerisque, felis leo pulvinar elit, eleifend faucibus libero lacus a turpis. Quisque et mi mauris. Nulla porta mauris et neque malesuada pharetra. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.").style(.body_xs_regular).foregroundColor(themeManager.theme.text100)
            
            // 3 - Custom Component + Modifiers Approach
            SubmitButton()
        }
        .padding()
        .background(themeManager.theme.surface1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ThemeManager())
    }
}
