# RefreshAnimation

This is part of a greater effort to explain the importance of Animation&Motion inside mobile applications and games, developed @ Apple Developer Academy | Naples. The effort consists in four different repositories, each containing a single animation. You'll find the main GitHub repository containing further information at the link below.

https://github.com/seldon1000/SwiftUI_Animations

RefreshAnimation is a XCode project, containing an application prototype showcasing a refresh animation of a grid of dots and a detailed explanation of how to implement the animation in SwiftUI.

## Refresh that grid

Let's talk about how to refresh a grid of dots and hot to animate it in a smooth and crisp way.

![Alt Text](https://github.com/seldon1000/RefreshAnimation/blob/main/refresh.gif)

Cool, but how? Nothing special actually, in fact we will use the same components discussed in the SwipeAnimation repository (https://github.com/seldon1000/SwipeAnimation). Below, there's a ```longPressGesture``` we apply to the whole view in the Start file.

```swift
.onLongPressGesture {
    withAnimation(.easeInOut) {
        showMenu = true
    }
}
```

When the menu is shown, there is just one button for refreshing the grid. Below, you'll find the ```MenuView``` called by ```Start```. We pass a closure which holds the action to execute when refreshing the grid. Here, we just call the ```refreshGrid``` method of the grid object, then, when the refresh is done internally, we hide the menu with an animation. This animation is delayed by 0.3 seconds using ```DispatchQueue```.

```swift
MenuView() {
    grid.resetGrid()
                        
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        withAnimation(.easeInOut) {
            showMenu = false
        }
    }
}
```

And now? Let's analyze the ```resetGrid``` function. We reset the ```dotsToWin``` counter. Then, we iterate throughout all the dots inside our grid. If the dot is not an obstacle, and neither the starting dot, we decolor it with an animation. As we've seen previously, a coloring/decoloring a dot, makes it scale down to 0 or to 1 accordingly.

```swift
func resetGrid() {
    dotsToWin = 0
        
    for i in 0..<dots.count {
        for dot in dots[i] {
            if !dot.isObstacle && dot.coordinates != startDot {
                withAnimation(.easeInOut) {
                    currentDot = startDot
                    dot.isColored = false
                }
                    
                dotsToWin += 1
            }
        }
    }
}
```

Kinda simple. For more animations, refer to the link down below.

https://github.com/seldon1000/SwiftUI_Animations
