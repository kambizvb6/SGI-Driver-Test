//
//  ContentView.swift
//  SGI-Driver-Test
//
//  Created by Kambiz on 2023-11-01.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    var body: some View {
        ZStack{
            if showSplash {
                SplashModule()
                    .transition(.opacity)
                    .animation(.easeIn, value: 1.5)
            } else {
                Dashborad()
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                withAnimation {
                    self.showSplash = false
                }
            }
        })
    }
}

#Preview {
    ContentView()
}
