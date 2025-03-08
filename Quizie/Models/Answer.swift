//
//  Answer.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 28/01/25.
//

import Foundation

struct Answer: Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
