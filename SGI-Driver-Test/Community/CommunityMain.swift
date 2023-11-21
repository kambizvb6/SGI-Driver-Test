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
                        
                        //                        Text("Value: \(favoriteColor)")
                        
                        
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
//
//struct CommunityPostView: View {
//    var body: some View {
//        Rectangle()
//            .foregroundStyle(.white)
//            .cornerRadius(12)
//            .frame(width:UIScreen.main.bounds.width - 36,height: 218)
//            .padding(.bottom,4)
//            .overlay {
//                VStack(alignment: .leading) {
//                    
//                    HStack{
//                        VStack{
//                            Image("UserProfile")
//                                .resizable()
//                                .frame(width: 56, height: 56)
//                                .clipShape(Circle())
//                            Spacer()
//                        }
//                        
//                        VStack(alignment: .leading){
//                            HStack{
//                                Text("Kambiz Dehghani")
//                                    .font(
//                                        Font.custom("Poppins", size: 13)
//                                            .weight(.medium)
//                                    )
//                                Spacer()
//                                Text("32 day ago")
//                                    .foregroundStyle(Color("timeStampPost"))
//                                    .font(
//                                        Font.custom("Poppins", size: 13)
//                                            .weight(.medium)
//                                    )
//                            }
//                            Text("What is Lorem Ipsum")
//                                .font(
//                                    Font.custom("Poppins", size: 17)
//                                        .weight(.medium)
//                                )
//                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.")
//                                .font(
//                                    Font.custom("Poppins", size: 13)
//                                )
//                        }
//                        Spacer()
//                    }
//                    Divider()
//                    Spacer()
//                    HStack{
//                        Text("105 Reply")
//                            .font(
//                                Font.custom("Poppins", size: 14)
//                                    .weight(.semibold)
//                            )
//                            .foregroundColor(Color(red: 0.58, green: 0.72, blue: 0.32))
//                            .frame(width: 84, alignment: .topLeading)
//                        Spacer()
//                        Rectangle()
//                            .foregroundColor(.clear)
//                            .frame(width: 108, height: 34)
//                            .background(Color(red: 0.58, green: 0.72, blue: 0.32))
//                            .cornerRadius(8)
//                            .overlay {
//                                //
//                                HStack{
//                                    Button {
//                                        
//                                    } label: {
//                                        Image("iconReply")
//                                            .frame(width: 14.58335, height: 17.91667)
//                                        Text("Reply")
//                                            .font(Font.custom("Poppins", size: 15))
//                                            .foregroundStyle(Color.white)
//                                    }
//                                    
//                                }
//                                
//                            }
//                    }
//                }
//                
//                .padding()
//                
//            }
//            .padding(.top)
//    }
//}
