//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    
    // Initial angles of rotation for the squares
    let initialAngles: [Double] = [0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330]
    
    // Is the animation active?
    @State private var animationActive = false
    
    // List of phrases for encouragement
    let encouragement = ["You rock!", "Way to go!", "Keep it up!"]
    
    // Initialize a timer that will fire in four seconds
    // This ensures that the phrase changes when the text is covered up
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
    // What is the current position in the encouragement array?
    @State private var index = 0
    
    var body: some View {
        
        ZStack {
            
            // Text appears underneath the rectangles
            Text(encouragement[index])
                .font(.title)
                .offset(y: 25)
                .onReceive(timer) { input in
                    
                    // Change what phrase is showing
                    if index < 2 {
                        index += 1
                    } else {
                        index = 0
                    }
                                        
                }

            // Iterate over the 12 values in the array above
            ForEach(initialAngles, id: \.self) { angle in
                
                // Create a rectangle (this happens 12 times)
                Rectangle()
                    .frame(width: 100, height: 100)
                    // Set the hue based on the angle
                    .foregroundColor(Color(hue: angle/360.0, saturation: 0.8, brightness: 0.9))
                    // Initially each square is rotated according to the list of angles in the array (angle)
                    // Once the animation becomes acctive, all views are rotated to 225.0 degrees
                    .rotationEffect(.degrees(animationActive ? 225 : angle), anchor: .topLeading)
                    // Make the animation of the state change (how much square is rotated by) take 2 seconds
                    // Make the animation repeat forever, and automatically reverse itself
                    .animation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true))
                    .offset(x: 50, y: 50)
                    .onAppear() {
                        
                        // Make the animation start
                        animationActive = true
                        
                    }

            }
            
        }
        
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
