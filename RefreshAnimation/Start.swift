//
//  Start.swift
//  RefreshAnimation
//
//  Created by Nicolas Mariniello on 05/04/22.
//

import SwiftUI

struct Start: View {
    @State var showMenu: Bool = false
    
    var body: some View {
        GameView(showMenu: $showMenu)
            .ignoresSafeArea()
    }
}
