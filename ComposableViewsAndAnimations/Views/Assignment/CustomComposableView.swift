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
    
    var body: some View {
        
        ZStack {
            
            ForEach(initialAngles, id: \.self) { angle in
                
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color(hue: angle/360.0, saturation: 0.8, brightness: 0.9))
                    .rotationEffect(.degrees(angle), anchor: .topLeading)
                    .offset(x: 50, y: 50)

            }
            
        }
        
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
