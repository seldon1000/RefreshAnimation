//
//  GameView.swift
//  SwiftUI_Animations
//
//  Created by Nicolas Mariniello on 28/03/22.
//

import SwiftUI

struct GameView: View {
    @State var grid: Grid = Grid(level: level)
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                ForEach(0..<grid.rows, id: \.self) { i in
                    HStack(spacing: 0) {
                        ForEach(grid.dots[i]) { dot in
                            DotComponent(dot: dot)
                        }
                    }
                }
            }
            .environmentObject(grid)
            .contentShape(Rectangle())
            .scaleEffect(showMenu ? 0.6 : 1.0)
            .frame(width: UIScreen.main.bounds.width * (showMenu ? 0.6 : 1.0), height: UIScreen.main.bounds.height * (showMenu ? 0.6 : 1.0))
            .onTapGesture {
                withAnimation(.easeInOut) {
                    showMenu = false
                }
            }
            .onLongPressGesture {
                withAnimation(.easeInOut) {
                    showMenu = true
                }
            }
            .gesture(DragGesture().onEnded { value in
                if !showMenu {
                    if grid.dragGesture(translation: value.translation) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.easeInOut) {
                                showMenu = false
                                
                                grid.resetGrid()
                            }
                        }
                    }
                }
            })
            if showMenu {
                MenuView() {
                    grid.resetGrid()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.easeInOut) {
                            showMenu = false
                        }
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * (showMenu ? 0.6 : 1.0), height: UIScreen.main.bounds.height * (showMenu ? 0.6 : 1.0))
    }
}
