//
//  QuizConfirmationView.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 22/02/25.
//

import SwiftUI

struct QuizConfirmationView: View {
    let category: String
    @EnvironmentObject var triviaManager : TriviaManager
    @State private var isTriviaReady = false
    
    let categoryIcons: [String: String] = [
        "random": "🧠",
        "geography": "🌎",
        "sport": "⚽️"
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color("backgroundColor"), .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                let icon = categoryIcons[category.lowercased()] ?? "❓" // Ambil ikon sesuai kategori
                
                Text("\(icon)")
                    .font(.system(size: 90))
                Text("Ready for the \(category.capitalized) Quiz?")
                    .font(Font.custom("Oswald", size: 25))
                    .fontWeight(.bold)
                
                Text("Test your knowledge and become the champion!")
                    .font(Font.custom("Teko", size: 18))
                    .foregroundStyle(Color("fontGray"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Button(action: {
                    Task {
                        
                        isTriviaReady = true
                    }
                }) {
                    PrimaryButton(text: "Start Quiz")
                        .font(Font.custom("Oswald", size: 17))
                }
                .padding(.top, 10)
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationDestination(isPresented: $isTriviaReady) {
            TriviaView()
                .environmentObject(triviaManager)
        }
        .onAppear {
            Task {
                triviaManager.playQuiz(category: category)
            }
        }
    }
}

#Preview {
    QuizConfirmationView(category: "random")
        .environmentObject(TriviaManager())
}
