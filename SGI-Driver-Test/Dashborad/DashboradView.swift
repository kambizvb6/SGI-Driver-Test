//
//  DashboradView.swift
//  SGI-Driver-Test
//
//  Created by Kambiz on 2023-11-23.
//

import SwiftUI

struct DashboradView: View {

    var body: some View {
        
        NavigationStack{
            ZStack {
                Color("BGColor")
                ScrollView {
                    
                    VStack{
                        HeadSliderView()
                            .padding(.vertical)
                    }
                    .padding()
                    
                    Divider()
                        .padding(.horizontal)
                    VStack{
                        ProgressBarsView()
                    }
                    .background(.white)
                    .cornerRadius(10)
                    .padding()
                    
                    Divider()
                        .padding(.horizontal)
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            DashboradItemMenu(bgColor: Color("StudyColor"), title: "Study", imageName: "Study")
                                
                            DashboradItemMenu(bgColor: Color("FlashCardColor"), title: "Flash Card", imageName: "FlashCard")
                            DashboradItemMenu(bgColor: Color("VideoColor"), title: "Video", imageName: "Video")
                            DashboradItemMenu(bgColor: Color("TipsColor"), title: "Tips", imageName: "Tips")
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
//                .padding(.top,8)
                
            .navigationTitle("Dashborad")
            .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}
#Preview {
    DashboradView()
}

struct DashboradItemMenu: View {
    
    let bgColor: Color
    let title: String
    let imageName: String
    
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 125, height: 125)
                .clipShape(
                    .rect(
                        topLeadingRadius: 20,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 20
                    )
                )
                .foregroundStyle(bgColor.gradient)
                .overlay {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                    
                }
            Rectangle()
                .frame(width: 125, height: 30)
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 20,
                        bottomTrailingRadius: 20,
                        topTrailingRadius: 0
                    )
                )
                .foregroundStyle(bgColor)
                .overlay {
                    Text(title)
                    .font(Font.custom("Poppins", size: 16))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                }
                .offset(y:-5)
        }
    }
}

struct HeadSliderView: View {
    
    @State private var currentIndex: Int = 1
    @GestureState private var dragOffset: CGFloat = 0
    private let images: [String] = ["Slider-2","Slider-1","Slider-3","Slider-4",]
    
    var body: some View {
        VStack{
            ZStack{
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 290, height: 180)
                        .cornerRadius(10)
                        .opacity(currentIndex == index ? 1.0 : 0.8)
                        .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                        .offset(x: CGFloat(index - currentIndex) * 300 + dragOffset, y:0)
                }
            }
            .gesture(
                DragGesture()
                    .onEnded({ value in
                        let threshold: CGFloat = 50
                        if value.translation.width > threshold {
                            withAnimation {
                                currentIndex = max(0, currentIndex - 1)
                            }
                        } else if value.translation.width < -threshold {
                            withAnimation {
                                currentIndex = min(images.count - 1, currentIndex + 1)
                            }
                        }
                    })
            )
        }
    }
}


struct ProgressBar : View {
    @Binding var progress: Float
    var color: Color
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(lineWidth: 15.0)
                .opacity(0.20)
                .foregroundStyle(Color.gray)
            
            Circle()
                .trim(from:0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .foregroundStyle(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1.9))
        }
    }
}

struct ProgressBarsView: View {
    @State var studyProgressValue: Float = 0.0
    @State var flashcardProgressValue: Float = 0.0
    @State var goalProgressValue: Float = 0.0
    
    var body: some View {
        VStack {
            
            HStack{
                Image("Chart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 34, height: 34)
                    Text("Progress Tracker")
                    .font(Font.custom("Poppins", size: 20))
                    .fontWeight(.semibold)
                    .padding(.top,4)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            HStack{
                VStack{
                    ProgressBar(progress: self.$studyProgressValue, color: Color("StudyColor"))
                        .frame(width: 80, height: 80)
                        .padding(10.0).onAppear(){
                            self.studyProgressValue = 0.77
                        }
                        .overlay {
                            Text("\(Int(studyProgressValue * 100))%")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color("StudyColor"))
                        }
                    Text("Study")
                        .frame(width: 100)
                        .font(
                          Font.custom("Poppins", size: 17)
                            .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                }
                 Spacer()
                VStack{
                    ProgressBar(progress: self.$flashcardProgressValue, color: Color("FlashCardColor"))
                        .frame(width: 80, height: 80)
                        .padding(10.0).onAppear(){
                            self.flashcardProgressValue = 0.40
                        }
                        .overlay {
                            Text("\(Int(flashcardProgressValue * 100))%")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color("FlashCardColor"))
                        }
                    Text("Flash Card")
                        .frame(width: 100)
                        .font(
                          Font.custom("Poppins", size: 17)
                            .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                }
                Spacer()
                VStack{
                    ProgressBar(progress: self.$goalProgressValue, color: Color("GoalColor"))
                        .frame(width: 80, height: 80)
                        .padding(10.0).onAppear(){
                            self.goalProgressValue = 0.54
                        }
                        .overlay {
                            Text("\(Int(goalProgressValue * 100))%")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color("GoalColor"))
                        }
                    Text("Goal")
                        .frame(width: 100)
                        .font(
                          Font.custom("Poppins", size: 17)
                            .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                }
            }
            
        }
        .frame(width: UIScreen.main.bounds.width - 72 ,height: 200)
        .background(Color.white)
        .padding(.horizontal)
    }
}
