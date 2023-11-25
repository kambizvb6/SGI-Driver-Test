//
//  Dashborad.swift
//  SGI-Driver-Test
//
//  Created by Kambiz on 2023-11-03.
//

import SwiftUI

struct Dashborad: View {
    @State var selectedTab = "1"
    
   
    
    var body: some View {
        TabView (selection: $selectedTab)
        {
            DashboradView()
                .tag("1")
                .tabItem {
                    Label("", image: selectedTab == "1" ? "DashboradSelected" : "Dashborad" )
                }
            Text("Exam")
                .tag("2")
                .tabItem {
                    Label("", image: selectedTab == "2" ? "ExamSelected" : "Exam")
                }
            Community()
                .tag("3")
                .tabItem {
                    Label("", image: selectedTab == "3" ? "CommunitySelected" : "Community")
                }
            Profile()
                .tag("4")
                .tabItem {
                    Label("", image: selectedTab == "4" ? "ProfileSelected" : "Profile")
                }
        }
    }
}

#Preview {
    Dashborad()
}
