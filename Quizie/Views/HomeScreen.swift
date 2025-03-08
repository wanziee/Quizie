//
//  HomeScreen.swift
//  Quizie
//
//  Created by mohammad ichwan al ghifari on 06/01/25.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var triviaManager : TriviaManager
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                LinearGradient(gradient: .init(colors: [Color("backgroundColor"),.white,.white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView(.vertical) {
                    VStack{
                        HStack {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(height:70)
                            Spacer()
                            Text("💎 23")
                                .font(Font.custom("Oswald", size: 17))
                                .fontWeight(.semibold)
                                .padding(.vertical, 9)
                                .padding(.horizontal, 17)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0), Color.white, Color.white]),
                                        startPoint: .topLeading,  // Pojok kiri atas transparan
                                        endPoint: .bottomTrailing // Pojok kanan bawah putih
                                    )
                                )
                                .cornerRadius(50)
                        }
                        
                        Text("Challenge your friends and family with our Quiz app, let's see who comes out on top as the ultimate quiz champion!")
                            .font(Font.custom("Oswald", size: 15))
                            .lineSpacing(.zero)
                            .foregroundStyle(Color("fontGray"))
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .leading) 
                        
                        
                        VStack(alignment: .leading){
                            Text("Popular Quizes 🔥")
                                .font(Font.custom("Oswald", size: 25))
                                .fontWeight(.heavy)
                            CardPopular()
                                .padding(.horizontal, -16)
                                .environmentObject(triviaManager)
                        }
                        

                        RecentPlayed()
                            .environmentObject(triviaManager)
                            .padding(.top)
  
                    }
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
                VStack {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(0),
                            Color.white.opacity(0.2),
                            Color.white.opacity(0.4),
                            Color.white
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 100) // Sesuaikan tinggi
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
            }

        }
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    HomeScreen()
        .environmentObject(TriviaManager())
        
}
