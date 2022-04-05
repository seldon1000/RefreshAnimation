//
//  MenuView.swift
//  SwiftUI_Animations
//
//  Created by Nicolas Mariniello on 28/03/22.
//

import SwiftUI

struct MenuView: View {
    let resetLevel: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            CircularMenuButton(label: "arrow.clockwise", action: resetLevel)
        }
    }
}
