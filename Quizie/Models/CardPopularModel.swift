//
//  CardPopularManager.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 15/02/25.
//

import Foundation
import SwiftUICore

struct CardPopularModel: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let category: String
    var isLiked: Bool
    let img: String
    let icon: String
    let Color: Color
    

}

let quizCategories: [CardPopularModel] = [
        CardPopularModel(name: "Random", description: "Uji pengetahuan umummu dengan berbagai pertanyaan dari kategori acak.", category: "random", isLiked: false, img: "randomIMG", icon: "🧠", Color: Color.colorRandom),
        CardPopularModel(name: "Geography", description: "Tes wawasan geografi dan pengetahuan tentang berbagai negara di dunia.", category: "geography", isLiked: false, img: "geographyIMG", icon: "🌎", Color: Color.colorGeography),
        CardPopularModel(name: "Sport", description: "Tantang dirimu dengan pertanyaan seputar dunia olahraga.", category: "sport", isLiked: false, img: "sportsIMG", icon: "⚽️", Color: Color.colorSport),

]
