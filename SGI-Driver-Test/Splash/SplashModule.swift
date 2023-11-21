//
//  SplashModule.swift
//  SGI-Driver-Test
//
//  Created by Kambiz on 2023-11-01.
//

import SwiftUI

struct SplashModule: View {
    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                HStack{
                    Image("Logo")
                        .frame(width: 250)
                    
                }
                Spacer()
                Text("Driving Test Application")
                    .foregroundStyle(.white)
                    .font(.custom("Poppins-Regular", size: 12))
                    .kerning(4.0)
                    
            }
        }
    }
}

#Preview {
    SplashModule()
}
