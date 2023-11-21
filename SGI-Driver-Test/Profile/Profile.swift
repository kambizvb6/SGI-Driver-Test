//
//  Profile.swift
//  SGI-Driver-Test
//
//  Created by Kambiz on 2023-11-03.
//

import SwiftUI
import UIKit
struct Profile: View {
    
    @State var isOn = false
    @State var userName:String = "Kambiz Dehghani"
    @State var userEmail:String = "Kdc338@uregina.ca"
    var body: some View {
        ZStack{
            Color("Backbround-Color")
            VStack{
                ZStack{
                    Rectangle()
                        .foregroundStyle(Color("HeadBackground"))
                        .frame(height: 230)
                    VStack(alignment: .center){
                        Image("AppLogo")
                            .frame(width: 100)
                            .scaledToFit()
                    }
                }
                HStack{
                    
                    ZStack{
                        Rectangle()
                            .foregroundStyle(.white)
                            .frame(width:UIScreen.main.bounds.width - 36 ,height: 130)
                            .cornerRadius(16)
                            .shadow(color: .black.opacity(0.1), radius: 2.5, x: 0, y: 3)
                            .offset(y: -70)
                            
                        
                            .overlay (
                                HStack(spacing:0){
                                    
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 90,height: 90)
                                        .overlay {
                                            Image("profile_k")
                                                .resizable()
                                                .frame(width: 80, height: 80)
                                                .clipShape(Circle())
                                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color.white, lineWidth: 2)
                                                    
                                                )
                                                
                                        }
                                        .padding(.leading,0)
                                    VStack(alignment:.leading){
                                        Text(userName)
                                            .font(
                                                Font.custom("Poppins", size: 16)
                                                    .weight(.medium)
                                            )
                                            
                                            .frame(maxWidth:.infinity, alignment: .leading)
                                            .foregroundColor(.black)
                                            
                                        Text(userEmail)
                                            .font(
                                                Font.custom("Poppins", size: 12)
                                                    .weight(.light)
                                            )
                                            .fixedSize()
                                            .frame(maxWidth:.infinity, alignment: .leading)
                                            .accentColor(.black)
                                            .foregroundColor(Color.black)
                                    }
                                    Spacer()
                                    VStack{
                                        Button {
                                            
                                        } label: {
                                            
                                            Image("EditIcon")
                                                .frame(width: 45,height: 45)
                                                .background(
                                                    Circle()
                                                        .fill(Color("EditIconBackgroud"))
                                                        .frame(width: 45, height: 45)
                                                    
                                                )
                                                .padding(.trailing,0)
                                            
                                            
                                            
                                        }
                                    }

                                }
                                .padding()
                                .offset(y:-73)
                                , alignment:.leading
                            )
                    }
                    
                    
                }
                Rectangle()
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    .frame(width:UIScreen.main.bounds.width - 36 ,height: 51)
                    .offset(y:-62)
                    .padding(.bottom,4)
                    .overlay {
                        HStack{
                            Toggle(isOn: $isOn){
                                HStack{
                                    Image("iconSound")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .foregroundStyle(.blue)
                                    Text("Sound")
                                        .font(.subheadline)
                                }
                            }
                            .padding(.horizontal,10)
                            .padding(.vertical,0)
                            .cornerRadius(10)
                        }
                        .offset(y:-64)
                    }
                Button {
                    
                } label: {
                    SettingRowView(imageName: "iconReminders", title: "Setup reminders")
                }
                .offset(y:-63)
                
                Button {
                    
                } label: {
                    SettingRowView(imageName: "iconContactUs", title: "Contact Us")
                }
                .offset(y:-63)
                
                Button {
                    
                } label: {
                    SettingRowView(imageName: "iconAboutUS", title: "About Us")
                }
                .offset(y:-63)
                
                Button {
                    
                } label: {
                    SettingRowView(imageName: "iconLogout", title: "Log Out")
                }
                .offset(y:-63)

                Spacer()
            }
            
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Profile()
}

struct SettingRowView: View {
    let imageName:String
    let title:String
    
    var body: some View {
        Rectangle()
            .foregroundStyle(.white)
            .cornerRadius(12)
            .frame(width:UIScreen.main.bounds.width - 36 ,height: 51)
            .padding(.bottom,2)
            .overlay {
                HStack{
                    Image(imageName)
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundStyle(.blue)
                    Text(title)
                        .font(.subheadline)
                        .foregroundStyle(.black)
                    Spacer()
                }
                .offset(y:-1)
                .padding(.horizontal,10)
                .padding(.vertical,0)
            }
    }
}
