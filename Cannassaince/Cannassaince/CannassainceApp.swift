//
//  CannassainceApp.swift
//  Cannassaince
//
//  Created by apple on 29/05/2023.
//

import SwiftUI

@main
struct CannassainceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


struct ContentView: View {
    @State private var showOnBoarding = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if showOnBoarding {
                    OnBoardingView()
                } else {
                    SplashScreenView()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    showOnBoarding = true
                                }
                            }
                        }
                }
            }
            .navigationBarHidden(true)
        }
    }
}
