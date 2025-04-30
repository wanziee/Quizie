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
