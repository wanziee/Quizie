//
//  CategoriesViewModel.swift
//  Quizie
//
//  Created by mohammad ichwan al ghifari on 30/04/25.
//

import Foundation
import SwiftUI


class CategoriesViewModel: ObservableObject{
    @Published var quizData: [CardPopularModel] = quizCategories
}
