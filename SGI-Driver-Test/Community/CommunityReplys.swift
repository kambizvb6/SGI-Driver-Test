//
//  CommunityReplys.swift
//  SGI-Driver-Test
//
//  Created by Kambiz on 2023-11-12.
//

import SwiftUI

struct CommunityReplys: View {
    var body: some View {
        ZStack{
            Color("Backbround-Color").ignoresSafeArea()
            ScrollView{
                Rectangle()
                   .foregroundStyle(.white)
                   .frame(width: UIScreen.main.bounds.width - 36,height: 300)
                   .clipShape(RoundedRectangle(cornerRadius: 8))
                   .overlay {
                       
                   }
                   
            }
        }
       
    }
}

#Preview {
    CommunityReplys()
}
