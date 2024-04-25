//
//  Ext+view.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import Foundation
import SwiftUI

struct MainButtonStyle: ButtonStyle {
    typealias Body = Button
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .mainBackground()
    }
}



extension View {
    
    func mainButtonStyle() -> some View {
        buttonStyle(MainButtonStyle())
    }
    
    func mainBackground(_ color: Color = Color.gray) -> some View {
        background(color.opacity(0.6).clipShape(RoundedRectangle(cornerRadius: 8)))
    }
}
