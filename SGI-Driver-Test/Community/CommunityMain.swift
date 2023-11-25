//
//  Community.swift
//  SGI-Driver-Test
//
//  Created by Kambiz on 2023-11-08.
//

import SwiftUI

struct Community: View {
    @State private var favoriteColor =  1
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            
            VStack(alignment: .center) {
                Picker("What is your favorite color?", selection: $favoriteColor) {
                    Text("Latest").tag(1)
                    Text("Most View").tag(2)
                    Text("Most Popular").tag(3)
                }
                .padding(.horizontal)
                .pickerStyle(.segmented)
                
                
                ZStack{
                    Color("Backbround-Color")
                    ScrollView {
                        CommunityCell(userProfileImage: "UserProfile", userName: "Kambiz Dehghani", timeStamp: "2 Hour agao", postTitle: "Driver license in Regina City!", postContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", replyCount: "10 Reply")
                        CommunityCell(userProfileImage: "victor", userName: "Victor", timeStamp: "1 Day ago", postTitle: "Can I make a right turn on a red light?", postContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", replyCount: "100 Reply")
                    }
                    .padding(.top,8)
                }
                
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Community")
            .toolbar(content: {
                Button {
                    
                } label: {
                    Image("iconAddPost")
                        .frame(width: 26, height: 26)
                        .scaledToFit()
                }
                
            })
        }
    }
}

#Preview {
    Community()
}
