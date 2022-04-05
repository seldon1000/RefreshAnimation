//
//  MenuView.swift
//  RefreshAnimation
//
//  Created by Nicolas Mariniello on 05/04/22.
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
