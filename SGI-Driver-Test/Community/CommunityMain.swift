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
                Rectangle()
                    
                    .frame(width: .infinity, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(Color("SearchBoxColor"))
                    .padding(.horizontal,8)
                    .overlay {
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .offset(x:20)
                            Spacer()
                            TextField("", text: $searchText)
                                .offset(x:20)
                                .textInputAutocapitalization(.never)
                        }
                        
                        
                    }
                ZStack{
                    Color("Backbround-Color")
                    ScrollView {
                        Picker("What is your favorite color?", selection: $favoriteColor) {
                            Text("Red").tag(1)
                            Text("Green").tag(2)
                            Text("Blue").tag(3)
                        }
                        .padding()
                        .pickerStyle(.segmented)
                        
//                        Text("Value: \(favoriteColor)")
                        
                        ForEach(0...15, id: \.self) { index in
                            CommunityPostView()
                        }
                    }
                }
                
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

struct CommunityPostView: View {
    var body: some View {
        Rectangle()
            .foregroundStyle(.white)
            .cornerRadius(12)
            .frame(width:UIScreen.main.bounds.width - 36,height: 218)
            .padding(.bottom,4)
            .overlay {
                VStack(alignment: .leading) {
                    
                    HStack{
                        VStack{
                            Image("UserProfile")
                                .resizable()
                                .frame(width: 56, height: 56)
                                .clipShape(Circle())
                            Spacer()
                        }
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text("Kambiz Dehghani")
                                    .font(
                                        Font.custom("Poppins", size: 13)
                                            .weight(.medium)
                                    )
                                Spacer()
                                Text("32 day ago")
                                    .foregroundStyle(Color("timeStampPost"))
                                    .font(
                                        Font.custom("Poppins", size: 13)
                                            .weight(.medium)
                                    )
                            }
                            Text("What is Lorem Ipsum")
                                .font(
                                    Font.custom("Poppins", size: 17)
                                        .weight(.medium)
                                )
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.")
                                .font(
                                    Font.custom("Poppins", size: 13)
                                )
                        }
                        Spacer()
                    }
                    Divider()
                    Spacer()
                    HStack{
                        Text("105 Reply")
                            .font(
                                Font.custom("Poppins", size: 14)
                                    .weight(.semibold)
                            )
                            .foregroundColor(Color(red: 0.58, green: 0.72, blue: 0.32))
                            .frame(width: 84, alignment: .topLeading)
                        Spacer()
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 108, height: 34)
                            .background(Color(red: 0.58, green: 0.72, blue: 0.32))
                            .cornerRadius(8)
                            .overlay {
                                //
                                HStack{
                                    Button {
                                        
                                    } label: {
                                        Image("iconReply")
                                            .frame(width: 14.58335, height: 17.91667)
                                        Text("Reply")
                                            .font(Font.custom("Poppins", size: 15))
                                            .foregroundStyle(Color.white)
                                    }
                                    
                                }
                                
                            }
                    }
                }
                .padding()
                
            }
    }
}
