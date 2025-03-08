//
//  ContentView.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 26/12/24.
//
import SwiftUI

struct OnboardingScreen: View {
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted = false
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: .init(colors: [Color("backgroundColor"),.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            VStack{
                Image("logo")
                    .padding(30)
                Image("anamatsusaki")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    
                
                VStack (spacing: 15){
                    Text("Play To Gain Your Knowledge!")
        
                        .font(Font.custom("Oswald", size: 28))
                        .fontWeight(.heavy)
                    Text("Get ready for an exciting and interactive learning experience! Start your quiz now and see how far you can take your knowledge!")
                        .font(Font.custom("Oswald", size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color("fontGray"))
                }
                .padding()
                .padding(.bottom, 20)
                
                Button {
                    isOnboardingCompleted = true
                } label: {
                    Text("Get Started")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.horizontal, 50)
                        .padding(.vertical)
                        .foregroundStyle(Color.white)
                        .background(Color.black)
                        .cornerRadius(50)
                }
                
                Spacer()
            }
            
            
        }
        
    }
}




#Preview {
    OnboardingScreen()
}
