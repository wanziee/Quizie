//
//  RecentPlayed.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 21/02/25.
//

import SwiftUI

import SwiftUI

struct RecentPlayed: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @State private var navigateToQuiz = false

    var body: some View {
        VStack {
            Text("Recent Played")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.custom("Oswald", size: 25))
                .fontWeight(.heavy)

            VStack(spacing: 15) {
                if triviaManager.recentPlayed.isEmpty {
                    Text("No recent quizzes played yet.")
                        .font(Font.custom("Oswald", size: 17))
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ForEach(triviaManager.recentPlayed) { item in
                        HStack {
                            Text(item.icon) // Menggunakan ikon dari RecentPlayedModel
                                .font(.system(size: 40))
                            VStack(alignment: .leading) {
                                Text(item.category)
                                    .fontWeight(.semibold)
                                    .font(Font.custom("Oswald", size: 20))
                                Text("Score: \(item.score)/\(item.totalQuestions)") // Menampilkan skor
                                    .font(Font.custom("Oswald", size: 15))
                                    .foregroundStyle(Color.gray)
                            }
                            Spacer()
                            NavigationLink{
                                
                                QuizConfirmationView(category: item.category.lowercased())
                                    .environmentObject(triviaManager)
                                
                            }label: {
                                PlayAgainButton(text: "Play Again")
                            }

                        }
                    }
                }
            }

        }
    }
}

#Preview {
    RecentPlayed()
        .environmentObject(TriviaManager())
}
