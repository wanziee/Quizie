//
//  RecentPlayedModel.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 22/02/25.
//

import Foundation


struct RecentPlayedModel: Identifiable, Codable {
    var id = UUID()
    let category: String
    let score: Int
    let totalQuestions: Int
    let icon: String
}
