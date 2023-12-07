//
//  Color.swift
//  CryptoTracker
//
//  Created by Nemanja Vlahovic on 7.12.23..
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("CryptoGreenColor")
    let red = Color("CryptoRedColor")
    let secondaryText = Color("SecondaryTextColor")
}
