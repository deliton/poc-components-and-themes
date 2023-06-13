//
//  Theme.swift
//  poc-components-and-themes
//
//  Created by user241705 on 6/13/23.
//

import Combine
import Foundation
import SwiftUI

// Define Theme Model
struct Theme {
  var accentPrimary: Color
  var text100: Color
  var surface1: Color
  var alertError: Color
}

// Maestro Theme Response to decode
struct ThemeResponse: Decodable {
  let _id: String
  let colors: ThemeColors
  let button: ButtonStyle

  struct ThemeColors: Decodable {
    let accentPrimary: String
    let accentSecondary: String
    let accentTertiary: String
    let alertConfirmation: String
    let alertError: String
    let alertWarning: String
    let highlightPrimary: String
    let highlightSecondary: String
    let highlightTertiary: String
    let surface1: String
    let surface2: String
    let surface3: String
    let surface4: String
    let surface5: String
    let surface6: String
    let text100: String
    let text200: String
    let text300: String
    let text400: String
    let text500: String
  }

  struct ButtonStyle: Decodable {
    let borderRadius: String
    let textCapitalization: String
  }
}

// Define Theme Model using "Color" asset catalog variables
let DefaultTheme = Theme(
  accentPrimary: Color("accentPrimary"), text100: Color("text100"), surface1: Color("surface1"),
  alertError: Color("alertError")
)

// Define a ThemeManager to manage the active theme
class ThemeManager: ObservableObject {
  @Published var theme: Theme
  private var cancellable: AnyCancellable?

  init() {
    self.theme = DefaultTheme
    updateThemeFromServer()
  }

  // Function to update the theme from the server
    func updateThemeFromServer() {
        let url = URL(string: "https://dev.api.maestro.io/themes/v1/62b3601b833d79003005faab")!
        var request = URLRequest(url: url)
        request.setValue("5fe23967e66572002ee4e189", forHTTPHeaderField: "x-maestro-client-id")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Invalid response data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let themeResponse = try decoder.decode(ThemeResponse.self, from: data)
                
                DispatchQueue.main.async {
                    let primaryColor = Color(hex: themeResponse.colors.accentPrimary)
                    let text100Color = Color(hex: themeResponse.colors.text100)
                    let surface1Color = Color(hex: themeResponse.colors.surface1)
                    let errorColor = Color(hex: themeResponse.colors.alertError)
                    
                    self.theme = Theme(
                        accentPrimary: primaryColor,
                        text100: text100Color,
                        surface1: surface1Color,
                        alertError: errorColor
                    )
                }
            } catch {
                print("Failed to decode theme response: \(error)")
            }
        }.resume()
    }
}
