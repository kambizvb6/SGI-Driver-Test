//
//  CommunityCell.swift
//  SGI-Driver-Test
//
//  Created by Kambiz on 2023-11-15.
//

import SwiftUI

struct CommunityCell: View {
    @State var userProfileImage: String
    @State var userName:String
    @State var timeStamp:String
    @State var postTitle:String
    @State var postContent:String
    @State var replyCount:String
    
    var body: some View {
        VStack{
            HStack{
                
                // Image and user name and timestamp
                
                HStack(){
                    Image(userProfileImage)
                        .resizable()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                        .shadow(radius: 0.5)
                    Text(userName)
                        .font(
                            Font.custom("Poppins", size: 13)
                                .weight(.medium)
                        )
                    Spacer()
                    Text(timeStamp)
                        .foregroundStyle(Color("timeStampPost"))
                        .font(
                            Font.custom("Poppins", size: 13)
                                .weight(.medium)
                        )
                }
                .padding(.horizontal)
                .padding(.top,12)
            }
            VStack(alignment:.leading){
                Text(postTitle)
                    .font(
                        Font.custom("Poppins", size: 17)
                            .weight(.medium)
                    )
                Text(postContent)
                    .font(
                        Font.custom("Poppins", size: 13)
                    )
                    .padding(.bottom,8)
                    
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            HStack{
                Text(replyCount)
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
            .padding(.horizontal)
            .padding(.bottom,8)
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal)
        
    }
}

#Preview {
    CommunityCell(userProfileImage: "UserProfile", userName: "Victor", timeStamp: "1 Day ago", postTitle: "Are you Indian Guy ?", postContent: "Yes, I'am Indian", replyCount: "100 Reply")
}
