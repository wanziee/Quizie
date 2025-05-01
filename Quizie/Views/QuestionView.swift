//
//  QuestionView.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 28/01/25.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var triviaManager: TriviaManager
    @Binding var isTabBarHidden: Bool
    
    var progressColor: Color {
        switch triviaManager.category {
        case "random": return .red
        case "geography": return .yellow
        case "sport": return .green
        default: return .black
        }
    }
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [Color("backgroundColor"),.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            ScrollView{
                VStack(spacing: 40){
                    VStack{
                        ZStack {
                            Text("\(triviaManager.category.capitalized) Quiz")
                                .font(Font.custom("Oswald", size: 25))
                                .fontWeight(.bold)
                            
                            HStack {
                                NavigationLink{
                                    HomeScreen(isTabBarHidden: $isTabBarHidden)
                                } label: {
                                    Image(systemName: "chevron.left")
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color.gray)
                                }

                                
                                Spacer()
                                
                                
                            }
                        }
                        
                        VStack{
                            ProgressBar(progress: triviaManager.progress)
                            
                            HStack {
                                Text("\(triviaManager.index + 1)")
                                    .fontWeight(.heavy)
                                    .font(Font.custom("Oswald", size: 25))
                                    .foregroundStyle(progressColor)
                                Text("/ \(triviaManager.length)")
                                    .fontWeight(.heavy)
                                    .font(Font.custom("Oswald", size: 20))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }

                    

                    
                    if triviaManager.length == 0{
                        VStack {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .scaleEffect(2) // Memperbesar ukuran indikator

                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.top, 200)
                    } else {
                        VStack(alignment: .leading, spacing: 20){
                            Text(triviaManager.question)
                                .font(Font.custom("Oswald", size: 25))
                                .fontWeight(.heavy)
                                .padding(.bottom, 20)
                            
                            ForEach(triviaManager.answerChoices, id: \.id){ answer in
                                AnswerRow(answer: answer)
                                    .environmentObject(triviaManager)
                            }
                        }
                        
                        Button {
                            triviaManager.goToNextQuestion()
                        } label: {
                            PrimaryButton(text: "next", background:triviaManager.answerSelected ? Color.black : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.927))
                        }
                        
                        
                    }
                    
                    
                    
                    Spacer()
                }
                .padding()
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    QuestionView(isTabBarHidden: .constant(false))
        .environmentObject(TriviaManager())
}
