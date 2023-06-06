//
//  ContentView.swift
//  Cannassaince
//
//  Created by apple on 29/05/2023.
//

import SwiftUI

struct SplashScreenView: View{
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
      
            VStack {
                VStack {
                    Image(AppImages.imgSplash)
                        .resizable()
                        .ignoresSafeArea()
                        .overlay {
                            Image(AppImages.imgLogGreen)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 217.38, height: 122)
                                .scaleEffect(size)
                                .opacity(opacity)
                        }
                }
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}



