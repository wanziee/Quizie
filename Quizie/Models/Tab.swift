//
//  Tab.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 26/02/25.
//

import Foundation

enum TabModel: String, CaseIterable{
    case home = "house.fill"
    case search = "magnifyingglass"
    case notifications = "bell.fill"
    case settings = "gearshape.fill"
    
    var title: String{
        switch self{
        case.home: "Home"
        case.search: "Search"
        case .notifications: "Notification"
        case .settings: "Settings"
        }
    }
}
