//
//  ItemsCard.swift
//  Quizie
//
//  Created by mohammad ichwan al ghifari on 29/04/25.
//

import SwiftUI

struct ItemsCard: View {
    @State private var quizCategories: [CardPopularModel] = [
        CardPopularModel(name: "Random", description: "Uji pengetahuan umummu dengan berbagai pertanyaan dari kategori acak.", category: "random", isLiked: false, img: "randomIMG", icon: "🧠", Color: Color.colorRandom),
        CardPopularModel(name: "Geography", description: "Tes wawasan geografi dan pengetahuan tentang berbagai negara di dunia.", category: "geography", isLiked: false, img: "geographyIMG", icon: "🌎", Color: Color.colorGeography),
        CardPopularModel(name: "Sport", description: "Tantang dirimu dengan pertanyaan seputar dunia olahraga.", category: "sport", isLiked: false, img: "sportsIMG", icon: "⚽️", Color: Color.colorSport),
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color("backgroundColor"), .white, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    ForEach(quizCategories.indices, id: \.self) { index in
                        let category = quizCategories[index]
                        
                        ZStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(category.name)
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 5)
                                    .background(Color.black)
                                    .foregroundStyle(Color.white)
                                    .font(Font.custom("Oswald", size: 25))
                                    .fontWeight(.bold)
                                    .cornerRadius(10)

                                Text(category.description)
                                    .foregroundStyle(Color.white)
                                    .font(Font.custom("Teko", size: 20))
                                    .fontWeight(.regular)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(category.Color)
                            
                            // Emoji Icon (dekorasi)
                            Text(category.icon)
                                .font(.system(size: 70))
                                .offset(x: 120, y: -45)

                            Text(category.icon)
                                .font(.system(size: 40))
                                .offset(x: 0, y: 65)

                            Text(category.icon)
                                .font(.system(size: 50))
                                .offset(x: 190, y: 50)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
#Preview {
    ItemsCard()
}
